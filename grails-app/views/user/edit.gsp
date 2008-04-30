  
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Edit AuthUser</title>
  </head>
  <body>
    <div class="nav">
      <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
      <span class="menuButton"><g:link class="list" action="list">User List</g:link></span>
      <span class="menuButton"><g:link class="create" action="create">New User</g:link></span>
    </div>

	<div class="body">
      <h1>Edit AuthUser</h1>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <g:hasErrors bean="${person}">
        <div class="errors">
          <g:renderErrors bean="${person}" as="list" />
        </div>
      </g:hasErrors>
      
      <div class="prop">
	    <span class="name">Id:</span>
	    <span class="value">${person?.id}</span>
      </div>
                 
      <g:form controller="user" method="post" >
        <input type="hidden" name="id" value="${person?.id}" />
        <div class="dialog">
          <table>
            <tbody> 
                       
		      <tr class='prop'>
			    <td valign='top' class='name'>
			      <label for='username'>Login Name:</label>
			    </td>
				<td valign='top' 
				    class='value ${hasErrors(bean:person,field:'username','errors')}'>
				  <input type="text" name='username' 
				         value="${person?.username?.encodeAsHTML()}"/>
				</td>
			  </tr>
                       
			  <tr class="prop">
				<td valign="top" class="name">
					<label for="forename">Forename:</label>
				</td>
				<td valign="top" class="value ${hasErrors(bean:person,field:'forename','errors')}">
					<input type="text" id="forename" name="forename" value="${fieldValue(bean:person,field:'forename')}"/>
				</td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name">
					<label for="surname">Surname:</label>
				</td>
				<td valign="top" class="value ${hasErrors(bean:person,field:'surname','errors')}">
					<input type="text" id="surname" name="surname" value="${fieldValue(bean:person,field:'surname')}"/>
				</td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name">
					<label for="telephoneNo">Telephone No:</label>
				</td>
				<td valign="top" class="value ${hasErrors(bean:person,field:'telephoneNo','errors')}">
					<input type="text" id="telephoneNo" name="telephoneNo" value="${fieldValue(bean:person,field:'telephoneNo')}"/>
				</td>
			</tr>
                       
			  <tr class='prop'>
			    <td valign='top' class='name'>
			      <label for='passwd'>Password:</label>
			    </td>
				<td valign='top' 
				    class='value ${hasErrors(bean:person,field:'passwd','errors')}'>
				  <input type="password" name='passwd' 
				         value="${person?.passwd?.encodeAsHTML()}"/>
				</td>
			  </tr>
                       
			  <tr class='prop'>
				<td valign='top' class='name'>
				  <label for='enabled'>Enabled:</label>
				</td>
				<td valign='top' 
				    class='value ${hasErrors(bean:person,field:'enabled','errors')}'>
				  <g:checkBox name='enabled' value="${person?.enabled}" ></g:checkBox>
				</td>
			  </tr>
                       
			  <tr class='prop'>
			    <td valign='top' class='name'>
			      <label for='description'>Description:</label>
			    </td>
				<td valign='top' 
				    class='value ${hasErrors(bean:person,field:'description','errors')}'>
				  <input type="text" name='description' 
				         value="${person?.description?.encodeAsHTML()}"/>
				</td>
			  </tr>
                       
			  <tr class='prop'>
			    <td valign='top' class='name'>
			      <label for='email'>Email:</label>
			    </td>
				<td valign='top' 
				    class='value ${hasErrors(bean:person,field:'email','errors')}'>
				  <input type="text" name='email' 
				         value="${person?.email?.encodeAsHTML()}"/>
				</td>
			  </tr>
                       
			  <tr class='prop'>
			    <td valign='top' class='name'>
			      <label for='email_show'>Show Email:</label>
			    </td>
				<td valign='top' 
				    class='value ${hasErrors(bean:person,field:'email_show','errors')}'>
				  <g:checkBox id='email_show' name='email_show' value="${person?.email_show}" >
				  </g:checkBox>
				</td>
			  </tr>
                       
            </tbody>
          </table>
        </div>

        <div class="buttons">
          <span class="button"><g:actionSubmit class="save" value="Update" /></span>
          <span class="button"><g:actionSubmit class="delete" value="Delete" /></span>
        </div>
        
      </g:form>
      
    </div>
  </body>
</html>
