class Buyer {
    String name
    static belongsTo = Property             
    static hasMany = [properties:Property, visits:Visit]

    String toString() {
           return name    
       }
}
