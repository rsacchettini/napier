

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title><g:message code="apointment.createTitle"/></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="appointment.list"/></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="appointment.createTitle"/></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${appointment}">
            <div class="errors">
                <g:renderErrors bean="${appointment}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
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
                    <span class="button"><input class="save" type="submit" value="${message(appointment:'create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
