 <resource:dateChooser/>
 <g:javascript src="datesManagement.js"/>
 <g:javascript src="multifile.js"/>
 
   <html>
   <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
       <meta name="layout" content="main" />
       <title><g:message code="property.create"/></title>
   </head>
   <body onload="init()">
   <g:form action="save" method="post"  enctype="multipart/form-data">
       <div class="nav">
           <span class="button"><input class="save" type="submit" value="${message(code:'property.save')}">
       </div>
       <div class="body">
           <h1><g:message code="property.create"/></h1>
           <g:if test="${flash.message}">
           <div class="message">${flash.message}</div>
           </g:if>
           <g:hasErrors bean="${property}">
           <div class="errors">
               <g:renderErrors bean="${property}" as="list" />
           </div>
           </g:hasErrors>
           
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
                                   <label for="category">Type of property:</label>
                               </td>
                               <td valign="top" class="value ${hasErrors(bean:property,field:'category','errors')}">
                                    <g:select id="category" name="category" from="${property.constraints.category.inList.collect{it.encodeAsHTML()}}" value="${fieldValue(bean:property,field:'category')}" ></g:select>
                               </td>
                           </tr>
                           <tr class="prop">
                               <td valign="top" class="name">
                                   <label for="address">Address:</label>
                               </td>
                               <td valign="top" class="value ${hasErrors(bean:property,field:'address','errors')}">
                                   <input type="text" id="address" name="address" value="${fieldValue(bean:property,field:'address')}" size="30"/> e.g. 18/1 Balcarres Street
                               </td>
                           </tr>
							<tr class="prop">
                               <td valign="top" class="name">
                                   <label for="postCode">Post Code:</label>
                               </td>
                               <td valign="top" class="value ${hasErrors(bean:property,field:'postCode','errors')}">
                                   <input type="text" id="postCode" name="postCode" value="${fieldValue(bean:property,field:'postCode')}" size="8"/> e.g. EH10 5JD
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
                                   <label for="description">Description:</label>
                               </td>
                               <td valign="top" class="value ${hasErrors(bean:property,field:'description','errors')}">
                                   <textarea id="description" name="description" rows="6" cols="300">${fieldValue(bean:property,field:'description')}</TEXTAREA>
								   <!--<richui:richTextEditor name="description" type="advanced" value="${fieldValue(bean:property,field:'description')}" width="525" />-->
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
                                    <input id='picture' type='file' name='picture_0' onChange="addElement()"/>
                                   <div id="fileList" style=" background: rgb(255, 255, 255) none repeat scroll 0%; font-size: x-small;"/>
                               </td>
                           </tr>
							<tr class="prop">
                               <td valign="top" class="name">
                                   <label for="minPrice">Offers Over:</label>
                               </td>
                               <td valign="top" class="value ${hasErrors(bean:property,field:'minPrice','errors')}">
                                   &pound;<input type="text" id="minPrice" name="minPrice" value="${fieldValue(bean:property,field:'minPrice')}" />
                               </td>
                           </tr>
						   <tr class="prop">
                               <td valign="top" class="name">
                                 <label>Visit period:</label>
                               <td id="visits">
                                   <table>
									  
										  <g:each var="a" status="i" in="${property.availableFrom}">
											<g:if test="${(i % 2) == 0}">
												<tr>
												<td valign="top" class="name">
												  <label>Available From:</label>
											   </td>
												<td valign="top" class="value ${hasErrors(bean:property,field:'availableFrom','errors')}">
													<richui:dateChooser name="${i <2 ? 'availableFrom1' : 'availableFrom1'+'_'+((i/2)+1) }" format="dd/MM/yyyy" value="${(Date)a}" />
												</td>
											</g:if>
											<g:else>
												<td valign="top" class="name">
													<label>To:</label>
												</td>
												<td valign="top" class="value ${hasErrors(bean:property,field:'availableFrom','errors')}">
													<richui:dateChooser name="${i <2 ? 'availableFrom2' : 'availableFrom2'+'_'+((i-1)/2+1) }" format="dd/MM/yyyy" value="${(Date)a}" />
												</td>
												<td><a href="#" onclick="delLigne(this); return false;">Del</a></td>
											 </tr>
											</g:else>
										 </g:each>
										   <tr>
											   <th>
												   <a onclick="addLigne(this); return false;" href="#">Add a time slot</a>
											   </th>
										   </tr>

								   </table>
                              </td>
                          </tr>
                           <tr class="prop">
                               <td valign="top" class="name">
                                   <label for="isManagedBy">This property will be Managed By:</label>
                               </td>
                               <td valign="top" class="value ${hasErrors(bean:property,field:'isManagedBy','errors')}">
                                   <g:select optionKey="id" from="${EstateAgent.list()}" name="isManagedBy.id" value="${property?.isManagedBy?.id}" ></g:select>
                               </td>
                           </tr>
						   
							<g:ifAnyGranted role="ROLE_SELLER">
										<input type="hidden" id="isSoldBy.id" name="isSoldBy.id" value="${(Seller?.findByUsername(PrincipalService?.getPrincipal()?.getUsername()))?.id}" />
		                                <!--<input type="text" disabled="true" value="${(Seller?.findByUsername(PrincipalService?.getPrincipal()?.getUsername()))?.id}" />-->
								   </g:ifAnyGranted>
							<!--<tr class="prop">
                               <td valign="top" class="name">
                                   <label for="isSoldBy">Is Sold By:</label>
                               </td>
                               <td valign="top" class="value ${hasErrors(bean:property,field:'isSoldBy','errors')}">

                               </td>
                           </tr>
	   					   -->
	   						<g:ifAnyGranted role="ROLE_ESTATEAGENT">
                           <tr class="prop">
                               <td valign="top" class="name">
                                   <label for="validated">Validated:</label>

                               </td>
                               <td valign="top" class="value ${hasErrors(bean:property,field:'validated','errors')}">
                                   <g:checkBox name="validated" value="${property?.validated}" ></g:checkBox>
                               </td>
                           </tr>
							</g:ifAnyGranted>
                       </tbody>
                   </table>
               </div>
               <div class="buttons">
                   <span class="button"><input class="save" type="submit" value="${message(code:'property.save')}">
               </div>
           </g:form>
       </div>
   </body>
   </html>
