class Seller extends AuthUser {
    /* ---------- Attributes ---------- */
	String address
    String city
    String postCode

    //Note: Since the O.6 version of grails there is no need to specify any collection or Set for the hasMany
    //associations. relatesToMany used to require that but is now deprecated so only hasMany must be used
    static hasMany = [sellProperties:Property]
	//the properties will be loaded in memory when the user will be loaded
	static fetchMode = [sellProperties:"eager"]

      static mapping = {
       sellProperties cascade:"all"
   }

    static constraints =
    {
        address(blank:true,nullable:true, minLength:5)
        city(blank:true,nullable:true,)
        postCode(blank:true,nullable:true, matches:/^(GIR 0AA)|([A-PR-UWYZ]((\d(\d|[A-HJKSTUW])?)|([A-HK-Y]\d(\d|[ABEHMNPRV-Y])?)) \d[ABD-HJLNP-UW-Z]{2})$/)

    }

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
    

}
