

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit EstateAgent</title>
    </head>
    <body>
        <div id="leftFrame">
	   		<ul class="navLeft">
				<li><span class="menuButton"><g:link class="list" action="list">EstateAgent List</g:link></span></li>
				<li><span class="menuButton"><g:link class="create" action="create">New EstateAgent</g:link></span></li>
	        </ul>
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
                                    <label for="forename">Forename:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:estateAgent,field:'forename','errors')}">
                                    <input type="text" id="forename" name="forename" value="${fieldValue(bean:estateAgent,field:'forename')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surname">Surname:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:estateAgent,field:'surname','errors')}">
                                    <input type="text" id="surname" name="surname" value="${fieldValue(bean:estateAgent,field:'surname')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="username">Username:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:estateAgent,field:'username','errors')}">
                                    <input type="text" id="username" name="username" value="${fieldValue(bean:estateAgent,field:'username')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password">Password:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:estateAgent,field:'password','errors')}">
                                    <input type="text" id="password" name="password" value="${fieldValue(bean:estateAgent,field:'password')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email">Email:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:estateAgent,field:'email','errors')}">
                                    <input type="text" id="email" name="email" value="${fieldValue(bean:estateAgent,field:'email')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="telephoneNo">Telephone No:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:estateAgent,field:'telephoneNo','errors')}">
                                    <input type="text" id="telephoneNo" name="telephoneNo" value="${fieldValue(bean:estateAgent,field:'telephoneNo')}"/>
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
