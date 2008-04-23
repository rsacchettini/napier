<resource:dateChooser/>
<resource:richTextEditor />
 <g:javascript src="datesManagement.js"/>
 <g:javascript src="multifile.js"/>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title><g:message code="property.edit"/></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="property.list"/></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="property.list"/></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="property.edit"/></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${property}">
            <div class="errors">
                <g:renderErrors bean="${property}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" enctype="multipart/form-data">
                <script type="text/javascript">
					document.forms[0].addEventListener('submit',submitFiles,false) ;
					document.forms[0].addEventListener('submit',init,false) ;
					//document.body.addEventListener('load',init,false) ;
				</script>
				<input type="hidden" name="id" value="${property?.id}" />
                <input type="hidden" id="visitTimeCount" name="visitTimeCount" value="${visitTimeCount}"/>
				<input type="hidden" id="fileCount" name="fileCount"/>
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
                                    <label for="city">City:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:property,field:'city','errors')}">
                                    <input type="text" id="city" name="city" value="${fieldValue(bean:property,field:'city')}"/>
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
                                    <!--<input type="text" id="description" name="description" value="${fieldValue(bean:property,field:'description')}"/>-->
									<richui:richTextEditor type="advanced" name="description" value="${fieldValue(bean:property,field:'description')}" width="525" />
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
                                    <label for="picture">Picture:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:property,field:'picture','errors')}">

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="pictureType">Picture Type:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:property,field:'pictureType','errors')}">
                                    <input id='picture' type='file' name='picture_0' onChange="addElement()"/>
									<div id="fileList" style=" background: rgb(255, 255, 255) none repeat scroll 0%; font-size: x-small;"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="Appointments">Appointments:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:property,field:'Appointments','errors')}">
                                    
<ul>
<g:each var="a" in="${property?.appointments?}">
    <li><g:link controller="appointment" action="show" id="${a.id}">${a}</g:link></li>
</g:each>
</ul>
<g:link controller="appointment" params="["property.id":property?.id]" action="create">Add Appointment</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="availableFrom">Available From:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:property,field:'availableFrom','errors')}">
                                   <g:datesEdit beanid="${property.id}"/> 
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="interestedBuyers">Interested Buyers:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:property,field:'interestedBuyers','errors')}">
                                    
<ul>
<g:each var="i" in="${property?.interestedBuyers?}">
    <li><g:link controller="buyer" action="show" id="${i.id}">${i}</g:link></li>
</g:each>
</ul>
<g:link controller="buyer" params="["property.id":property?.id]" action="create">Add Buyer</g:link>

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
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code:'property.update')}"/></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" action="Delete" value="${message(code:'property.delete')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
