

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>My Seller account</title>
    </head>
    <body>
        <div id="leftFrame">
	   		<ul class="navLeft">
                <li><span class="menuButton"><a href="${createLinkTo(dir:'')}/seller/edit/${seller.id}" class="edit">Edit my profil</a></span></li>
                <li></li>
                <li><span class="menuButton"><a href="${createLinkTo(dir:'')}/property/create" class="create">Add a property</a></span></li>
                <li><span class="menuButton"><a href="${createLinkTo(dir:'')}/property/edit/1" class="edit">Edit a property</a></span></li>
                <li><span class="menuButton"><a href="${createLinkTo(dir:'')}/property/list" class="list">My properties</a></span></li>
            </ul>
	    </div>

        <div class="body">
            <div><p> >> Hello ${seller.forename} ${seller.surname},</p><p></p><p>Welcome in your space of management.</p></div>
            <h1>My profil</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Forename:</td>
                            
                            <td valign="top" class="value">${seller.forename}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Surname:</td>
                            
                            <td valign="top" class="value">${seller.surname}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Username:</td>
                            
                            <td valign="top" class="value">${seller.username}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Password:</td>
                            
                            <td valign="top" class="value">${seller.password}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Email:</td>
                            
                            <td valign="top" class="value">${seller.email}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Telephone No:</td>
                            
                            <td valign="top" class="value">${seller.telephoneNo}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Address:</td>
                            
                            <td valign="top" class="value">${seller.address}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">City:</td>
                            
                            <td valign="top" class="value">${seller.city}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Post Code:</td>
                            
                            <td valign="top" class="value">${seller.postCode}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
                <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${seller?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
                <h1>.</h1>
                <h1>My properties</h1>
                <table>
                    <tr>
                        <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="s" in="${seller.sellProperties}">
                                    <li><g:link controller="property" action="show" id="${s.id}">Reference: ${s.id}</g:link></li>
                                </g:each>
                                </ul>
                          </td>
                    </tr>
                </table>
            </div>
        </div>
    </body>
</html>
