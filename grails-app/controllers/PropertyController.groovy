import de.andreasschmitt.richui.taglib.renderer.RenderException
import de.andreasschmitt.richui.taglib.renderer.Renderer
import java.text.SimpleDateFormat

class PropertyController {
    static namespace = "richui"
    Renderer mapRenderer

    def postCodeService

    def index = {redirect(action: list, params: params)}

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']

    def search = {
        def criteria = Property.createCriteria()
        def properties
		try {
     


        properties = criteria.list {
            if (params.qCategory != "")
                eq('category', params.qCategory)
            if (params.qOfferMin != "" && params.qOfferMax != "")
                between('minPrice', Integer.parseInt(params.qOfferMin), Integer.parseInt(params.qOfferMax))
            if (params.qnbBedR != "")
                between('bedroomNumber', Integer.parseInt(params.qnbBedR), 99)
            if (params.qPostCode != "")
                eq('postCode', params.qPostCode)
        }
		render(view: 'list', model: [propertyList: properties])
		} catch (NumberFormatException e) {
            def listed = Property.list(params)
			render(view: 'list', model: [propertyList: listed])
        }
    }

    def list = {

        if (params.isPersonalList != null && params.isPersonalList == "true")
        {
            def principal = PrincipalService.getPrincipal()
            if (principal != null && principal!="anonymousUser")
            {
                if (((String)(principal.getAuthorities()[0])) == "ROLE_SELLER")
                {
                    def seller = Seller.findById(principal.domainClass.id)
                    if (seller != null)
                    {
                        def sellerProperties = Property.findAll("from Property as i where i.isSoldBy.id=?", seller.id)
                        if (sellerProperties != null)
                        {// if the logged user is a seller then retrieve his properties.
                            return [propertyList: sellerProperties]
                        }
                    }
                }
                else if (((String)(principal.getAuthorities())[0]) == "ROLE_BUYER")
                {
                    def buyer = (Buyer) Buyer.findByUsername(principal.getUsername())
                    if (buyer != null)
                    {

                        def buyerInterestList = Interested.findAll("from Interested as i where i.myBuyer.id=?", buyer.id)


                        def plist = []

                        buyerInterestList.each {ob -> plist.add(ob.myProp)}
                        if (buyerInterestList != null)
                        {// if the logged user is a seller then retrieve his properties.
                            return [propertyList: plist]
                        }
                    }
                } else if (((String) (principal.getAuthorities())[0]) == "ROLE_ESTATEAGENT")
                {
                    def agent = (EstateAgent) EstateAgent.findByUsername(principal.getUsername())
                    if (agent != null)
                    {

                        def agentList = Property.findAll("from Property as i where i.isManagedBy.id=? and (i.validated=null or i.validated=false)", agent.id)
                        if (agentList != null)
                        {// if the logged user is a seller then retrieve his properties.
                            return [propertyList: agentList] 
                        }
                    }
                }
            }
        }
        else
        {
            def listed = Property.list(params)
            return [propertyList: listed]
        }
    }

    def show = {
        def property = Property.get(params.id)
        // Call postcode service
        def latLong = ((PostCodeLatLong) postCodeService.getPostCodeCentre((String) property.postCode))
        // Get latitude
        def lat = latLong.centre.lat
        // Get longitude
        def lng = latLong.centre.lon

        def date = []
        def isRemovable = false;

        def principal = PrincipalService.getPrincipal()
        if (principal != null && principal!="anonymousUser")
        {
            if (((String) (principal.getAuthorities())[0]) == "ROLE_BUYER")
            {
                def buyer = (Buyer) Buyer.findByUsername(principal.getUsername())
                if (buyer != null)
                {
                    def buyerInterestList = Interested.findAll("from Interested as i where i.myBuyer.id=?", buyer.id)


                    def plist = []

                    buyerInterestList.each {ob -> plist.add(ob.myProp)}
                    if (buyerInterestList != null)
                    {// if the logged user is a seller then retrieve his properties.
                        if (plist.contains(property)) {
                            isRemovable = true;
                        }
                    }
                }
            }
        }


        if (property.availableFrom != null)
        {
            for (i in 0..(property.availableFrom.length - 1))
            {
                date << property.availableFrom[i]
            }
        }
        if (!property) {
            flash.message = "Property not found with id ${params.id}"
            redirect(action: list)
        }
        else {
            return ['property': property, 'availableFrom': date, 'resultLat': lat, 'resultLng': lng, 'isRemovable': isRemovable]
        }
    }

    def delete = {
        def property = Property.get(params.id)
        if (property) {

            //deleting of the pictures associated

            def dirToDelete = new File("web-app/images/properties/${property.id}")
            //def dirToDelete = new File(new File(new File(new File("web-app"),"images"),"properties"),"${property.id}")
            if (dirToDelete != null)
                deleteDirectory(dirToDelete)

            property.delete(flush:true)

            flash.message = "Property ${params.id} deleted"
            redirect(action: list)
        }
        else {
            flash.message = "Property not found with id ${params.id}"
            redirect(action: list)
        }
    }

    def edit = {
        def property = Property.get(params.id)
        def visitTimeCount = 0
        if (property && property.availableFrom != null)
        {
            visitTimeCount = (property.availableFrom.length / 2)
        }

        if (!property) {
            flash.message = "Property not found with id ${params.id}"

            redirect(controller:"property", action: "list")
        }
        else {
            return ['property': property, 'visitTimeCount': visitTimeCount]
        }
    }

    def addInterest = {
        def property = Property.get(params.id)
        def principal = PrincipalService.getPrincipal()
        if (principal != null)
        {
            if (((String) principal.getAuthorities()[0]) == "ROLE_BUYER")
            {
                def buyer = (Buyer) Buyer.findByUsername(principal.getUsername())
                if (buyer != null)
                {
                    def i = new Interested(myProp: property, myBuyer: buyer)
                    i.save(flush: true)
                }
            }
        }
        redirect(action: list)
        return ['property': property]
    }

    def removeInterest = {
        def property = Property.get(params.id)
        def principal = PrincipalService.getPrincipal()
        if (principal != null)
        {
            if (((String) principal.getAuthorities()[0]) == "ROLE_BUYER")
            {
                def buyer = (Buyer) Buyer.findByUsername(principal.getUsername())
                if (buyer != null)
                {
                    def buyerInterestList = Interested.findAll("from Interested as i where i.myProp.id=? and i.myBuyer.id=?", property.id, buyer.id)
                    buyerInterestList.each {o -> def i = Interested.get(o.id); i.delete()}
                }
            }
        }
        redirect(action: list)
        return ['property': property]
    }
    def validate = {
        def property = Property.get(params.id)
        if (property != null)
        {
            property.validated=true
            property.save(flush:true)
        }
        redirect(action: list)
        return ['property': property]
    }


    def update = {
        def property = Property.get(params.id)
        def properties = params.getProperties()
        def d1
        def d2
        def dates = []
        def visitTimeCount
        def vis = params.visitTimeCount
        if (vis != "" && vis != null)
            visitTimeCount = Integer.parseInt(vis)
        else
        {
            if (property.availableFrom != null)
                visitTimeCount = property.availableFrom.length
            else
                visitTimeCount = 0
        }
        def sdf = new SimpleDateFormat("dd/MM/yyyy")
        if (params.availableFrom1 != null &&
                params.availableFrom1_day != null &&
                params.availableFrom1_month != null &&
                params.availableFrom1_year != null)
            d1 = sdf.parse("${params.availableFrom1_day}/${params.availableFrom1_month}/${params.availableFrom1_year}")
        if (params.availableFrom2 != null &&
                params.availableFrom2_day != null &&
                params.availableFrom2_month != null &&
                params.availableFrom2_year != null)
            d2 = sdf.parse("${params.availableFrom2_day}/${params.availableFrom2_month}/${params.availableFrom2_year}")
        dates << d1 << d2
        if (visitTimeCount > 1)
        {
            for (i in 2..visitTimeCount)
            {
                if (params.availableFrom1 != null &&
                        params.getAt("availableFrom1_${i}_day") != null &&
                        params.getAt("availableFrom1_${i}_month") != null &&
                        params.getAt("availableFrom1_${i}_year") != null)
                    dates << sdf.parse("${params.getAt("availableFrom1_${i}_day")}/${params.getAt("availableFrom1_${i}_month")}/${params.getAt("availableFrom1_${i}_year")}")
                if (params.availableFrom1 != null &&
                        params.getAt("availableFrom2_${i}_day") != null &&
                        params.getAt("availableFrom2_${i}_month") != null &&
                        params.getAt("availableFrom2_${i}_year") != null)
                    dates << sdf.parse("${params.getAt("availableFrom2_${i}_day")}/${params.getAt("availableFrom2_${i}_month")}/${params.getAt("availableFrom2_${i}_year")}")
            }
        }
        property.availableFrom = dates
        if (!property.hasErrors() && property.save())
        {
            imageAdd(property.id)
        }

        if (property) {
            property.properties = params
            if (!property.hasErrors() && property.save()) {
                flash.message = "Property ${params.id} updated"
                //redirect(action:show,id:property.id)
                redirect(uri: "/property/list")
            }
            else {
                //render(view:'edit',model:[property:property])

                chain(action: "edit", id: params.id, params: ['visitTimeCount': visitTimeCount])
            }
        }
        else {
            flash.message = "Property not found with id ${params.id}"
            redirect(action: edit, id: params.id)
        }
    }

    def create = {
        def p = params
        def property = new Property()
        def visitTimeCount = 1
        def dates = [new Date(), new Date()]
        property.availableFrom = dates;
        property.properties = params;
        if (property.availableFrom != null)
        {
            visitTimeCount = (property.availableFrom.length / 2)
        }
        return ['property': property, 'visitTimeCount': visitTimeCount]
    }

    // action called in edit action by an ajax request, to delete the pictures
    def deleteImage =
    {
        def pictures = []; def picturesType = []
        def property = Property.get(Long.parseLong(params.id))
        if (property.picture != null)
            pictures = (List) property.picture
        if (property.pictureType != null)
            picturesType = (List) property.pictureType
        def imageToDelete = (String) params?.imageId
        def imageURL = "web-app/images/properties/${imageToDelete}"
        def imageFile = new File(imageURL)
        if (imageFile != null)
        {
            if (imageFile.delete())
            {// the file has been successfully deleted
                //removing the pictures attribute from the property
                int indexOfPic = pictures.findIndexOf {it == imageToDelete}
                pictures.remove(indexOfPic)
                property.picture = (String[]) pictures
                picturesType.remove(indexOfPic)
                property.pictureType = (String[]) picturesType
                redirect(action: edit, id: property.id)
                // def response = (String)"The file ${(imageToDelete).substring(imageToDelete.lastIndexOf("/")+1)} has been successfully deleted"
                //render response
            }
            else
                render = "Problem, impossible to delete the file"
        }
        else
            render = "A Problem has occured"

    }

    def showMap = {
        def attrs = params
        attrs.key = "ABQIAAAAPV8yFSv3BrLOmXDSgOZToBSZdinvBdzatcCUIyBeKyYBtjjO1RTYrMLX9IGAE-tlgH2Br-wU1D-D6g"
        if (!attrs?.key) {
            throw new Exception("Attribute key is required")
        }

        if (!attrs?.version) {
            attrs.version = "2.x"
        }

        if (!attrs?.lat) {
            attrs.lat = ""
        }

        if (!attrs?.lng) {
            attrs.lng = ""
        }

        if (!attrs?.zoomLevel) {
            attrs.zoomLevel = "13"
        }

        String mapIntegrationVar = "gi"

        if (!attrs?.mapIntegrationVar) {
            attrs.mapIntegrationVar = mapIntegrationVar
        } else {
            attrs.mapIntegrationVar = attrs.mapIntegrationVar
        }

        String mapId = mapIntegrationVar + "map"
        String dirId = mapIntegrationVar + "directions"
        String latId = "latitude"
        String lngId = "longitude"
        boolean draggable = true

        if (!attrs?.mapId) {
            attrs?.mapId = mapId
        }
        if (!attrs?.dirId) {
            attrs?.dirId = dirId
        }
        if (!attrs?.latId) {
            attrs.latId = latId
        }
        if (!attrs?.lngId) {
            attrs.lngId = lngId
        }

        if (attrs?.draggable) {
            attrs.draggable = attrs.draggable == "true" ? true : false
        } else {
            attrs.draggable == "true"
        }

        boolean showStartMarker = true

        if (attrs?.showStartMarker) {
            attrs.showStartMarker = attrs.showStartMarker == "true" ? true : false
        } else {
            attrs.showStartMarker = true
        }

        attrs.routeStart = message("code": "map.route.start")
        attrs.routeDestination = message("code": "map.route.destination")
        attrs.routeOk = message("code": "map.route.ok")
        attrs.routeClear = message("code": "map.route.clear")

        attrs.searchSearch = message("code": "map.search.search")
        attrs.searchOk = message("code": "map.search.ok")

        if (!attrs.directionsLocale) {
            attrs.directionsLocale = "${request?.locale?.language}_${request?.locale?.country}"
        }

        if (!attrs?.style) {
            attrs.style = "width: 750px; background: #F1F1F1; border: 1px solid #F1F1F1;\""
        }
        if (!attrs?.'class') {
            attrs.'class' = ""
        }

        if (!attrs?.mapStyle) {
            attrs.mapStyle = "width: 750px; height: 300px;"
        }
        if (!attrs?.mapStyleClass) {
            attrs.mapStyleClass = ""
        }

        //Render output
        try {
            OutputStream out = response.getOutputStream()
            out << mapRenderer.renderTag(attrs)
            out.close();
        }
        catch (RenderException e) {
            log.error(e)
        }
    }

    // Add images to a property with the multipartfiles passed in the HTTPrequest
    private void imageAdd(Long propertyId)
    {
        def property = Property.get(propertyId)
        def properties = params.getProperties()
        def f
        def pictures = [] //list of pictures file names
        if (property.picture != null)
            pictures = (List) property.picture
        else
            property.picture = []

        def fileCount = params.fileCount
        if (fileCount != null && fileCount != "")
            fileCount = Integer.parseInt(fileCount)
        else
            fileCount = 0

        def picturesType = [] //list of picure file content types

        if (property.pictureType != null)
            picturesType = (List) property.pictureType
        else
            property.pictureType = []

        def okcontents = ['image/png', 'image/jpeg', 'image/gif'] // content types that are suitable
        //map of the content type with the corresponding extension to add to the file name, regarding the content type
        def okextensions = ['image/png': 'png', 'image/jpeg': 'jpg', 'image/gif': 'gif']

        if (fileCount != 0)
        {
            for (i in 1..fileCount)
            {
                f = (org.springframework.web.multipart.commons.CommonsMultipartFile) request.getFile("picture_${i}")
                if (f.getSize() > 0)
                {
                    if (!okcontents.contains(f.getContentType()))
                    {
                        flash.message = "Avatar must be one of: ${okcontents}"
                        //render(view:'select_avatar', model:[user:user])
                        //return;
                    }
                    else
                    {

                        //if no null and suitable, then storing it to the images/properties directory
                        //def srcDir = new File(new File(new File(new File("web-app"),"images"),"properties"),"${property.id}")
                        def srcDir = new File("web-app/images/properties/${property.id}")

                        //= new File("web-app/images/properties/${property.id}")
                        srcDir.mkdirs() //directory creation if needed (eg properties dir)
                        def imageId = "img_${pictures.size() + 1}"
                        def fileExtension = "${okextensions[((String) f.getContentType())]}"
                        def filename = "${imageId}.${fileExtension}"
                        String chemin = "web-app/images/properties/${property.id}"

                        def out = new DataOutputStream(new FileOutputStream(new File(srcDir, filename)))
                        out.write(f.getBytes())
                        out.close()
                        //f.transferTo( new File(srcDir,filename) )
                        picturesType.add((String) f.getContentType())
                        pictures.add((String) "${property.id}/${filename}")
                        log.info("File ${filename} uploaded: ")
                    }
                }

            }
            //storage of the new images info in the property domain object

            property.picture = (String[]) pictures
            property.pictureType = (String[]) picturesType
            property.save()
        }
    }
    //recursive method to delete a whole directory even if not empty
    static public boolean deleteDirectory(File path) {
        boolean resultat = true;
        if (path.exists()) {
            File[] files = path.listFiles()
            for (int i = 0; i < files.length; i++) {
                if (files[i].isDirectory()) {
                    resultat &= deleteDirectory(files[i])
                }
                else {
                    resultat &= files[i].delete()
                }
            }
        }
        resultat &= path.delete()
        return (resultat)
    }

    def save = {
        def property = new Property(params)
        def d1 //Date
        def d2 //Date
        def dates = []
        def properties = params.getProperties()
        def vis = params.visitTimeCount
        def visitTimeCount //number of dates periods (so the half of the actual number of dates in property.dates[]
        if (vis != "" && vis != null)
            visitTimeCount = Integer.parseInt(vis)
        else
        {//retrieving the input countaining the number of dates passed in the request params
            if (property.availableFrom != null)
                visitTimeCount = property.availableFrom.length
            else
                visitTimeCount = 0
        }
        // retrieve the dates from the request params
        def sdf = new SimpleDateFormat("dd/MM/yyyy")
        if (params.availableFrom1 != null &&
                params.availableFrom1_day != null &&
                params.availableFrom1_month != null &&
                params.availableFrom1_year != null)
            d1 = sdf.parse("${params.availableFrom1_day}/${params.availableFrom1_month}/${params.availableFrom1_year}")
        if (params.availableFrom2 != null &&
                params.availableFrom2_day != null &&
                params.availableFrom2_month != null &&
                params.availableFrom2_year != null)
            d2 = sdf.parse("${params.availableFrom2_day}/${params.availableFrom2_month}/${params.availableFrom2_year}")
        dates << d1 << d2
        //if more than one period, then retreiving the relevant dates thanks to the count variable passed
        //visitTimeCount
        if (visitTimeCount > 1)
        {
            for (i in 2..visitTimeCount)
            {
                if (params.availableFrom1 != null &&
                        params.getAt("availableFrom1_${i}_day") != null &&
                        params.getAt("availableFrom1_${i}_month") != null &&
                        params.getAt("availableFrom1_${i}_year") != null)
                    dates << sdf.parse("${params.getAt("availableFrom1_${i}_day")}/${params.getAt("availableFrom1_${i}_month")}/${params.getAt("availableFrom1_${i}_year")}")
                if (params.availableFrom1 != null &&
                        params.getAt("availableFrom2_${i}_day") != null &&
                        params.getAt("availableFrom2_${i}_month") != null &&
                        params.getAt("availableFrom2_${i}_year") != null)
                    dates << sdf.parse("${params.getAt("availableFrom2_${i}_day")}/${params.getAt("availableFrom2_${i}_month")}/${params.getAt("availableFrom2_${i}_year")}")
            }
        }
        property.availableFrom = dates
        if (!property.hasErrors() && property.save())
        {
            imageAdd(property.id)
        }

        if (!property.hasErrors() && property.save(flush:true)) {
            flash.message = "Property ${property.id} created"
            redirect(action: show, id: property.id)
        }
        else {
            render(view: 'create', model: [property: property])
            //chain(action:"create", model:[property:property], id:params.id, params:['visitTimeCount':visitTimeCount])
        }
    }

}
