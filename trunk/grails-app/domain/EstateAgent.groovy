class EstateAgent {
      String name
      static hasMany = [visits:Visit]
                     
      String toString() {
           return name
       }
}
