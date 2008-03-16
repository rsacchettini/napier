class Buyer extends User {


    static hasMany = [availableProperties: Property, appointements: Appointment]
    def belongsTo = Property


    boolean equals(other) {
        if (other?.is(this)) return true
        if (!(other instanceof Buyer)) return false
        if (!id || !other?.id || id != other?.id) return false
        return true
    }

    int hashCode() {
        int hashCode = 0
        hashCode = 29 * (hashCode + (!id ? 0 : id ^ (id >>> 32)))
    }

}
