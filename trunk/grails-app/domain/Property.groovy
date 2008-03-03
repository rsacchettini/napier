class Property {
       String postcode
       String address
       String Surface

       static belongsTo = Vendor
       static hasMany = [buyers:Buyer, visits:Visit]
       Vendor vendor
       EstateAgent estateAgent

       String toString() {
           return address    
       }
}
