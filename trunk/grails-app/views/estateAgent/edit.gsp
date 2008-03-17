

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit EstateAgent</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">EstateAgent List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New EstateAgent</g:link></span>
        </div>
        <div class="body">
            <h1>Edit EstateAgent</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${estateAgent}">
            <div class="errors">
                <g:renderErrors bean="${estateAgent}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${estateAgent?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="myForename">My Forename:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:estateAgent,field:'myForename','errors')}">
                                    <input type="text" id="myForename" name="myForename" value="${fieldValue(bean:estateAgent,field:'myForename')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="mySurname">My Surname:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:estateAgent,field:'mySurname','errors')}">
                                    <input type="text" id="mySurname" name="mySurname" value="${fieldValue(bean:estateAgent,field:'mySurname')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="myUsername">My Username:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:estateAgent,field:'myUsername','errors')}">
                                    <input type="text" id="myUsername" name="myUsername" value="${fieldValue(bean:estateAgent,field:'myUsername')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="myPassword">My Password:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:estateAgent,field:'myPassword','errors')}">
                                    <input type="text" id="myPassword" name="myPassword" value="${fieldValue(bean:estateAgent,field:'myPassword')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="myEmail">My Email:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:estateAgent,field:'myEmail','errors')}">
                                    <input type="text" id="myEmail" name="myEmail" value="${fieldValue(bean:estateAgent,field:'myEmail')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="myTelephoneNo">My Telephone No:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:estateAgent,field:'myTelephoneNo','errors')}">
                                    <input type="text" id="myTelephoneNo" name="myTelephoneNo" value="${fieldValue(bean:estateAgent,field:'myTelephoneNo')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="appointementsToManage">Appointements To Manage:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:estateAgent,field:'appointementsToManage','errors')}">
                                    
<ul>
<g:each var="a" in="${estateAgent?.appointementsToManage?}">
    <li><g:link controller="appointment" action="show" id="${a.id}">${a}</g:link></li>
</g:each>
</ul>
<g:link controller="appointment" params="["estateAgent.id":estateAgent?.id]" action="create">Add Appointment</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="propertiesToManage">Properties To Manage:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:estateAgent,field:'propertiesToManage','errors')}">
                                    
<ul>
<g:each var="p" in="${estateAgent?.propertiesToManage?}">
    <li><g:link controller="property" action="show" id="${p.id}">${p}</g:link></li>
</g:each>
</ul>
<g:link controller="property" params="["estateAgent.id":estateAgent?.id]" action="create">Add Property</g:link>

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
