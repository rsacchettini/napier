

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
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:buyer,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:buyer,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="properties">Properties:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:buyer,field:'properties','errors')}">
                                    
<ul>
<g:each var="p" in="${buyer?.properties?}">
    <li><g:link controller="property" action="show" id="${p.id}">${p}</g:link></li>
</g:each>
</ul>
<g:link controller="property" params="["buyer.id":buyer?.id]" action="create">Add Property</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="visits">Visits:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:buyer,field:'visits','errors')}">
                                    
<ul>
<g:each var="v" in="${buyer?.visits?}">
    <li><g:link controller="visit" action="show" id="${v.id}">${v}</g:link></li>
</g:each>
</ul>
<g:link controller="visit" params="["buyer.id":buyer?.id]" action="create">Add Visit</g:link>

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
