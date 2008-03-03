

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Visit</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Visit List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Visit</g:link></span>
        </div>
        <div class="body">
            <h1>Show Visit</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${visit.id}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Buyer:</td>
                            
                            <td valign="top" class="value"><g:link controller="buyer" action="show" id="${visit?.buyer?.id}">${visit?.buyer}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Date:</td>
                            
                            <td valign="top" class="value">${visit.date}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Estate Agent:</td>
                            
                            <td valign="top" class="value"><g:link controller="estateAgent" action="show" id="${visit?.estateAgent?.id}">${visit?.estateAgent}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Property:</td>
                            
                            <td valign="top" class="value"><g:link controller="property" action="show" id="${visit?.property?.id}">${visit?.property}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${visit?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
