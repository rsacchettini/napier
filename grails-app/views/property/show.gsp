<resource:carousel/>
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
                            <td valign="top" class="name">Id: ${property.id}</td>
                            <td valign="top" class="fullAddress">${property.address}, ${property.city}, ${property.postCode}</td>
                        </tr>

                         <tr class="prop">
                            <td valign="top" class="name">Pictures :</td> 
                            <td valign="top" align="middle" class="value">
							   <table>
									<tr>
									   <richui:carousel direction="horizontal" carouselStyle="height: 210px;" itemsStyle="height: 200px;">
											<g:imageDisp2 id="imgDisp" mode="view" beanid="${property.id}" />
									   </richui:carousel>
									</tr>
								</table>
							</td>              
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Asking Price:</td>
                            <td valign="top" class="price2">Offers Over &pound;${property.minPrice}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Description:</td>
                            <td valign="top" class="description">${property.description}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Bedrooms:</td>
                            <td valign="top" class="description">${property.bedroomNumber}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Appointments:</td>
                            
                            <td  valign="top" style="text-align:left;" class="description">
                                <ul>
                                <g:each var="a" in="${property.appointments}">
                                    <li><g:link controller="appointment" action="show" id="${a.id}">${a}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Visit periods:</td>
                            
                            <td valign="top" class="description"><g:datesDisp mode="view" beanid="${property.id}"/></td>
                            
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
