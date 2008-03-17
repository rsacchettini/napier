

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show EstateAgent</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">EstateAgent List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New EstateAgent</g:link></span>
        </div>
        <div class="body">
            <h1>Show EstateAgent</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${estateAgent.id}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">My Forename:</td>
                            
                            <td valign="top" class="value">${estateAgent.myForename}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">My Surname:</td>
                            
                            <td valign="top" class="value">${estateAgent.mySurname}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">My Username:</td>
                            
                            <td valign="top" class="value">${estateAgent.myUsername}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">My Password:</td>
                            
                            <td valign="top" class="value">${estateAgent.myPassword}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">My Email:</td>
                            
                            <td valign="top" class="value">${estateAgent.myEmail}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">My Telephone No:</td>
                            
                            <td valign="top" class="value">${estateAgent.myTelephoneNo}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Appointements To Manage:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="a" in="${estateAgent.appointementsToManage}">
                                    <li><g:link controller="appointment" action="show" id="${a.id}">${a}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Properties To Manage:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="p" in="${estateAgent.propertiesToManage}">
                                    <li><g:link controller="property" action="show" id="${p.id}">${p}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${estateAgent?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
