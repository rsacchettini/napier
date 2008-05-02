            
class EstateAgentController {
    //Login management: only index, list and show actions allowed when not logged in.
	/*
	def beforeInterceptor = [action:this.&checkUser,except:['index','list','show']]

	// if the user in not present in the session, he is redericted to the login page
	def checkUser() {
		if(!session.user) {
			redirect(controller:'user',action:'login')
			return false
		}
	}
	*/
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ estateAgentList: EstateAgent.list( params ) ]
    }

    def show = {
        def estateAgent = EstateAgent.get( params.id )

        if(!estateAgent) {
            flash.message = "EstateAgent not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ estateAgent : estateAgent ] }
    }

    def delete = {
        def estateAgent = EstateAgent.get( params.id )
        if(estateAgent) {
            estateAgent.delete()
            flash.message = "EstateAgent ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "EstateAgent not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def estateAgent = EstateAgent.get( params.id )

        if(!estateAgent) {
            flash.message = "EstateAgent not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ estateAgent : estateAgent ]
        }
    }

    def update = {
        def estateAgent = EstateAgent.get( params.id )
        if(estateAgent) {
            estateAgent.properties = params
            if(!estateAgent.hasErrors() && estateAgent.save()) {
                flash.message = "EstateAgent ${params.id} updated"
                redirect(action:show,id:estateAgent.id)
            }
            else {
                render(view:'edit',model:[estateAgent:estateAgent])
            }
        }
        else {
            flash.message = "EstateAgent not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def estateAgent = new EstateAgent()
        estateAgent.properties = params
        return ['estateAgent':estateAgent]
    }

    def save = {
        def estateAgent = new EstateAgent(params)
        if(!estateAgent.hasErrors() && estateAgent.save()) {
            flash.message = "EstateAgent ${estateAgent.id} created"
            redirect(action:show,id:estateAgent.id)
        }
        else {
            render(view:'create',model:[estateAgent:estateAgent])
        }
    }
}