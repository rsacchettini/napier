
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Edit Profile</title>
  </head>
  <body>
  	<div class="nav">
      <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}" >Home</a></span>
    </div>
	<div class="body">
      <h1>Edit my <g:collect in="${person.authorities}" expr="${it.authority}"> ${it?.substring(5)?.toLowerCase()}</g:collect> account</h1>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <g:hasErrors bean="${person}">
        <div class="errors">
          <g:renderErrors bean="${person}" as="list" />
        </div>
      </g:hasErrors>

      <g:form controller="register" method="post" >
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
          <input type="hidden" name='username'
            value="${person?.username?.encodeAsHTML()}"/>
            <div style="margin:3px">${person?.username?.encodeAsHTML()}</div>
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
		<g:ifAnyGranted role="ROLE_SELLER">
			<tr id="sellerAddress" class="prop">
				<td valign="top" class="name">
					<label for="address">Address:</label>
				</td>
				<td valign="top" class="value ${hasErrors(bean:person,field:'address','errors')}">
					<input type="text" id="address" name="address" value="${fieldValue(bean:person,field:'address')}"/>
				</td>
			</tr>

			<tr id="sellerCity" class="prop">
				<td valign="top" class="name">
					<label for="city">City:</label>
				</td>
				<td valign="top" class="value ${hasErrors(bean:person,field:'city','errors')}">
					<input type="text" id="city" name="city" value="${fieldValue(bean:person,field:'city')}"/>
				</td>
			</tr>

			<tr id="sellerPostCode" class="prop">
				<td valign="top" class="name">
					<label for="postCode">Post Code:</label>
				</td>
				<td valign="top" class="value ${hasErrors(bean:person,field:'postCode','errors')}">
					<input type="text" id="postCode" name="postCode" value="${fieldValue(bean:person,field:'postCode')}"/>
				</td>
			</tr>
		</g:ifAnyGranted>

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
            <input type="password" name='passwd' value=""/>
          </td>
        </tr>

        <tr class='prop'>
          <td valign='top' class='name'>
            <label for='enabled'>Confirm Password:</label>
          </td>
          <td valign='top'
            class='value ${hasErrors(bean:person,field:'passwd','errors')}'>
            <input type="password" name='repasswd'
              value=""/>
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
            <g:checkBox name='email_show' value="${person?.email_show}" ></g:checkBox>
          </td>
        </tr>

            </tbody>
          </table>
        </div>

        <div class="buttons">
          <span class="button"><g:actionSubmit class="save" value="Update" /></span>
        </div>

      </g:form>

    </div>
  </body>
</html>
