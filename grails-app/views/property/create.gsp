 <resource:dateChooser/>
 <g:javascript src="datesManagement.js"/>
 <g:javascript src="multifile.js"/>
 
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
                                 <label>Visit period:</label>
                               <td id="visits">
                                   <g:datesEdit beanid="${property.id}"/>
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
                                   <textarea id="description" name="description" rows="6" cols="50">${fieldValue(bean:property,field:'description')}</TEXTAREA>
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
                                   <label for="picture">Picture:</label>
                               </td>
                               <td valign="top" class="value ${hasErrors(bean:property,field:'picture','errors')}">
                                    <input id='picture' type='file' name='picture_0' onChange="addElement()"/>
                                   <div id="fileList" style=" background: rgb(255, 255, 255) none repeat scroll 0%; font-size: x-small;"/>
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
