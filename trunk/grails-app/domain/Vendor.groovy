class Vendor {
    Set properties = new HashSet()
    static relatesToMany = [properties:Property,visits:Visit]
    String name
    String phone
    String address

    String toString() {
           return name    
    }
}
