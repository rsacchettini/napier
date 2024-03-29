class Appointment {
    // UML Roles
    EstateAgent isManagedBy
    Property property
    Buyer buyer

    Date dateAndTime
    def beforeDelete = {
        property.removeFromAppointments(this)
        buyer.removeFromAppointments(this)
        isManagedBy.removeFromAppointmentsToManage(this)
    }
    static constraints =
    {
        dateAndTime(nullable: false)
    }



    //Note: Since the O.6 version of grails there is no need to specify any collection or Set for the hasMany
    //associations. relatesToMany used to require that but is now deprecated so only hasMany must be used
    static belongsTo = [EstateAgent, Property, Buyer]



    String toString() {"${this.class.name} :  $id"}

    boolean equals(other) {
        if (other?.is(this)) return true
        if (!(other instanceof Appointment)) return false
        if (!id || !other?.id || id != other?.id) return false
        return true
    }

    int hashCode() {
        int hashCode = 0
        hashCode = 29 * (hashCode + (!id ? 0 : id ^ (id >>> 32)))
    }

}
