            
class VendorController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ vendorList: Vendor.list( params ) ]
    }

    def show = {
        def vendor = Vendor.get( params.id )

        if(!vendor) {
            flash.message = "Vendor not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ vendor : vendor ] }
    }

    def delete = {
        def vendor = Vendor.get( params.id )
        if(vendor) {
            vendor.delete()
            flash.message = "Vendor ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Vendor not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def vendor = Vendor.get( params.id )

        if(!vendor) {
            flash.message = "Vendor not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ vendor : vendor ]
        }
    }

    def update = {
        def vendor = Vendor.get( params.id )
        if(vendor) {
            vendor.properties = params
            if(!vendor.hasErrors() && vendor.save()) {
                flash.message = "Vendor ${params.id} updated"
                redirect(action:show,id:vendor.id)
            }
            else {
                render(view:'edit',model:[vendor:vendor])
            }
        }
        else {
            flash.message = "Vendor not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def vendor = new Vendor()
        vendor.properties = params
        return ['vendor':vendor]
    }

    def save = {
        def vendor = new Vendor(params)
        if(!vendor.hasErrors() && vendor.save()) {
            flash.message = "Vendor ${vendor.id} created"
            redirect(action:show,id:vendor.id)
        }
        else {
            render(view:'create',model:[vendor:vendor])
        }
    }
}