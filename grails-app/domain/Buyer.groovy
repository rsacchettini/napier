class Buyer {
    
    /* ---------- Attributes ---------- */
    String mySurname
    String myForename
    String myUsername
    String myPassword
    String myEmail
    String myTelephoneNo
    

    static constraints =
    {
   		 myUsername(unique:true,length:5..15)
  		 myPassword(matches:/[\w\d]+/,length:6..12)
  		 myTelephoneNo(length:7..16)
  		 myEmail(email:true)
  		 myForename(blank:false,length:1..50)
  		 mySurname(blank:false,length:1..50)
  	}

    //Note: Since the O.6 version of grails there is no need to specify any collection or Set for the hasMany
    //associations. relatesToMany used to require that but is now deprecated so only hasMany must be used
    static hasMany = [availableProperties:Property, appointements:Appointment]
    static belongsTo = Property

    String toString() { "$myForename $mySurname" }

      boolean equals(other) {
          if(other?.is(this))return true
          if(!(other instanceof Buyer)) return false
          if(!id || !other?.id || id!=other?.id) return false
          return true
      }

      int hashCode() {
          int hashCode = 0
          hashCode = 29 * (hashCode + ( !id ? 0 : id ^ (id >>> 32)))
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

