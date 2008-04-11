

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Seller</title>
    </head>
    <body>
        <div id="leftFrame">
	   		<ul class="navLeft">
				<li><span class="menuButton"><g:link class="list" action="list">Seller List</g:link></span></li>
				<li><span class="menuButton"><g:link class="create" action="create">New Seller</g:link></span></li>
	        </ul>
	    </div>
        <div class="body">
            <h1>Edit Seller</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${seller}">
            <div class="errors">
                <g:renderErrors bean="${seller}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${seller?.id}" />
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
                                    <label for="password">Password:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:seller,field:'password','errors')}">
                                    <input type="password" id="password" name="password" value="${fieldValue(bean:seller,field:'password')}"/>
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
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sellProperties">Sell Properties:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:seller,field:'sellProperties','errors')}">
                                    
<ul>
<g:each var="s" in="${seller?.sellProperties?}">
    <li><g:link controller="property" action="show" id="${s.id}">${s}</g:link></li>
</g:each>
</ul>
<g:link controller="property" params="["seller.id":seller?.id]" action="create">Add Property</g:link>

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
