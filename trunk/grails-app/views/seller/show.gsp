

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Seller</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Seller List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Seller</g:link></span>
        </div>
        <div class="body">
            <h1>Show Seller</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${seller.id}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">My Forename:</td>
                            
                            <td valign="top" class="value">${seller.myForename}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">My Surname:</td>
                            
                            <td valign="top" class="value">${seller.mySurname}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">My Username:</td>
                            
                            <td valign="top" class="value">${seller.myUsername}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">My Password:</td>
                            
                            <td valign="top" class="value">${seller.myPassword}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">My Email:</td>
                            
                            <td valign="top" class="value">${seller.myEmail}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">My Telephone No:</td>
                            
                            <td valign="top" class="value">${seller.myTelephoneNo}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">My Address:</td>
                            
                            <td valign="top" class="value">${seller.myAddress}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Sell Properties:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="s" in="${seller.sellProperties}">
                                    <li><g:link controller="property" action="show" id="${s.id}">${s}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${seller?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
