class Property
{
    static searchable = true
    EstateAgent isManagedBy

    Date[] availableFrom
	Boolean validated
	String address
    String city
    String postCode
	int minPrice
	String description
	int bedroomNumber
	String[] picture
    String[] pictureType


	static constraints = {
        address(blank:false, minLength:5)
        city(blank:false)
        postCode(blank:false, matches:/^(GIR 0AA)|([A-PR-UWYZ]((\d(\d|[A-HJKSTUW])?)|([A-HK-Y]\d(\d|[ABEHMNPRV-Y])?)) \d[ABD-HJLNP-UW-Z]{2})$/)
        minPrice(min:1)
        description(blank:false, maxLength:1000)
        bedroomNumber(min:0)
        picture(nullable:true)
        pictureType(nullable:true)

    }


    static belongsTo =  [isSoldBy:Seller]
    
    //Note: Since the O.6 version of grails there is no need to specify any collection or Set for the hasMany
    //associations. relatesToMany used to require that but is now deprecated so only hasMany must be used
    static hasMany = [appointments:Appointment]



     String toString() {"$address" }

      boolean equals(other) {
          
          if(other?.is(this))return true
          if(!(other instanceof Property)) return false
          if(!id || !other?.id || id!=other?.id) return false
          return true
      }

      int hashCode() {
          int hashCode = 0		  
		  hashCode = 29 * (hashCode + ( !id ? 0 : id ^ (id >>> 32)))
      }

      float myMinPrice()
      {
          return this.minPrice
      }

}
