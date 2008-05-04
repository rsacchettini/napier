

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title><g:message code="appointment.showTitle"/></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="appointment.list"/></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="appointment.new"/></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="appointment.showTitle"/></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${appointment.id}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Date And Time:</td>
                            
                            <td valign="top" class="value">${appointment.dateAndTime}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Buyer:</td>
                            
                            <td valign="top" class="value"><g:link controller="buyer" action="show" id="${appointment?.buyer?.id}">${appointment?.buyer}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Is Managed By:</td>
                            
                            <td valign="top" class="value"><g:link controller="estateAgent" action="show" id="${appointment?.isManagedBy?.id}">${appointment?.isManagedBy}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Property:</td>
                            
                            <td valign="top" class="value"><g:link controller="property" action="show" id="${appointment?.property?.id}">${appointment?.property}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${appointment?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="Edit" value="${message(code:'appointment.edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" action="Delete" value="${message(code:'appointment.delete')}" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
