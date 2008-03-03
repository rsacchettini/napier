

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Property</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Property List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Property</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${property}">
            <div class="errors">
                <g:renderErrors bean="${property}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="address">Address:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:property,field:'address','errors')}">
                                    <input type="text" id="address" name="address" value="${fieldValue(bean:property,field:'address')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="estateAgent">Estate Agent:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:property,field:'estateAgent','errors')}">
                                    <g:select optionKey="id" from="${EstateAgent.list()}" name="estateAgent.id" value="${property?.estateAgent?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="postcode">Postcode:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:property,field:'postcode','errors')}">
                                    <input type="text" id="postcode" name="postcode" value="${fieldValue(bean:property,field:'postcode')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surface">Surface:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:property,field:'surface','errors')}">
                                    <input type="text" id="surface" name="surface" value="${fieldValue(bean:property,field:'surface')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="vendor">Vendor:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:property,field:'vendor','errors')}">
                                    <g:select optionKey="id" from="${Vendor.list()}" name="vendor.id" value="${property?.vendor?.id}" ></g:select>
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
