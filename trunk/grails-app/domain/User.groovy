class User {
    /* ---------- Attributes ---------- */
    String mySurname
	String myForename
	String myUsername
	String myPassword
	String myEmail
	String myTelephoneNo

	static constraints =
    {
       myForename(blank:false)
       mySurname(blank:false)
       myUsername(blank:false, unique:true, length:2..15)
       myPassword(blank:false, matches:/[\w\d]+/)
       myEmail(email:true, blank:false)
       myTelephoneNo(blank:false)
    }

    //This string will be returned by default in lists views when the selection of an User is required.
    String toString() { "$myForename $mySurname" }

    int hashCode() {
          int hashCode = 0
          hashCode = 29 * (hashCode + ( !id ? 0 : id ^ (id >>> 32)))
      }
}
