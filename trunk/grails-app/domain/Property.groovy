class Property
{
    
    Seller isSoldBy
    EstateAgent isManagedBy

    String myReferenceNo
	Date[] myAvailableFrom
	String myaddress
	String myPostCode
	float myMinPrice
	float myMaxPrice
	String myDescription
	int myBedroomNumber
	byte[] myPicture

	static constraints = {
        myReferenceNo(blank:false, minLength:1, unique:true)
        myAvailableFrom(minSize:2)
        myaddress(blank:false, minLength:5)
        myPostCode(blank:false, matches:/^(GIR 0AA)|([A-PR-UWYZ]((\d(\d|[A-HJKSTUW])?)|([A-HK-Y]\d(\d|[ABEHMNPRV-Y])?)) \d[ABD-HJLNP-UW-Z]{2})$/)
        myMinPrice(min:1.0f)
        myDescription(blank:false, maxLength:1000)
        myBedroomNumber(min:1)
    }


    static belongsTo =  [Seller]
    
    //Note: Since the O.6 version of grails there is no need to specify any collection or Set for the hasMany
    //associations. relatesToMany used to require that but is now deprecated so only hasMany must be used
    static hasMany = [interestedBuyers:Buyer, appointements:Appointment]

     String toString() { "reference number $myReferenceNo" }

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
          return this.myMinPrice
      }

}
