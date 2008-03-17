

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
            <g:form action="save" method="post"  enctype="multipart/form-data">
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="myReferenceNo">My Reference No:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:property,field:'myReferenceNo','errors')}">
                                    <input type="text" id="myReferenceNo" name="myReferenceNo" value="${fieldValue(bean:property,field:'myReferenceNo')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="myAvailableFrom[0]">My Available From:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:property,field:'myAvailableFrom','errors')}">
                                    <input type="text" id="myAvailableFrom[0]" name="End Date" value="${fieldValue(bean:property,field:'myAvailableFrom')}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="myAvailableFrom[1]">My Available From:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:property,field:'myAvailableFrom','errors')}">
                                    <input type="text" id="myAvailableFrom[1]" name="End DAte" value="${fieldValue(bean:property,field:'myAvailableFrom')}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="myaddress">Myaddress:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:property,field:'myaddress','errors')}">
                                    <input type="text" id="myaddress" name="myaddress" value="${fieldValue(bean:property,field:'myaddress')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="myPostCode">My Post Code:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:property,field:'myPostCode','errors')}">
                                    <input type="text" id="myPostCode" name="myPostCode" value="${fieldValue(bean:property,field:'myPostCode')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="myMinPrice">My Min Price:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:property,field:'myMinPrice','errors')}">
                                    <input type="text" id="myMinPrice" name="myMinPrice" value="${fieldValue(bean:property,field:'myMinPrice')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="myDescription">My Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:property,field:'myDescription','errors')}">
                                    <input type="text" id="myDescription" name="myDescription" value="${fieldValue(bean:property,field:'myDescription')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="myBedroomNumber">My Bedroom Number:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:property,field:'myBedroomNumber','errors')}">
                                    <input type="text" id="myBedroomNumber" name="myBedroomNumber" value="${fieldValue(bean:property,field:'myBedroomNumber')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="isManagedBy">Is Managed By:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:property,field:'isManagedBy','errors')}">
                                    <g:select optionKey="id" from="${EstateAgent.list()}" name="isManagedBy.id" value="${property?.isManagedBy?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="isSoldBy">Is Sold By:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:property,field:'isSoldBy','errors')}">
                                    <g:select optionKey="id" from="${Seller.list()}" name="isSoldBy.id" value="${property?.isSoldBy?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="myMaxPrice">My Max Price:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:property,field:'myMaxPrice','errors')}">
                                    <input type="text" id="myMaxPrice" name="myMaxPrice" value="${fieldValue(bean:property,field:'myMaxPrice')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="myPicture">My Picture:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:property,field:'myPicture','errors')}">
                                    <input type="file" id="myPicture" name="myPicture" />
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
