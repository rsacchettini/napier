class User {
    /* ---------- Attributes ---------- */
    String surname
	String forename
	String username
	String password
	String email
	String telephoneNo

	static constraints =
    {
       forename(blank:false)
       surname(blank:false)
       username(blank:false, unique:true, length:2..15)
       password(blank:false, matches:/[\w\d]+/)
       email(email:true, blank:false)
       telephoneNo(blank:false)
    }

    //This string will be returned by default in lists views when the selection of an User is required.
    String toString() { "$forename $surname" }

    int hashCode() {
          int hashCode = 0
          hashCode = 29 * (hashCode + ( !id ? 0 : id ^ (id >>> 32)))
      }
}
