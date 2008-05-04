

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title> <g:message code="appointment.editTitle"/></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="appointment.list"/></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="appointment.new"/></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="appointment.editTitle"/></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${appointment}">
            <div class="errors">
                <g:renderErrors bean="${appointment}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${appointment?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateAndTime">Date And Time:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:appointment,field:'dateAndTime','errors')}">
                                    <g:datePicker name="dateAndTime" value="${appointment?.dateAndTime}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="buyer">Buyer:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:appointment,field:'buyer','errors')}">
                                    <g:select optionKey="id" from="${Buyer.list()}" name="buyer.id" value="${appointment?.buyer?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="isManagedBy">Is Managed By:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:appointment,field:'isManagedBy','errors')}">
                                    <g:select optionKey="id" from="${EstateAgent.list()}" name="isManagedBy.id" value="${appointment?.isManagedBy?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="property">Property:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:appointment,field:'property','errors')}">
                                    <g:select optionKey="id" from="${Property.list()}" name="property.id" value="${appointment?.property?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="Update" value="${message(code:'appointment.update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" action="Delete" value="${message(code:'appointment.delete')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
