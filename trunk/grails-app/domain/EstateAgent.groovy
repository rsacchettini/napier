class EstateAgent extends User {

 
    static hasMany = [propertiesToManage: Property, appointementsToManage: Appointment]

    boolean equals(other) {
        if (other?.is(this)) return true
        if (!(other instanceof EstateAgent)) return false
        if (!id || !other?.id || id != other?.id) return false
        return true
    }

    int hashCode() {
        int hashCode = 0
        hashCode = 29 * (hashCode + (!id ? 0 : id ^ (id >>> 32)))
    }
}
