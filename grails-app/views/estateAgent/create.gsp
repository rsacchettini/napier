

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create EstateAgent</title>         
    </head>
    <body>
		<div id="leftFrame">
	   		<ul class="navLeft">
				<li><span class="menuButton"><g:link class="list" action="list">EstateAgent List</g:link></span></li>
	        </ul>
	    </div>
        <div class="body">
            <h1>Create EstateAgent</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${estateAgent}">
            <div class="errors">
                <g:renderErrors bean="${estateAgent}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
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
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
