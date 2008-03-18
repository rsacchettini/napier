class EstateAgent extends User {

    //Note: Since the O.6 version of grails there is no need to specify any collection or Set for the hasMany
    //associations. relatesToMany used to require that but is now deprecated so only hasMany must be used
    static hasMany = [propertiesToManage:Property, appointementsToManage:Appointment]

    boolean equals(other) {
          if(other?.is(this))return true
          if(!(other instanceof EstateAgent)) return false
          if(!id || !other?.id || id!=other?.id) return false
          return true
      }



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
	
}
