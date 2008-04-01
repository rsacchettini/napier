import java.util.*
import java.text.SimpleDateFormat
import javax.imageio.*

class PropertyController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ propertyList: Property.list( params ) ]
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
            property.delete()
			//deleting of the pictures associated
			def dirToDelete = new File("web-app/images/${property.id}")
			if(dirToDelete != null)
				deleteDirectory(dirToDelete)

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
		  imageAdd(property)
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
		  imageAdd(property)
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

	
	// action called in edit action by an ajax request, to delete the pictures
	def deleteImage =
	{
	  def property = Property.get( Long.parseLong(params.id) )
	  def imageToDelete = (String)params?.imageId
	  def imageURL = "web-app/images/properties/${imageToDelete}"
	  def imageFile = new File(imageURL)
	  if(imageFile != null)
	  {
		  if(imageFile.delete())
		  { // the file has been successfully deleted
			  //removing the pictures attribute from the property
			  int indexOfPic = ((String[])property.picture).findIndexOf {it == imageToDelete}
			  def pics = []
			  pics = property.picture
			  pics.remove(indexOfPic)
			  property.picture = pics

			  def picsType = []
			  picsType = property.pictureType
			  picsType.remove(indexOfPic)
			  render("The file ${(imageToDelete).substring(imageToDelete.lastIndexOf("/")+1)}has been successfully deleted")
		  }
		  else
		  	render ("Problem, impossible to delete the file", view:'show')
	  }
	  else
	  	render("A Problem has occured")

	}

	// Add images to a property with the multipartfiles passed in the HTTPrequest
	def imageAdd =
	{Property property ->
		def f//image file
		def pictures = [] //list of pictures file names
		if(property.picture != null) pictures = property.picture
		def picturesType = [] //list of picure file content types
		if(property.pictureType != null) picturesType = property.pictureType
		def okcontents = ['image/png', 'image/jpeg', 'image/gif'] // content types that are suitable
		//map of the content type with the corresponding extension to add to the file name, regarding the content type
		def okextensions = ['image/png':'png', 'image/jpeg':'jpg', 'image/gif':'gif' ]
		def i = 1

			while(params.getAt("picture_$i") != null)
			{
				   f = request.getFile("picture_${i}")//retreiving the file

					if (! okcontents.contains(f.getContentType()))
					{
						flash.message = "Avatar must be one of: ${okcontents}"
						//render(view:'select_avatar', model:[user:user])
						//return;
					}
					else
					{     //if no null and suitable, then storing it to the images/properties directory
						  def srcDir = new File(new File(new File(new File("web-app"),"images"),"properties"),"${property.id}")
						   //= new File("web-app/images/properties/${property.id}")
						  srcDir.mkdirs()//directory creation if needed (eg properties dir)
						  def imageId = "img_${pictures.size()+1+Math.random()}" 
						  def filename = "${imageId}.${okextensions[((String)f.getContentType())]}"
						  f = f.getAbsoluteFile()
						  f.transferTo( new File(srcDir,filename) )
						  //response.sendError(200,'Done');

						  //pictures << "images/${property.id}/${filename}"
						  pictures << "${property.id}/${filename}"
						  picturesType << f.getContentType()
						//storage of the new images info in the property domain object
						property.picture = pictures
						property.pictureType = picturesType
						  log.info("File ${filename} uploaded: ")
					}
				i++
			}
			return ['pictures':pictures, 'picturesType':picturesType ]
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

}