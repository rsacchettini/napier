class Seller extends User {
    /* ---------- Attributes ---------- */
	String address

    //Note: Since the O.6 version of grails there is no need to specify any collection or Set for the hasMany
    //associations. relatesToMany used to require that but is now deprecated so only hasMany must be used
    static hasMany = [sellProperties:Property]

    static constraints =
    {
       address(blank:false)
    }

      boolean equals(other) {
          if(other?.is(this))return true
          if(!(other instanceof Seller)) return false
          if(!id || !other?.id || id!=other?.id) return false
          return true
      }
	
    

}
