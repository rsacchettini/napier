

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title><g:message code="seller.createTitle"/></title>         
    </head>
    <body>
        <div id="leftFrame">
	   		<ul class="navLeft">
				        <title><g:message code="seller.createTitle"/></title> 
                <li><span class="menuButton"><a href="${createLinkTo(dir:'')}/seller/edit/1" class="edit">Edit my profil</a></span></li>
                <li><span class="menuButton"><a href="${createLinkTo(dir:'')}/property/create" class="create">Add a property</a></span></li>
                <li><span class="menuButton"><a href="${createLinkTo(dir:'')}/property/edit/1" class="edit">Edit a property</a></span></li>
                <li><span class="menuButton"><a href="${createLinkTo(dir:'')}/property/list" class="list">List my properties</a></span></li>
            </ul>
	    </div>
        <div class="body">
            <h1><g:message code="seller.createTitle"/></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${seller}">
            <div class="errors">
                <g:renderErrors bean="${seller}" as="list" />
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
                                <td valign="top" class="value ${hasErrors(bean:seller,field:'forename','errors')}">
                                    <input type="text" id="forename" name="forename" value="${fieldValue(bean:seller,field:'forename')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surname">Surname:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:seller,field:'surname','errors')}">
                                    <input type="text" id="surname" name="surname" value="${fieldValue(bean:seller,field:'surname')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="username">Username:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:seller,field:'username','errors')}">
                                    <input type="text" id="username" name="username" value="${fieldValue(bean:seller,field:'username')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="passwd">Password:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:seller,field:'passwd','errors')}">
                                    <input type="passwd" id="passwd" name="passwd" value="${fieldValue(bean:seller,field:'passwd')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email">Email:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:seller,field:'email','errors')}">
                                    <input type="text" id="email" name="email" value="${fieldValue(bean:seller,field:'email')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="telephoneNo">Telephone No:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:seller,field:'telephoneNo','errors')}">
                                    <input type="text" id="telephoneNo" name="telephoneNo" value="${fieldValue(bean:seller,field:'telephoneNo')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="address">Address:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:seller,field:'address','errors')}">
                                    <input type="text" id="address" name="address" value="${fieldValue(bean:seller,field:'address')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="city">City:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:seller,field:'city','errors')}">
                                    <input type="text" id="city" name="city" value="${fieldValue(bean:seller,field:'city')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="postCode">Post Code:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:seller,field:'postCode','errors')}">
                                    <input type="text" id="postCode" name="postCode" value="${fieldValue(bean:seller,field:'postCode')}"/>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="${message(code:'seller.create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
