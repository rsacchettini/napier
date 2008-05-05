/**
 * Roles class for Authority
 * @author 
 */
class Roles {

	static hasMany=[people:AuthUser]
    static fetchMode = [people:"lazy"]

    /** description */
	String description
	/** ROLE String */
	String authority="ROLE_"

	static def constraints = {
		authority(blank:false)
		description()
	}
}