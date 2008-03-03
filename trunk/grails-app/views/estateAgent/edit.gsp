

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
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:estateAgent,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:estateAgent,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="visits">Visits:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:estateAgent,field:'visits','errors')}">
                                    
<ul>
<g:each var="v" in="${estateAgent?.visits?}">
    <li><g:link controller="visit" action="show" id="${v.id}">${v}</g:link></li>
</g:each>
</ul>
<g:link controller="visit" params="["estateAgent.id":estateAgent?.id]" action="create">Add Visit</g:link>

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
