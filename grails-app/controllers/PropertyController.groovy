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
        def date1 = new Date()
        def date2 = new Date()
        if (property.availableFrom != null)
        {
            if(property.availableFrom.getAt(0) != null )
                date1 = (Date)property.availableFrom[0]

            if(property.availableFrom[1] != null)
                date2 = (Date)property.availableFrom[1]
        }


        if(!property) {
            flash.message = "Property not found with id ${params.id}"
            redirect(action:list)
        }
        else { return ['property':property, 'availableFrom1':date1, 'availableFrom2':date2] }
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
        def date1 = new Date()
        def date2 = new Date()

         if (property.availableFrom != null)
        {
            if(property.availableFrom[0] != null )
                date1 = (Date)property.availableFrom[0]

            if(property.availableFrom[1] != null)
                date2 = (Date)property.availableFrom[1]
        }

        if(!property) {
            flash.message = "Property not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return ['property':property, 'availableFrom1':date1, 'availableFrom2':date2]
        }
    }

    def update = {

        def property = Property.get( params.id )
        
        def properties = params.getProperties()
        flash.message = "${ properties.each { key, value -> "calling $key on $value"}}"
         def d1
         def d2
        def sdf = new SimpleDateFormat("dd/MM/yyyy")
        if(params.availableFrom1 != null )


            d1 = sdf.parse("${params.availableFrom1_day}/${params.availableFrom1_month}/${params.availableFrom1_year}")
            
        if(params.availableFrom2 != null )
             d2 = sdf.parse("${params.availableFrom2_day}/${params.availableFrom2_month}/${params.availableFrom2_year}")

        def dates = []

        dates <<  d1 <<  d2

        property.availableFrom = dates

        if(property) {
            property.properties = params
            if(!property.hasErrors() && property.save()) {
                flash.message = "Property ${params.id} updated"
                redirect(action:show,id:property.id)
            }
            else {
                render(view:'edit',model:[property:property])
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

        property.properties = params
        return ['property':property, 'availableFrom1':date1, 'availableFrom2':date2]
    }

    def stringToDate =
    {date ->
        date = (String)date
        date = date.split()
        def year = new Integer(date[2])
        def month = new Integer(date[1])
        def day = new Integer(date[0])
        date = new Date(year,month,day)
        return date
    }

    def save = {
        def property = new Property(params)
        def d1 = new Date()
        def d2 = new Date()

        if(params.availableFrom1 != null )
            d1 = new Date(stringToDate(params.availableFrom1))

        if(params.availableFrom2 != null )
            d2 = new Date(stringToDate(params.availableFrom2))

        def dates = []

        dates <<  d1 <<  d2

        property.availableFrom = dates

        
        if(!property.hasErrors() && property.save()) {
            flash.message = "Property ${property.id} created"
            redirect(action:show,id:property.id)
        }
        else {
            render(view:'create',model:[property:property])
        }
    }
}
