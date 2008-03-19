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

        if(!property) {
            flash.message = "Property not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ property : property ] }
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

        if(!property) {
            flash.message = "Property not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ property : property ]
        }
    }

    def update = {
        def property = Property.get( params.id )
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
        return ['property':property]
    }

    def save = {
        def property = new Property(params)
        def d1 = new String(params.availableFrom1)
        def d2 = new String(params.availableFrom2)
        def date1 = new Date(d1)
        def date2 = new Date(d2)
        def dates = []
        /*
        property.setIsSoldBy(params.isSoldBy)
         isManagedBy = params.isManagedBy
         referenceNo = params.referenceNo
         address = params.address
         postCode = params.postCode
         minPrice = params.minPrice
         maxPrice = params. maxPrice
         description = params.description
         bedroomNumber = params.bedroomNumber
         picture = params.picture
         */

        //managing the dates



            dates <<  date1
            dates <<  date2
            //property.availableFrom = (Date[]) dates.toArray()
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
