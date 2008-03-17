

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Seller</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Seller List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Seller</g:link></span>
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
                                    <label for="myForename">My Forename:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:seller,field:'myForename','errors')}">
                                    <input type="text" id="myForename" name="myForename" value="${fieldValue(bean:seller,field:'myForename')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="mySurname">My Surname:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:seller,field:'mySurname','errors')}">
                                    <input type="text" id="mySurname" name="mySurname" value="${fieldValue(bean:seller,field:'mySurname')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="myUsername">My Username:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:seller,field:'myUsername','errors')}">
                                    <input type="text" id="myUsername" name="myUsername" value="${fieldValue(bean:seller,field:'myUsername')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="myPassword">My Password:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:seller,field:'myPassword','errors')}">
                                    <input type="text" id="myPassword" name="myPassword" value="${fieldValue(bean:seller,field:'myPassword')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="myEmail">My Email:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:seller,field:'myEmail','errors')}">
                                    <input type="text" id="myEmail" name="myEmail" value="${fieldValue(bean:seller,field:'myEmail')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="myTelephoneNo">My Telephone No:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:seller,field:'myTelephoneNo','errors')}">
                                    <input type="text" id="myTelephoneNo" name="myTelephoneNo" value="${fieldValue(bean:seller,field:'myTelephoneNo')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="myAddress">My Address:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:seller,field:'myAddress','errors')}">
                                    <input type="text" id="myAddress" name="myAddress" value="${fieldValue(bean:seller,field:'myAddress')}"/>
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
