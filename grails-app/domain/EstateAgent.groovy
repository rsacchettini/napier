class EstateAgent {
    
    //id and version attributes are relative to the class management inside grails
    //note that the id field could be also useful for the programmer
    Long id
    String agent
    String phoneNumber
    String password
    Long version

    //Note: Since the O.6 version of grails there is no need to specify any collection or Set for the hasMany
    //associations. relatesToMany used to require that but is now deprecated so only hasMany must be used
    static hasMany = [propertiesToManage:Property, appointementsToManage:Appointement]

       String toString() { return agent }
       

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
}
