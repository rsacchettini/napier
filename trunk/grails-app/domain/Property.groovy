class Property {
    
    Seller isSoldBy
    EstateAgent isManagedBy

    String mySurname
    String myForename
    String myUsername

    static belongsTo =  [isSoldBy:Seller]
    
    //Note: Since the O.6 version of grails there is no need to specify any collection or Set for the hasMany
    //associations. relatesToMany used to require that but is now deprecated so only hasMany must be used
    static hasMany = [interestedBuyers:Buyer, appointements:Appointement]

     String toString() { "${this.class.name} :  $id" }

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

}
