            
class SellerController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ sellerList: Seller.list( params ) ]
    }

    def show = {
        def seller = Seller.get( params.id )

        if(!seller) {
            flash.message = "Seller not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ seller : seller ] }
    }

    def delete = {
        def seller = Seller.get( params.id )
        if(seller) {
            seller.delete()
            flash.message = "Seller ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Seller not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def seller = Seller.get( params.id )

        if(!seller) {
            flash.message = "Seller not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ seller : seller ]
        }
    }

    def update = {
        def seller = Seller.get( params.id )
        if(seller) {
            seller.properties = params
            if(!seller.hasErrors() && seller.save()) {
                flash.message = "Seller ${params.id} updated"
                redirect(action:show,id:seller.id)
            }
            else {
                render(view:'edit',model:[seller:seller])
            }
        }
        else {
            flash.message = "Seller not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def seller = new Seller()
        seller.properties = params
        return ['seller':seller]
    }

    def save = {
        def seller = new Seller(params)
        if(!seller.hasErrors() && seller.save()) {
            flash.message = "Seller ${seller.id} created"
            redirect(action:show,id:seller.id)
        }
        else {
            render(view:'create',model:[seller:seller])
        }
    }
}