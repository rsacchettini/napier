/**
 * AuthUser for user account
 * @author 
 */
class AuthUser {
	static transients = ["pass"]
	static hasMany=[authorities:Roles]
	static belongsTo = Roles


    def beforeDelete = {
		def list = Interested.findAll("from Interested as i where i.myBuyer.id=?",this.id)
        list.each{i->i.delete(flush:true)}
        authorities.each{i->i.removeFromPeople(this)}
    }

    /** Username */
	String username
	/** User Real Name*/
	String userRealName
	/** MD5 Password */
	String passwd
	/** enabled */
	String telephoneNo
	String surname
	String forename

	boolean enabled = false

	String email
	boolean email_show = false

	/** description */
	String description=""

	/** plain password to create a MD5 password */
	String pass="[secret]"

	static def constraints = {
		username(blank:false,unique:true)
		userRealName(blank:false)
		passwd(blank:false)
		telephoneNo(blank:false)
		forename(blank:false)
        surname(blank:false)
		enabled()
	}

	 int hashCode() {
          int hashCode = 0
          hashCode = 29 * (hashCode + ( !id ? 0 : id ^ (id >>> 32)))
      }
	String toString() { "$username" }
}