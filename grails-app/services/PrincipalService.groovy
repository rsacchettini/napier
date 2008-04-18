class PrincipalService {

    boolean transactional = true

     static getPrincipal() {
		AuthenticateService authenticateService = new AuthenticateService()
  		def principal = authenticateService.principal()
		return principal
	}
}
