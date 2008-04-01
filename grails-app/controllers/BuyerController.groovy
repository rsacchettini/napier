            
class BuyerController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ buyerList: Buyer.list( params ) ]
    }

    def show = {
        def buyer = Buyer.get( params.id )

        if(!buyer) {
            flash.message = "Buyer not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ buyer : buyer ] }
    }

    def delete = {
        def buyer = Buyer.get( params.id )
        if(buyer) {
            buyer.delete()
            flash.message = "Buyer ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Buyer not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def buyer = Buyer.get( params.id )

        if(!buyer) {
            flash.message = "Buyer not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ buyer : buyer ]
        }
    }

    def update = {
        def buyer = Buyer.get( params.id )
        if(buyer) {
            buyer.properties = params
            if(!buyer.hasErrors() && buyer.save()) {
                flash.message = "Buyer ${params.id} updated"
                redirect(action:show,id:buyer.id)
            }
            else {
                render(view:'edit',model:[buyer:buyer])
            }
        }
        else {
            flash.message = "Buyer not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def buyer = new Buyer()
        buyer.properties = params
        return ['buyer':buyer]
    }

    def save = {
        def buyer = new Buyer(params)
        if(!buyer.hasErrors() && buyer.save()) {
            flash.message = "Buyer ${buyer.id} created"
            redirect(action:show,id:buyer.id)
        }
        else {
            render(view:'create',model:[buyer:buyer])
			//chain(action:create, model:[buyer:buyer])
		}
    }
}