  
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Show AuthUser</title>
  </head>
  <body>
    <div class="nav">
      <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
      <span class="menuButton"><g:link class="list" action="list">User List</g:link></span>
      <span class="menuButton"><g:link class="create" action="create">New User</g:link></span>
    </div>
    
    <div class="body">
      <h1>Show AuthUser</h1>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <div class="dialog">
        <table>
          <tbody>
                   
            <tr class="prop">
              <td valign="top" class="name">Id:</td>
              <td valign="top" class="value">${person.id?.encodeAsHTML()}</td>
            </tr>
                   
            <tr class="prop">
              <td valign="top" class="name">Login Name:</td>
              <td valign="top" class="value">
              	${person.username?.encodeAsHTML()}
              </td>
            </tr>
                   
            <tr class="prop">
              <td valign="top" class="name">Full Name:</td>
              <td valign="top" class="value">
                ${person.forename?.encodeAsHTML()}
              </td>
            </tr>

			<tr class="prop">
              <td valign="top" class="name">Full Name:</td>
              <td valign="top" class="value">
                ${person.surname?.encodeAsHTML()}
              </td>
            </tr>

			<tr class="prop">
              <td valign="top" class="name">Full Name:</td>
              <td valign="top" class="value">
                ${person.telephoneNo?.encodeAsHTML()}
              </td>
            </tr>

			<tr class="prop">
              <td valign="top" class="name">Enabled:</td>
              <td valign="top" class="value">
                ${person.enabled?.encodeAsHTML()}
              </td>
            </tr>
            <!--
            <tr class="prop">
              <td valign="top" class="name">Description:</td>
              <td valign="top" class="value">
                ${person.description?.encodeAsHTML()}
              </td>
            </tr>
            -->
                   
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
              <td valign="top" class="name">Roles:</td>
              <td valign="top" class="value">
                <ul>
                <g:collect in="${person.authorities}" expr="${it.authority}">
                  ${it?.substring(5)?.toLowerCase()}<br/>
                </g:collect>
                </ul>
              </td>
            </tr>
                   
          </tbody>
        </table>
      </div>
      
      <div class="buttons">
        <g:form controller="user">
          <input type="hidden" name="id" value="${person?.id}" />
          <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
          <span class="button"><g:actionSubmit class="delete" value="Delete" /></span>
        </g:form>
      </div>
      
    </div>
  </body>
</html>
