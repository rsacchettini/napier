import java.util.*
import java.text.SimpleDateFormat
import javax.imageio.*
import grails.converters.*

class PropertyController {

    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
		 if(params.isPersonalList != null && params.isPersonalList == "true")
		 {
			 def principal = PrincipalService.getPrincipal()
			 if(principal!= null)
			 {
				 if(((String)principal.getAuthorities()[0]) == "ROLE_SELLER")
				 {
					 def seller = Seller.findByUsername(principal.getUsername())
					 if(seller != null)
					 {
						def sellerProperties = seller?.sellProperties
						if(sellerProperties != null)
						{// if the logged user is a seller then retrieve his properties.
							return [propertyList: sellerProperties]
						}
					 }
				 }
				 else if(((String)principal.getAuthorities()[0]) == "ROLE_BUYER")
				 {
					 def buyer = (Buyer)Buyer.findByUsername(principal.getUsername())
					 if(buyer != null)
					 {
						def buyerInterestList = buyer?.listedProperties;
						if(buyerInterestList != null)
						{// if the logged user is a seller then retrieve his properties.
							return [propertyList: buyerInterestList]
						}
					 }
				 }
			 }
		 }
		else
		{
			if(!params.max) params.max = 10
        	return [ propertyList: Property.list( params ) ]
		}	
    }

	def show = {
        def property = Property.get( params.id )
        def date = []
        if (property.availableFrom != null)
        {
              for (i in 0..(property.availableFrom.length-1))
              {
                  date << property.availableFrom[i]
              }
         }
        if(!property) {
            flash.message = "Property not found with id ${params.id}"
            redirect(action:list)
        }
        else { return ['property':property, 'availableFrom':date] }
    }

    def delete = {
        def property = Property.get( params.id )
        if(property) {

			//deleting of the pictures associated

			def dirToDelete = new File("web-app/images/properties/${property.id}")
			//def dirToDelete = new File(new File(new File(new File("web-app"),"images"),"properties"),"${property.id}")
			if(dirToDelete != null)
				deleteDirectory(dirToDelete)

			property.delete()

			flash.message = "Property ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Property not found with id ${params.id}"
            redirect(action:list)
		}
    }

    def edit = {
        def property = Property.get( params.id )
        def visitTimeCount = 0
       if (property.availableFrom != null)
       {
		  visitTimeCount = (property.availableFrom.length / 2)
        }

        if(!property) {
            flash.message = "Property not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return ['property':property, 'visitTimeCount':visitTimeCount]
        }
    }

      def addInterest = {
        def property = Property.get( params.id )
        def principal = PrincipalService.getPrincipal()
			 if(principal!= null)
			 {
        if(((String)principal.getAuthorities()[0]) == "ROLE_BUYER")
				 {
					 def buyer = (Buyer)Buyer.findByUsername(principal.getUsername())
					 if(buyer != null)
					 {
                        property.interestedBuyers.add(buyer)                                    
					 }
				 }
             }
           redirect(action:list)
    }

    def update = {
        def property = Property.get( params.id )
        def properties = params.getProperties()
        def d1
        def d2
        def dates = []
		def visitTimeCount
		def vis = params.visitTimeCount
		if(vis != "" && vis != null)
			visitTimeCount = Integer.parseInt(vis)
		else
		{
			if(property.availableFrom != null)
				visitTimeCount = property.availableFrom.length
			else
				 visitTimeCount = 0
		}
		def sdf = new SimpleDateFormat("dd/MM/yyyy")
        if(params.availableFrom1 != null &&
			params.availableFrom1_day != null &&
			params.availableFrom1_month != null &&
			params.availableFrom1_year != null  )
				d1 = sdf.parse("${params.availableFrom1_day}/${params.availableFrom1_month}/${params.availableFrom1_year}")
        if(params.availableFrom2 != null &&
			params.availableFrom2_day != null &&
			params.availableFrom2_month != null &&
			params.availableFrom2_year != null)
             d2 = sdf.parse("${params.availableFrom2_day}/${params.availableFrom2_month}/${params.availableFrom2_year}")
        dates <<  d1 <<  d2
        if(visitTimeCount > 1)
        {
            for(i in 2..visitTimeCount)
            {
				if(params.availableFrom1 != null &&
					params.getAt("availableFrom1_${i}_day") != null &&
					params.getAt("availableFrom1_${i}_month") != null &&
					params.getAt("availableFrom1_${i}_year") != null)
						dates << sdf.parse("${params.getAt("availableFrom1_${i}_day")}/${params.getAt("availableFrom1_${i}_month")}/${params.getAt("availableFrom1_${i}_year")}")
                if(params.availableFrom1 != null &&
					params.getAt("availableFrom2_${i}_day") != null &&
					params.getAt("availableFrom2_${i}_month") != null &&
					params.getAt("availableFrom2_${i}_year") != null)
						dates << sdf.parse("${params.getAt("availableFrom2_${i}_day")}/${params.getAt("availableFrom2_${i}_month")}/${params.getAt("availableFrom2_${i}_year")}")
            }
        }
        property.availableFrom = dates
		if(!property.hasErrors() && property.save())
		{
		  imageAdd(property.id)
		}

        if(property) {
            property.properties = params
            if(!property.hasErrors() && property.save()) {
                flash.message = "Property ${params.id} updated"
                redirect(action:show,id:property.id)
            }
            else {
                //render(view:'edit',model:[property:property])

				chain(action:"edit", id:params.id, params:['visitTimeCount':visitTimeCount])
			}
        }
        else {
            flash.message = "Property not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
		def p = params
		def property = new Property()
        def visitTimeCount = 1
		def dates = [new Date(),new Date()]
		property.availableFrom = dates;
		property.properties = params;
		if (property.availableFrom != null)
        {
		  visitTimeCount = (property.availableFrom.length / 2)
        }
		return ['property':property, 'visitTimeCount':visitTimeCount]
    }

		// action called in edit action by an ajax request, to delete the pictures
	def deleteImage =
	{
	  def pictures = []; def picturesType = []
	  def property = Property.get( Long.parseLong(params.id) )
	  if(property.picture != null)
			pictures = (List)property.picture
	  if(property.pictureType != null)
			picturesType = (List)property.pictureType
	  def imageToDelete = (String)params?.imageId
	  def imageURL = "web-app/images/properties/${imageToDelete}"
	  def imageFile = new File(imageURL)
	  if(imageFile != null)
	  {
		  if(imageFile.delete())
		  { // the file has been successfully deleted
			  //removing the pictures attribute from the property
			  int indexOfPic = pictures.findIndexOf {it == imageToDelete}
			  pictures.remove(indexOfPic)
			  property.picture = (String[])pictures
			  picturesType.remove(indexOfPic)
			  property.pictureType = (String[])picturesType
			  redirect(action:edit,id:property.id)
			 // def response = (String)"The file ${(imageToDelete).substring(imageToDelete.lastIndexOf("/")+1)} has been successfully deleted"
			  //render response
		  }
		  else
		  	render = "Problem, impossible to delete the file"
	  }
	  else
	  	render = "A Problem has occured"

	}

	  def genererContenu = {
    	render "Salut !"
  		}

	// Add images to a property with the multipartfiles passed in the HTTPrequest
	private void imageAdd(Long propertyId)
	{
		def property = Property.get(propertyId)
		def properties = params.getProperties()
		def f
		def pictures = [] //list of pictures file names
		if(property.picture != null)
			pictures = (List)property.picture
		else
			property.picture = []

		def fileCount =  params.fileCount
		if(fileCount != null && fileCount != "")
			fileCount = Integer.parseInt(fileCount)
		else
			fileCount = 0

		def picturesType = [] //list of picure file content types

		if(property.pictureType != null)
			picturesType = (List)property.pictureType
		else
			property.pictureType = []

		def okcontents = ['image/png', 'image/jpeg', 'image/gif'] // content types that are suitable
		//map of the content type with the corresponding extension to add to the file name, regarding the content type
		def okextensions = ['image/png':'png', 'image/jpeg':'jpg', 'image/gif':'gif' ]

		if(fileCount != 0)
		{
			for(i in 1..fileCount)
			{
				  f = (org.springframework.web.multipart.commons.CommonsMultipartFile)request.getFile("picture_${i}")
				  if (f.getSize() > 0)
				  {
						if (! okcontents.contains(f.getContentType()))
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
							  srcDir.mkdirs()//directory creation if needed (eg properties dir)
							  def imageId = "img_${pictures.size()+1}"
							  def fileExtension = "${okextensions[((String)f.getContentType())]}"
							  def filename = "${imageId}.${fileExtension}"
							  String chemin = "web-app/images/properties/${property.id}"

							  def out = new DataOutputStream(new FileOutputStream(new File(srcDir,filename)))
							  out.write(f.getBytes())
							  out.close()
							  //f.transferTo( new File(srcDir,filename) )
							  picturesType.add((String)f.getContentType())
							  pictures.add((String)"${property.id}/${filename}")
							  log.info("File ${filename} uploaded: ")
						}
				   }

			}
			//storage of the new images info in the property domain object

			  property.picture = (String[])pictures
			  property.pictureType = (String[])picturesType
			  property.save()
		}
	}
	//recursive method to delete a whole directory even if not empty
	static public boolean deleteDirectory(File path) {
        boolean resultat = true;
        if( path.exists() ) {
                File[] files = path.listFiles()
                for(int i=0; i<files.length; i++) {
                        if(files[i].isDirectory()) {
                                resultat &= deleteDirectory(files[i])
                        }
                        else {
                        resultat &= files[i].delete()
                        }
                }
        }
        resultat &= path.delete()
        return( resultat )
	}

	def save = {
        def property = new Property(params)
        def d1 //Date
        def d2 //Date
        def dates = []
		def properties = params.getProperties()
		def vis = params.visitTimeCount
        def visitTimeCount //number of dates periods (so the half of the actual number of dates in property.dates[]
       if(vis != "" && vis != null)
			visitTimeCount = Integer.parseInt(vis)
		else
		{  //retrieving the input countaining the number of dates passed in the request params
			if(property.availableFrom != null)
				visitTimeCount = property.availableFrom.length
			else
				 visitTimeCount = 0
		}
		// retrieve the dates from the request params
		def sdf = new SimpleDateFormat("dd/MM/yyyy")
        if(params.availableFrom1 != null &&
			params.availableFrom1_day != null &&
			params.availableFrom1_month != null &&
			params.availableFrom1_year != null  )
				d1 = sdf.parse("${params.availableFrom1_day}/${params.availableFrom1_month}/${params.availableFrom1_year}")
        if(params.availableFrom2 != null &&
			params.availableFrom2_day != null &&
			params.availableFrom2_month != null &&
			params.availableFrom2_year != null)
             d2 = sdf.parse("${params.availableFrom2_day}/${params.availableFrom2_month}/${params.availableFrom2_year}")
        dates <<  d1 <<  d2
		//if more than one period, then retreiving the relevant dates thanks to the count variable passed
		//visitTimeCount
		if(visitTimeCount > 1)
        {
            for(i in 2..visitTimeCount)
            {
				if(params.availableFrom1 != null &&
					params.getAt("availableFrom1_${i}_day") != null &&
					params.getAt("availableFrom1_${i}_month") != null &&
					params.getAt("availableFrom1_${i}_year") != null)
						dates << sdf.parse("${params.getAt("availableFrom1_${i}_day")}/${params.getAt("availableFrom1_${i}_month")}/${params.getAt("availableFrom1_${i}_year")}")
                if(params.availableFrom1 != null &&
					params.getAt("availableFrom2_${i}_day") != null &&
					params.getAt("availableFrom2_${i}_month") != null &&
					params.getAt("availableFrom2_${i}_year") != null)
						dates << sdf.parse("${params.getAt("availableFrom2_${i}_day")}/${params.getAt("availableFrom2_${i}_month")}/${params.getAt("availableFrom2_${i}_year")}")
            }
        }
        property.availableFrom = dates
	   if(!property.hasErrors() && property.save())
		{
		  imageAdd(property.id)
		}

		if(!property.hasErrors() && property.save()) {
            flash.message = "Property ${property.id} created"
            redirect(action:show,id:property.id)
        }
        else {
            render(view:'create',model:[property:property])
			//chain(action:"create", model:[property:property], id:params.id, params:['visitTimeCount':visitTimeCount])
		}
    }

}