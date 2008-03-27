
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Property</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Property List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Property</g:link></span>
        </div>
        <div class="body">
            <h1>Show Property</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${property.id}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Reference No:</td>
                            
                            <td valign="top" class="value">${property.referenceNo}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">View Times : </td>
                            <td  valign="top" style="text-align:left;" class="value">
                                 <table>
									<g:each var="it" status="i" in="${availableFrom}">
											<g:if test="${(i % 2) == 0}">
											  <tr>
											  <td>From:</td><td><g:formatDate format="dd-MM-yyyy" date="${(Date)it}"/></td>
											</g:if>
											<g:else>
												<td>To:</td><td><g:formatDate format="dd-MM-yyyy" date="${(Date)it}"/></td>
											 </tr>
											</g:else>
									</g:each>
                                </table>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">To:</td>



                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Address:</td>
                            
                            <td valign="top" class="value">${property.address}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Post Code:</td>
                            
                            <td valign="top" class="value">${property.postCode}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Min Price:</td>
                            
                            <td valign="top" class="value">${property.minPrice}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Description:</td>
                            
                            <td valign="top" class="value">${property.description}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Bedroom Number:</td>
                            
                            <td valign="top" class="value">${property.bedroomNumber}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Appointements:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="a" in="${property.appointements}">
                                    <li><g:link controller="appointment" action="show" id="${a.id}">${a}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Interested Buyers:</td>
                            
                            <td valign="top" class="value">${property.interestedBuyers}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Is Managed By:</td>
                            
                            <td valign="top" class="value"><g:link controller="estateAgent" action="show" id="${property?.isManagedBy?.id}">${property?.isManagedBy}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Is Sold By:</td>
                            
                            <td valign="top" class="value"><g:link controller="seller" action="show" id="${property?.isSoldBy?.id}">${property?.isSoldBy}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Max Price:</td>
                            
                            <td valign="top" class="value">${property.maxPrice}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                  
                            <g:if test="${property.picture}">
                              <img class="avatar" src="${createLink(controller:'property', action:'property_image', id:property.ident())}" />
                            </g:if>

                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Validated:</td>
                            
                            <td valign="top" class="value">${property.validated}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${property?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
