class Buyer extends User {
    static searchable = true
    def beforeInterceptor = [action:this.&checkUser,except:['index','list','show']]

	// if the user in not present in the session, he is redericted to the login page
	def checkUser() {
		if(!session.user) {
			redirect(controller:'user',action:'login')
			return false
		}
	}
    //Note: Since the O.6 version of grails there is no need to specify any collection or Set for the hasMany
    //associations. relatesToMany used to require that but is now deprecated so only hasMany must be used
    static hasMany = [availableProperties:Property, appointements:Appointment]
    static belongsTo = Property

      boolean equals(other) {
          if(other?.is(this))return true
          if(!(other instanceof Buyer)) return false
          if(!id || !other?.id || id!=other?.id) return false
          return true
      }


    /*
    if(buyer.save()) 
    {
     println "Buyer  created!"
    }
    else
    {
        buyer.errors.allErrors.each
        {
            println "The buyer has not been created. Please check the credentials"
        }
    }
    */



}
