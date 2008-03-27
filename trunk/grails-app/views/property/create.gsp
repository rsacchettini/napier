 <resource:dateChooser/>
 <g:javascript src="datesManagement.js"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Property</title>         
    </head>
    <body onload="init()">
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
				<input type="hidden" id="visitTimeCount" name="visitTimeCount" value="${visitTimeCount}"/>
				<div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="referenceNo">Reference No:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:property,field:'referenceNo','errors')}">
                                    <input type="text" id="referenceNo" name="referenceNo" value="${fieldValue(bean:property,field:'referenceNo')}"/>
                                </td>
                            </tr> 

                           <tr class="prop">
                                 <td valign="top" class="name">
                                   <label>Visit period:</label>
                                 <td id="period">
                                    <table>
                                        <tbody>
                                              <tr>
                                                <td valign="top" class="name">
                                                  <label>Available From:</label>
                                                </td>
                                                <td valign="top" class="name ${hasErrors(bean:property,field:'availableFrom','errors')}">
                                                  <richui:dateChooser name="availableFrom1" format="dd/MM/yyyy" value="${availableFrom1}" />
                                                </td>
                                                 <td valign="top" class="name">
                                                    <label for="availableFrom2">To:</label>
                                                 </td>
                                                 <td valign="top" class="name ${hasErrors(bean:property,field:'availableFrom','errors')}">
                                                    <richui:dateChooser name="availableFrom2" format="dd/MM/yyyy" value="${availableFrom2}" />
                                                 </td>
                                                 <td><a href="#" onclick="delLigne(this); return false;">Del</a></td>
                                              </tr>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>
                                                    <a onclick="addLigne(this); return false;" href="#">Ajouter une ligne</a>
                                                </th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </td>
                            </tr>

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
                                    <label for="postCode">Post Code:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:property,field:'postCode','errors')}">
                                    <input type="text" id="postCode" name="postCode" value="${fieldValue(bean:property,field:'postCode')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="minPrice">Min Price:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:property,field:'minPrice','errors')}">
                                    <input type="text" id="minPrice" name="minPrice" value="${fieldValue(bean:property,field:'minPrice')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:property,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:property,field:'description')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bedroomNumber">Bedroom Number:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:property,field:'bedroomNumber','errors')}">
                                    <input type="text" id="bedroomNumber" name="bedroomNumber" value="${fieldValue(bean:property,field:'bedroomNumber')}" />
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
                                    <label for="maxPrice">Max Price:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:property,field:'maxPrice','errors')}">
                                    <input type="text" id="maxPrice" name="maxPrice" value="${fieldValue(bean:property,field:'maxPrice')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="picture">Picture:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:property,field:'picture','errors')}">
                                    <input type="file" id="picture" name="picture" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="validated">Validated:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:property,field:'validated','errors')}">
                                    <g:checkBox name="validated" value="${property?.validated}" ></g:checkBox>
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
