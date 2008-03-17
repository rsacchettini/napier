

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Buyer</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Buyer List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Buyer</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Buyer</h1>
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
                                    <label for="myForename">My Forename:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:buyer,field:'myForename','errors')}">
                                    <input type="text" id="myForename" name="myForename" value="${fieldValue(bean:buyer,field:'myForename')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="mySurname">My Surname:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:buyer,field:'mySurname','errors')}">
                                    <input type="text" id="mySurname" name="mySurname" value="${fieldValue(bean:buyer,field:'mySurname')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="myUsername">My Username:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:buyer,field:'myUsername','errors')}">
                                    <input type="text" id="myUsername" name="myUsername" value="${fieldValue(bean:buyer,field:'myUsername')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="myPassword">My Password:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:buyer,field:'myPassword','errors')}">
                                    <input type="text" id="myPassword" name="myPassword" value="${fieldValue(bean:buyer,field:'myPassword')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="myEmail">My Email:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:buyer,field:'myEmail','errors')}">
                                    <input type="text" id="myEmail" name="myEmail" value="${fieldValue(bean:buyer,field:'myEmail')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="myTelephoneNo">My Telephone No:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:buyer,field:'myTelephoneNo','errors')}">
                                    <input type="text" id="myTelephoneNo" name="myTelephoneNo" value="${fieldValue(bean:buyer,field:'myTelephoneNo')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="appointements">Appointements:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:buyer,field:'appointements','errors')}">
                                    
<ul>
<g:each var="a" in="${buyer?.appointements?}">
    <li><g:link controller="appointment" action="show" id="${a.id}">${a}</g:link></li>
</g:each>
</ul>
<g:link controller="appointment" params="["buyer.id":buyer?.id]" action="create">Add Appointment</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="availableProperties">Available Properties:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:buyer,field:'availableProperties','errors')}">
                                    
<ul>
<g:each var="a" in="${buyer?.availableProperties?}">
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
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
