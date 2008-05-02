acegi {
  loadAcegi=true

  algorithm="MD5" 
  //use Base64 text ( true or false )
  encodeHashAsBase64=false
  errorPage="null"

  /** login user domain class name and fields */
  loginUserDomainClass="AuthUser"
  userName="username"
  password="passwd"
  enabled="enabled"
  relationalAuthorities = "authorities"
  /* you can specify method for to retrieve the roles. (you need to set relationalAuthorities=null)
  */
  //getAuthoritiesMethod=null //"getMoreAuthorities"

  /**
   * Authority domain class authority field name 
   * authorityFieldInList
   */
  authorityDomainClass="Roles"
  authorityField="authority"

  /** use RequestMap from DomainClass */
  useRequestMapDomainClass = true
  /** Requestmap domain class (if useRequestMapDomainClass = true) */
  requestMapClass="Requestmap"
  requestMapPathField="url"
  requestMapConfigAttributeField="configAttribute"

	

 /** 
  * if useRequestMapDomainClass is false, set request map pattern in string
  * see example below
  */
 /*  requestMapString = """
  CONVERT_URL_TO_LOWERCASE_BEFORE_COMPARISON
  PATTERN_TYPE_APACHE_ANT

  /login/**=IS_AUTHENTICATED_ANONYMOUSLY
  /admin/**=ROLE_USER
  /book/test/**=IS_AUTHENTICATED_FULLY
  /book/**=ROLE_SUPERVISOR
  /**=IS_AUTHENTICATED_ANONYMOUSLY
  """*/
  requestMapString = """
	  CONVERT_URL_TO_LOWERCASE_BEFORE_COMPARISON
	  PATTERN_TYPE_APACHE_ANT

	/login/**=IS_AUTHENTICATED_ANONYMOUSLY
	/property/list*=IS_AUTHENTICATED_ANONYMOUSLY
	/property/index*=IS_AUTHENTICATED_ANONYMOUSLY
	/property/create*=ROLE_SELLER,ROLE_ESTATEAGENT
	/property/update/*=ROLE_SELLER,ROLE_ESTATEAGENT
	/property/edit/*=ROLE_SELLER,ROLE_ESTATEAGENT
	/property/delete/*=ROLE_SELLER,ROLE_ESTATEAGENT
	/property/save/*=ROLE_SELLER,ROLE_ESTATEAGENT
	/buyer/list*=ROLE_ESTATEAGENT
	/buyer/index*=ROLE_ESTATEAGENT
	/buyer/show/*=ROLE_ESTATEAGENT,ROLE_BUYER
	/buyer/create*=ROLE_BUYER
	/buyer/update/*=ROLE_BUYER
	/buyer/edit/*=ROLE_BUYER
	/buyer/delete/*=ROLE_BUYER
	/buyer/save/*=ROLE_BUYER
	/seller/list*=ROLE_ESTATEAGENT
	/seller/index*=ROLE_ESTATEAGENT
	/seller/show/*=ROLE_ESTATEAGENT,ROLE_SELLER
	/seller/create*=ROLE_SELLER
	/seller/update/*=ROLE_SELLER
	/seller/edit/*=ROLE_SELLER
	/seller/delete/*=ROLE_SELLER
	/seller/save/*=ROLE_SELLER
	/estateagent/list*=ROLE_ESTATEAGENT
	/estateagent/index*=ROLE_ESTATEAGENT
	/estateagent/show/*=ROLE_ESTATEAGENT
	/estateagent/create*=ROLE_ESTATEAGENT
	/estateagent/update/*=ROLE_ESTATEAGENT
	/estateagent/edit/*=ROLE_ESTATEAGENT
	/estateagent/delete/*=ROLE_ESTATEAGENT
	/estateagent/save/*=ROLE_ESTATEAGENT
	/appointment/list*=ROLE_ESTATEAGENT,ROLE_BUYER
	/appointment/index*=ROLE_ESTATEAGENT,ROLE_BUYER
    /appointment/show/*=IS_AUTHENTICATED_REMEMBERED
	/appointment/create*=IS_AUTHENTICATED_REMEMBERED
	/appointment/update/*=IS_AUTHENTICATED_REMEMBERED
	/appointment/delete/*=IS_AUTHENTICATED_REMEMBERED
	/appointment/save/*=IS_AUTHENTICATED_REMEMBERED
  	"""

 /**
  * To use email notification for user registration, set the following userMail to
  * true and config your mail settings.Note you also need to implement the script
  * grails generate-registration.
  */
  useMail = false
  mailHost = "localhost"
  mailUsername = "user@localhost"
  mailPassword = "sungod"
  mailProtocol = "smtp"
  mailFrom = "user@localhost"
  
  /** AJAX request header */
  ajaxHeader="X-Requested-With"
  
  /** default user's role for user registration */
  defaultRole="ROLE_USER"
  
  /** use basicProcessingFilter */
  basicProcessingFilter=false
  /** use switchUserProcessingFilter */
  switchUserProcessingFilter=false
}