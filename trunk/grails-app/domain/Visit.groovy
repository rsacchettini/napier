class Visit {
    Date date
    EstateAgent estateAgent
    Buyer buyer
    Property property
    static belongsTo = [estateAgent:EstateAgent,buyer:Buyer,property:Property]

    String toString() {
           return date   
      }
}
