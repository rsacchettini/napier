  
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>User Profile</title>
  </head>
  <body>
    <div class="nav">
      <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}" >Home</a></span>
    </div>
    
    <div class="body">
      <h1>My <g:collect in="${person.authorities}" expr="${it.authority}"> ${it?.substring(5)?.toLowerCase()}</g:collect> account</h1>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <div class="dialog">
        <table>
          <tbody>

            <tr class="prop">
              <td valign="top" class="name">Login Name:</td>
              <td valign="top" class="value">
              	${person.username?.encodeAsHTML()}
              </td>
            </tr>
                   
            <tr class="prop">
              <td valign="top" class="name">Full Name:</td>
              <td valign="top" class="value">
                ${person.userRealName?.encodeAsHTML()}
              </td>
            </tr>

			<tr class="prop">
				<td valign="top" class="name">Telephone No:</td>

				<td valign="top" class="value">${person.telephoneNo}</td>

			</tr>

			<g:ifAnyGranted role="ROLE_SELLER">
				<tr class="prop">
					<td valign="top" class="name">Address:</td>

					<td valign="top" class="value">${person.address}</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name">City:</td>

					<td valign="top" class="value">${person.city}</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name">Post Code:</td>

					<td valign="top" class="value">${person.postCode}</td>

				</tr>
			</g:ifAnyGranted>
			<tr class="prop">
              <td valign="top" class="name">Enabled:</td>
              <td valign="top" class="value">
                ${person.enabled?.encodeAsHTML()}
              </td>
            </tr>

            <tr class="prop">
              <td valign="top" class="name">Email:</td>
              <td valign="top" class="value">
                ${person.email?.encodeAsHTML()}
              </td>
            </tr>
                   
            <tr class="prop">
              <td valign="top" class="name">Show Email:</td>
              <td valign="top" class="value">
                ${person.email_show?.encodeAsHTML()}
              </td>
            </tr>
                   
            <tr class="prop">
              <td valign="top" class="name">Role:</td>
              <td valign="top" class="value">
                <ul>
                <g:collect in="${person.authorities}" expr="${it.authority}">${it?.substring(5)?.toLowerCase()}<br/>
                </g:collect>
                </ul>
              </td>
            </tr>
                   
          </tbody>
        </table>
      </div>
      
      <div class="buttons">
        <g:form controller="register">
          <input type="hidden" name="id" value="${person?.id}" />
          <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
        </g:form>
      </div>
      
    </div>
  </body>
</html>
