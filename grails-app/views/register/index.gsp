<g:javascript src="registerControllerindexView.js"/>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>User Registration</title>         
  </head>
  <body>
    <div class="nav">
      <span class="menuButton"><a href="${createLinkTo(dir:'')}">Home</a></span>
    </div>
    <div class="body">
      <h1>User Registration</h1>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <g:hasErrors bean="${person}">
        <div class="errors">
          <g:renderErrors bean="${person}" as="list" />
        </div>
      </g:hasErrors>
      <g:form action="save" method="post" >
        <div class="dialog">
          <table>
            <tbody>

			   <tr class='prop'>
			    <td valign='top' class='name'>
			      Register as a:
			    </td>
				<g:each in="${authorityList}">
					<g:if test="${it.authority?.substring(5)?.toLowerCase() != 'estateagent'}" >
					  <tr>
						<td valign='top' class='name' align="left">
						  ${it.authority?.substring(5)?.toLowerCase()?.encodeAsHTML()}
						</td>
						<td align="left">
						   <g:radio id='role' name='role' onselect="checkRole(this.value)" value="${it.authority}" ></g:radio>
						</td>
					  </tr>
				</g:if>
			  </g:each>

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
                       
              <!--<tr class='prop'>
                <td valign='top' class='name'>
                  <label for='userRealName'>Full Name:</label>
                </td>
                <td valign='top' 
                    class='value ${hasErrors(bean:person,field:'userRealName','errors')}'>
                  <input type="text" name='userRealName' 
                  		 value="${person?.userRealName?.encodeAsHTML()}"/>
                </td>
              </tr>-->

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
                  <label for='enabled'>Confirm Password:</label>
                </td>
                <td valign='top' 
                	class='value ${hasErrors(bean:person,field:'passwd','errors')}'>
                  <input type="password" name='repasswd' 
                         value="${person?.passwd?.encodeAsHTML()}"/>
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
                <td valign='bottom' class='name'>
                  <label for='code'>Enter Code: </label>
                </td>
                <td valign='top' class='name'>
                  <input type="text" name="captcha" size="8"/>
                  <img src="${createLink(controller:'captcha', action:'index')}" align="absmiddle"/>
                </td>
              </tr>

            </tbody>
          </table>
        </div>
        
        <div class="buttons">
          <span class="formButton">
            <input type="submit" value="Create"></input>
          </span>
        </div>
            
      </g:form>
    </div>
  </body>
</html>
