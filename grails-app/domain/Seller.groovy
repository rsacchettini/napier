class Seller {
    /* ---------- Attributes ---------- */
    String mySurname
	String myForename
	String myUsername
	String myPassword
	String myEmail
	String myTelephoneNo
	String myAddress

    //Note: Since the O.6 version of grails there is no need to specify any collection or Set for the hasMany
    //associations. relatesToMany used to require that but is now deprecated so only hasMany must be used
    static hasMany = [sellProperties:Property]

    static constraints =
    {
       myForename(blank:false)
       mySurname(blank:false)
       myUsername(blank:false, unique:true, length:5..15)
       myPassword(blank:false, matches:/[\w\d]+/)
       myEmail(email:true, blank:false)
       myTelephoneNo(blank:false)
       myAddress(blank:false)
    }
    


    String toString() { "${this.class.name} :  $id" }

      boolean equals(other) {
          if(other?.is(this))return true
          if(!(other instanceof Seller)) return false
          if(!id || !other?.id || id!=other?.id) return false
          return true
      }

      int hashCode() {
          int hashCode = 0
          hashCode = 29 * (hashCode + ( !id ? 0 : id ^ (id >>> 32)))
      }
    /*

    void addProperty() {

	}

	void editProperty() {

	}

	void removeProperty() {

	}

	void listInterestedBuyers() {

	}

	void editPersonalDetails() {

	}
	*/
    

}
