

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Buyer</title>
    </head>
    <body>
	
	
	    <div class="nav">
				<span class="menuButton"><g:link class="list" action="list">Buyer List</g:link></span>
				<span class="menuButton"><g:link class="create" action="create">New Buyer</g:link></span>
	    </div>
		
		<div class="body">
            <h1>Show Buyer</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${buyer.id}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Forename:</td>
                            
                            <td valign="top" class="value">${buyer.forename}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Surname:</td>
                            
                            <td valign="top" class="value">${buyer.surname}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Username:</td>
                            
                            <td valign="top" class="value">${buyer.username}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Email:</td>
                            
                            <td valign="top" class="value">${buyer.email}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Telephone No:</td>
                            
                            <td valign="top" class="value">${buyer.telephoneNo}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Appointments:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="a" in="${buyer.appointments}">
                                    <li><g:link controller="appointment" action="show" id="${a.id}">${a}</g:link></li>
                                </g:each>
                                </ul>
                            </td>

                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Available Properties:</td>
                            
                            <td valign="top" class="value">${buyer.availableProperties}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${buyer?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
  
</html>