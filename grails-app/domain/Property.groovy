class Property {

    Seller isSoldBy
    EstateAgent isManagedBy
    
    static belongsTo = [isSoldBy: Seller]
    static hasMany = [interestedBuyers: Buyer, appointements: Appointment]


    boolean equals(other) {
        if (other?.is(this)) return true
        if (!(other instanceof Property)) return false
        if (!id || !other?.id || id != other?.id) return false
        return true
    }

    int hashCode() {
        int hashCode = 0
        hashCode = 29 * (hashCode + (!id ? 0 : id ^ (id >>> 32)))
    }

}
