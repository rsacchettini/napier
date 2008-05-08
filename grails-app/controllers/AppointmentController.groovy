            
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
				 def buyer = (Buyer)Buyer.findById(principal.domainClass.id)
				 if(buyer != null)
				 {
					def buyerAppointements = Appointment.findAll("from Appointment as i where i.buyer.id=?",buyer.id)
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
            appointment.delete(flush:true)
            flash.message = "Appointment ${params.id} deleted"
            redirect(action:list, params:[isPersonalList:true])
        }
        else {
            flash.message = "Appointment not found with id ${params.id}"
            redirect(action:list, params:[isPersonalList:true])
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

	def getFreeTimeList = {		
		// Fill timetable
		def timetable = []
		for (hour in 8..18){
			if (hour < 12)
				timetable << hour+":00 AM"
			else
				timetable << hour+":00 PM"
			hour++
		}
		def toFormatClient = new java.text.SimpleDateFormat("EEEE dd MMMM yyyy HH:mm a")
		
		Property p = Property.get(params.propertyid)
		def apList = p.appointments
		String dref
		//println params.theAvailableDate
		def dtest = params.theAvailableDate + " "
        def availableTime = []
        if(apList.size() > 0)
        {
            apList.each {
                dref = toFormatClient.format(it.dateAndTime).toString()
                // Fill the available time in function of the day and the appointment
                for(int i=0; i<timetable.size();i++){

                    dtest = dtest + timetable[i]
                    //println "dref : "+dref
                    //println "dtTest : "+dtest
                    if (!dref.equals(dtest)){
                        availableTime << timetable[i]
                    //	println timetable[i]
                    }
                }
            }
        }
        else
        {
            availableTime = timetable
        }
        
        render(template: "/appointment/dateList", model:[theSelectedDate:params.theAvailableDate, timeList:availableTime])
	}
	
    def create = {
		// Fill the available day in function of the property
		def property = Property.get(params.id)
		// Date
		def availableDate = []
		def toFormat = new java.text.SimpleDateFormat("EEEE dd MMMM yyyy")
		def startDate = property.availableFrom[0]   
		def endDate = property.availableFrom[1]
		// Test if ...
		Date currentDate = new Date()
		if (currentDate > startDate)
			startDate = currentDate
		for (day in startDate..endDate) { 
			availableDate << toFormat.format(day)
			day++
		}
		
		
        def appointment = new Appointment()
        appointment.properties = params
        return ['appointment':appointment, 'propertyid':params.id, 'availableDate':availableDate]
    }

    def save = {
	
       def appointment = new Appointment()
	   // StringToDate
	   def toFormat = new java.text.SimpleDateFormat("EEEE dd MMMM yyyy HH:mm a")
	   Date d = (Date)toFormat.parse(params.theSelectedDate+" "+params.theSelectedTime)
	   appointment.dateAndTime =  d
        appointment.isManagedBy = EstateAgent.get(params.isManagedBy.id)
        appointment.property =  Property.get(params.property.id)
        appointment.buyer = Buyer.get(params.buyer.id)
        
        if(!appointment.hasErrors() && appointment.save()) {
            flash.message = "Appointment ${appointment.id} created"
            redirect(action:show,id:appointment.id)
        }
        else {
            render(view:'create',model:[appointment:appointment])
        }
    }
}