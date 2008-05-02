<%--
  Created by IntelliJ IDEA.
  User: Romain
  Date: 16 avr. 2008
  Time: 15:22:09
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
	   <meta name="layout" content="main" />
	  <title>User Registration</title></head>
  <body>
  	  <div class="body">
		  <h1>User Registration : Step 1/2 : Choose your role</h1>
		  <g:if test="${flash.message}">
			<div class="message">${flash.message}</div>
		  </g:if>
		   <g:form action="roleSaveToCredentials" method="post" >
				<div class="dialog">
				  <table>
					<tbody>

				   <tr class='prop'>
					<td valign='top' class='name'>
					  You want to register as a:
					</td>
					<g:each in="${authorityList}">
						<g:if test="${it.authority?.substring(5)?.toLowerCase() != 'estateagent'}" >
						  <tr>
							<td valign='top' class='name' align="left">
							  ${it.authority?.substring(5)?.toLowerCase()?.encodeAsHTML()}
							</td>
							<td align="left">
							   <g:radio id='role' name='role' value="${it.authority}" ></g:radio>
							</td>
						  </tr>
					</g:if>
				  </g:each>
		   </tbody>
			  </table>
			</div>

			<div class="buttons">
			  <span class="formButton">
				<input type="submit" value="Continue to Step 2"/>
			  </span>
			</div>

		  </g:form>

  </body>
</html>