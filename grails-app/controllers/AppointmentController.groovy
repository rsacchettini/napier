            
class AppointmentController {
	def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
		if(params.isPersonalList != null && params.isPersonalList == "true")
		 {
			 def principal = PrincipalService.getPrincipal()
			 if(((String)principal.getAuthorities()[0]) =="ROLE_BUYER")
			 {
				 def buyer = (Buyer)Buyer.findByUsername(principal.getUsername())
				 if(buyer != null)
				 {
					def buyerAppointements = buyer.appointments
					if(buyerAppointements != null)
					{// if the logged user is a seller then retrieve his properties.
						return [appointmentList: buyerAppointements]
					}
				 }
			 }
			 else
			 {
				    if(!params.max) params.max = 10
        			return [ appointmentList: Appointment.list( params ) ]
			 }

    	}
	}

	def show = {
        def appointment = Appointment.get( params.id )

        if(!appointment) {
            flash.message = "Appointment not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ appointment : appointment ] }
    }

    def delete = {
        def appointment = Appointment.get( params.id )
        if(appointment) {
            appointment.delete()
            flash.message = "Appointment ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Appointment not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def appointment = Appointment.get( params.id )

        if(!appointment) {
            flash.message = "Appointment not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ appointment : appointment ]
        }
    }

    def update = {
        def appointment = Appointment.get( params.id )
        if(appointment) {
            appointment.properties = params
            if(!appointment.hasErrors() && appointment.save()) {
                flash.message = "Appointment ${params.id} updated"
                redirect(action:show,id:appointment.id)
            }
            else {
                render(view:'edit',model:[appointment:appointment])
            }
        }
        else {
            flash.message = "Appointment not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def appointment = new Appointment()
        appointment.properties = params
        return ['appointment':appointment]
    }

    def save = {
        def appointment = new Appointment(params)
        if(!appointment.hasErrors() && appointment.save()) {
            flash.message = "Appointment ${appointment.id} created"
            redirect(action:show,id:appointment.id)
        }
        else {
            render(view:'create',model:[appointment:appointment])
        }
    }
}