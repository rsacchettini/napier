

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Vendor</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Vendor List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Vendor</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Vendor</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${vendor}">
            <div class="errors">
                <g:renderErrors bean="${vendor}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${vendor?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="address">Address:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vendor,field:'address','errors')}">
                                    <input type="text" id="address" name="address" value="${fieldValue(bean:vendor,field:'address')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vendor,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:vendor,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phone">Phone:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vendor,field:'phone','errors')}">
                                    <input type="text" id="phone" name="phone" value="${fieldValue(bean:vendor,field:'phone')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="properties">Properties:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vendor,field:'properties','errors')}">
                                    
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="visits">Visits:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:vendor,field:'visits','errors')}">
                                    
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
