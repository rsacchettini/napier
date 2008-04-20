<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'layout.css')}"/>
 <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'main.css')}"/>
 <link rel="shortcut icon" href="${createLinkTo(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>
 <title><g:layoutTitle default="Grails"/> - Napier Estate Agency</title>
     <g:layoutHead/>
    <g:javascript library="application"/>
 </head>
 
 <body>
<div id="container">
  <div id="header">
	<div class="loginmenu">
		<ul>
			<g:isLoggedIn>
  				<li><g:link controller="logout" action="index">[>log out]</g:link></li>
				<li><g:link controller="register" action="show" id="${authenticateService?.userDomain()?.id}">[>my account]</g:link></li>
			</g:isLoggedIn>
			<g:isNotLoggedIn>
			   <li><g:link controller="login"><g:message code="main.login" /></g:link></li>
			   <li><g:link controller="register"><g:message code="main.register" /></g:link></li>
			</g:isNotLoggedIn>
		</ul>
	</div>
	<div class="indentmenu">
            <ul>

					<li><g:link controller="property" action="index"><g:message code="main.properties" /> (${Property?.list()?.size()})</g:link></li>
				<g:isNotLoggedIn>
					 <li><g:link class="create" action="index" controller="register">
					  	<g:message code="main.registerWhenNotLogged" /></g:link></li>
				</g:isNotLoggedIn>

				<g:ifAnyGranted role="ROLE_ESTATEAGENT">
					<li><g:link controller="buyer" action="index"><g:message code="main.buyer" /></g:link></li>
					<li><g:link controller="seller" action="index"><g:message code="main.seller" /></g:link></li>
					<li><g:link controller="estateAgent" action="index"><g:message code="main.estateAgent" /></g:link></li>
					<li><g:link controller="user" action="index"><g:message code="main.adminUsers" /></g:link></li>

				</g:ifAnyGranted>
				<g:ifAnyGranted role="ROLE_SELLER">
				  <li><g:link controller="property" action="list" params="['isPersonalList':'true']"><g:message code="main.toSellproperties" /><g:sellerPropertiesNum /></g:link></li>
				</g:ifAnyGranted>
				<g:ifAnyGranted role="ROLE_BUYER">
				  <li><g:link controller="property" action="list" params="['isPersonalList':'true']"><g:message code="main.interest" /><g:buyerInterestListNum /></g:link></li>
				  <li><g:link controller="appointment" action="list" params="['isPersonalList':'true']"><g:message code="main.appointements" /><g:buyerAppointementsNum /></g:link></li>
				</g:ifAnyGranted>
        	</ul>
        <br style="clear: left" />
    </div>
  </div>
    <div id="content">
	<div id="spinner" class="spinner" style="display:none;">
    		<img src="${createLinkTo(dir: 'images', file: 'spinner.gif')}" alt="Spinner"/>
			</div>
          <g:layoutBody/>  
    </div>
  <div id="footer">GP 2 - Edinburgh Napier University</div>
</div>


</body>
</html>
