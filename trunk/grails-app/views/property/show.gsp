

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Property</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Property List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Property</g:link></span>
        </div>
        <div class="body">
            <h1>Show Property</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${property.id}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Address:</td>
                            
                            <td valign="top" class="value">${property.address}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Buyers:</td>
                            
                            <td valign="top" class="value">${property.buyers}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Estate Agent:</td>
                            
                            <td valign="top" class="value"><g:link controller="estateAgent" action="show" id="${property?.estateAgent?.id}">${property?.estateAgent}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Postcode:</td>
                            
                            <td valign="top" class="value">${property.postcode}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Surface:</td>
                            
                            <td valign="top" class="value">${property.surface}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Vendor:</td>
                            
                            <td valign="top" class="value"><g:link controller="vendor" action="show" id="${property?.vendor?.id}">${property?.vendor}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Visits:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="v" in="${property.visits}">
                                    <li><g:link controller="visit" action="show" id="${v.id}">${v}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${property?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
