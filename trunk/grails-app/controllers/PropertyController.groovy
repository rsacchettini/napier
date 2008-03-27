import java.util.*
import java.text.SimpleDateFormat

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
        def date = []
        def visitTimeCount = 0
       if (property.availableFrom != null)
       {
		  visitTimeCount = (property.availableFrom.length / 2)

		  for (i in 0..(property.availableFrom.length-1))
		  {
			 date << property.availableFrom[i]
          }
        }

        if(!property) {
            flash.message = "Property not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return ['property':property, 'availableFrom':date, 'visitTimeCount':visitTimeCount]
        }
    }

    def update = {

        def property = Property.get( params.id )
        
        def properties = params.getProperties()
        flash.message = "${ properties.each { key, value -> "calling $key on $value"}}"
         def d1
         def d2
        def dates = []
        def vis = params.visitTimeCount
         def visitTimeCount = Integer.parseInt(vis)
        def sdf = new SimpleDateFormat("dd/MM/yyyy")
        if(params.availableFrom1 != null )
            d1 = sdf.parse("${params.availableFrom1_day}/${params.availableFrom1_month}/${params.availableFrom1_year}")   
        if(params.availableFrom2 != null )
             d2 = sdf.parse("${params.availableFrom2_day}/${params.availableFrom2_month}/${params.availableFrom2_year}")
        dates <<  d1 <<  d2
        if(visitTimeCount > 1)
        {
            for(i in 2..visitTimeCount)
            {
            dates << sdf.parse("${params.getAt("availableFrom1_${i}_day")}/${params.getAt("availableFrom1_${i}_month")}/${params.getAt("availableFrom1_${i}_year")}")   
            dates << sdf.parse("${params.getAt("availableFrom2_${i}_day")}/${params.getAt("availableFrom2_${i}_month")}/${params.getAt("availableFrom2_${i}_year")}")

            }
        }
        property.availableFrom = dates

        if(property) {
            property.properties = params
            if(!property.hasErrors() && property.save()) {
                flash.message = "Property ${params.id} updated"
                redirect(action:show,id:property.id)
            }
            else {
                //render(view:'edit',model:[property:property])
            	redirect(action:"edit", id:property.id, params:['availableFrom':dates, 'visitTimeCount':visitTimeCount])
			}
        }
        else {
            flash.message = "Property not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def property = new Property()
        def date1 = new Date()
        def date2 = new Date()
        def visitTimeCount = 1

        property.properties = params
        return ['property':property, 'availableFrom1':date1, 'availableFrom2':date2, 'visitTimeCount':visitTimeCount]
    }

    def save = {
        def property = new Property(params)
         def d1
         def d2
        def dates = []
        def vis = params.visitTimeCount
         def visitTimeCount = Integer.parseInt(vis)
        def sdf = new SimpleDateFormat("dd/MM/yyyy")
        if(params.availableFrom1 != null )
            d1 = sdf.parse("${params.availableFrom1_day}/${params.availableFrom1_month}/${params.availableFrom1_year}")
        if(params.availableFrom2 != null )
             d2 = sdf.parse("${params.availableFrom2_day}/${params.availableFrom2_month}/${params.availableFrom2_year}")
        dates <<  d1 <<  d2
        if(visitTimeCount > 1)
        {
            for(i in 2..visitTimeCount)
            {
            dates << sdf.parse("${params.getAt("availableFrom1_${i}_day")}/${params.getAt("availableFrom1_${i}_month")}/${params.getAt("availableFrom1_${i}_year")}")
            dates << sdf.parse("${params.getAt("availableFrom2_${i}_day")}/${params.getAt("availableFrom2_${i}_month")}/${params.getAt("availableFrom2_${i}_year")}")
            }
        }
        property.availableFrom = dates
        // List of OK mime-types
        def f = request.getFile('picture')
          def okcontents = ['image/png', 'image/jpeg', 'image/gif']
          if (! okcontents.contains(f.getContentType())) {
            flash.message = "Avatar must be one of: ${okcontents}"
            render(view:'select_avatar', model:[user:user])
            return;
          }



          // Save the image and mime type
          property.picture = f.getBytes()
          property.pictureType = f.getContentType()
          log.info("File uploaded: " + property.pictureType)
        
        
        if(!property.hasErrors() && property.save()) {
            flash.message = "Property ${property.id} created"
            redirect(action:show,id:property.id)
        }
        else {
            render(view:'create',model:[property:property])
        }
    }

    def property_image = {
      def property = Property.get( params.id )
      if (!property.picture || !property.pictureType) {
        response.sendError(404)
        return;
      }
      response.setContentType(property.pictureType)
      response.setContentLength(property.picture.size())
      OutputStream out = response.getOutputStream();
      out.write(property.picture);
      out.close();
    }

}
