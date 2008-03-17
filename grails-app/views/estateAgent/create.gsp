

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create EstateAgent</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">EstateAgent List</g:link></span>
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
