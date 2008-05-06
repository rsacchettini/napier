  
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>AuthUser List</title>
  </head>
  <body>
    <div class="nav">
      <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
      <span class="menuButton"><g:link class="create" action="create">New User</g:link></span>
    </div>
	<div class="body">
      <h1>AuthUser List</h1>
      <g:if test="${flash.message}">
        <div class="message">
          ${flash.message}
        </div>
      </g:if>
      <table>
        <tbody>
          <g:each in="${personList}">
            <tr>
                       
              <td>${it.id?.encodeAsHTML()}</td>
                       
              <td>${it.username?.encodeAsHTML()}</td>
                       
              <td>${it.forename?.encodeAsHTML()}</td>

			  <td>${it.surname?.encodeAsHTML()}</td>

			  <td>${it.telephoneNo?.encodeAsHTML()}</td>

			  <td>${it.enabled?.encodeAsHTML()}</td>
                       
              <td>${it.description?.encodeAsHTML()} <g:collect in="${it.authorities}" expr="${it.authority}">${it?.substring(5)?.toLowerCase()}<br/></g:collect>
			  </td>

			  <td class="actionButtons">
                <span class="actionButton">
                  <g:link action="show" id="${it.id}">Show</g:link>
                </span>
              </td>
            </tr>
          </g:each>
        </tbody>
      </table>
    
      <div class="paginateButtons">
        <g:paginate total="${AuthUser.count()}" />
      </div>
      
    </div>
  </body>
</html>
