

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title><g:message code="buyer.editTitle"/></title>
    </head>
    <body>
        <div class="nav">
		    <span class="menuButton"><g:link class="list" action="list"><g:message code="buyer.list></g:link></span>
		    <span class="menuButton"><g:link class="create" action="create"><g:message code="buyer.new></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="buyer.editTitle"/></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${buyer}">
            <div class="errors">
                <g:renderErrors bean="${buyer}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${buyer?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="forename">Forename:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:buyer,field:'forename','errors')}">
                                    <input type="text" id="forename" name="forename" value="${fieldValue(bean:buyer,field:'forename')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surname">Surname:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:buyer,field:'surname','errors')}">
                                    <input type="text" id="surname" name="surname" value="${fieldValue(bean:buyer,field:'surname')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="username">Username:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:buyer,field:'username','errors')}">
                                    <input type="text" id="username" name="username" value="${fieldValue(bean:buyer,field:'username')}"/>
                                </td>
                            </tr> 
                        



                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email">Email:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:buyer,field:'email','errors')}">
                                    <input type="text" id="email" name="email" value="${fieldValue(bean:buyer,field:'email')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="telephoneNo">Telephone No:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:buyer,field:'telephoneNo','errors')}">
                                    <input type="text" id="telephoneNo" name="telephoneNo" value="${fieldValue(bean:buyer,field:'telephoneNo')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="Appointments">Appointments:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:buyer,field:'Appointments','errors')}">

                                    
<ul>
<g:each var="a" in="${buyer?.appointments?}">
    <li><g:link controller="appointment" action="show" id="${a.id}">${a}</g:link></li>
</g:each>
</ul>
<g:link controller="appointment" params="["buyer.id":buyer?.]" action="create">Add Appointment</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="availableProperties">Available Properties:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:buyer,field:'listedProperties','errors')}">
                                                         <g:select name="buyer.listedProperties.id" from="${Property.list()}" value="${buyer?.listedProperties.id}" optionKey="id" />               
<ul>
<g:each var="a" in="${buyer?.listedProperties?}">
    <li><g:link controller="property" action="show" id="${a.id}">${a}</g:link></li>
</g:each>
</ul>
<g:link controller="property" params="["buyer.id":buyer?.id]" action="create">Add Property</g:link>

                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="Update" value="${message(code:'buyer.update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" action="Delete" value="${message(code:'buyer.delete')}" /></span>
                </div>
                <input type="hidden" id="passwd" name="passwd" value="${fieldValue(bean:buyer,field:'passwd')}"/>
            </g:form>
        </div>
    </body>
</html>
