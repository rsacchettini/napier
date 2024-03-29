class Property
{
    Seller isSoldBy
    EstateAgent isManagedBy

    Date[] availableFrom
	Boolean validated
	String address
    String city
    String postCode
	int minPrice
	String category
	String description
	int bedroomNumber
	String[] picture
    String[] pictureType

    def beforeDelete = {
        isSoldBy.removeFromSellProperties(this)
        isManagedBy.removeFromPropertiesToManage(this)
        def list = Interested.findAll("from Interested as i where i.myProp.id=?",this.id)
        list.each{i->i.delete()}
    }

    static constraints = {
        address(blank:false, minLength:5)
        city(blank:false)
        postCode(blank:false, matches:/^(GIR 0AA)|([A-PR-UWYZ]((\d(\d|[A-HJKSTUW])?)|([A-HK-Y]\d(\d|[ABEHMNPRV-Y])?)) \d[ABD-HJLNP-UW-Z]{2})$/)
        minPrice(min:1)
		category(blank:false, inList:['', 'Flat','Detached house','Semi-det. house','Terraced','Conversion','Bungalow','Cottage','Mews','Townhouse','Plot'])
        description(blank:false, maxLength:1000)
        bedroomNumber(min:0)
        picture(nullable:true)
        pictureType(nullable:true)
		validated(nullable:true)

    }

    static belongsTo =  [Seller]
    
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
