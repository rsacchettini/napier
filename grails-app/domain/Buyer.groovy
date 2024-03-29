class Buyer extends AuthUser {
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
    static hasMany = [appointments:Appointment]
	static fetchMode = [appointments:"eager", listedProperties:"eager"]
      static mapping = {
       appointments cascade:"all"
   }

      boolean equals(other) {
          if(other?.is(this))return true
          if(!(other instanceof Buyer)) return false
          if(!id || !other?.id || id!=other?.id) return false
          return true
      }



}

