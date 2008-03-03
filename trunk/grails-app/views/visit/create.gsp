

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Visit</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Visit List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Visit</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${visit}">
            <div class="errors">
                <g:renderErrors bean="${visit}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="buyer">Buyer:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:visit,field:'buyer','errors')}">
                                    <g:select optionKey="id" from="${Buyer.list()}" name="buyer.id" value="${visit?.buyer?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="date">Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:visit,field:'date','errors')}">
                                    <g:datePicker name="date" value="${visit?.date}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="estateAgent">Estate Agent:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:visit,field:'estateAgent','errors')}">
                                    <g:select optionKey="id" from="${EstateAgent.list()}" name="estateAgent.id" value="${visit?.estateAgent?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="property">Property:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:visit,field:'property','errors')}">
                                    <g:select optionKey="id" from="${Property.list()}" name="property.id" value="${visit?.property?.id}" ></g:select>
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
