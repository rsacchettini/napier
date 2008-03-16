class EstateAgent {

    String mySurname
    String myForename
    String myUsername
    String myPassword
    String myTelephoneNo

    static constraints = 
    {
        mySurname(blank:false)
        myForename(blank:false)
        myUsername(blank:false, unique:true, length:5..15)
        myPassword(blank:false, matches:/[\w\d]+/)
        myTelephoneNo(blank:false)
    }
    

    //Note: Since the O.6 version of grails there is no need to specify any collection or Set for the hasMany
    //associations. relatesToMany used to require that but is now deprecated so only hasMany must be used
    static hasMany = [propertiesToManage:Property, appointementsToManage:Appointment]

       String toString() { "$myForename $mySurname" }

      boolean equals(other) {
          if(other?.is(this))return true
          if(!(other instanceof EstateAgent)) return false
          if(!id || !other?.id || id!=other?.id) return false
          return true
      }

      int hashCode() {
          int hashCode = 0
          hashCode = 29 * (hashCode + ( !id ? 0 : id ^ (id >>> 32)))
      }

    /*

    void listSellerProperty() {

	}

	void listInterestedBuyer() {

	}

	void search() {

	}

	void confirmSellerProperty() {

	}

	void refuseSellerProperty() {

	}

	void editInformation() {

	}

	void makeAppointment() {

	}

	void editAppointment() {

	}

	void removeProperty() {

	}
	*/
}
