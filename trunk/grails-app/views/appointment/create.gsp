

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title><g:message code="appointment.createTitle"/></title>
		<g:javascript library="prototype" /> 
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
									<g:select name="theAvailableDate" from="${availableDate}" />
									<input type="button" value="test" onclick="${remoteFunction(
																							  controller: 'appointment',
																							  action: 'getFreeTimeList',
																							  update: 'elm'
																							  )}"/>
								
									<div id="elm"><g:select name="theAvailableTime" from="${availableTime}" /></div>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <input type="hidden" id="buyer.id" name="buyer.id" value="${(Buyer?.findByUsername(PrincipalService?.getPrincipal()?.getUsername()))?.id}" />
                                    <input type="hidden" id="property.id" name="property.id" value="${id_property}" />
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
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="${message(code:'appointment.save')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
