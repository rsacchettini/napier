<resource:carousel/>
<resource:googlemaps key="ABQIAAAAPV8yFSv3BrLOmXDSgOZToBSZdinvBdzatcCUIyBeKyYBtjjO1RTYrMLX9IGAE-tlgH2Br-wU1D-D6g" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title><g:message code="property.showTitle"/></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Property List</g:link></span>
			<g:ifAnyGranted role="ROLE_SELLER,ROLE_ESTATEAGENT">
				<span class="menuButton"><g:link class="create" action="create">New Property</g:link></span>
			</g:ifAnyGranted>
		</div>
        <div class="body">
            <h1><g:message code="property.showTitle"/></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
				<table>
                    <tbody>
                        <tr>
                            <td valign="top" class="fullAddress2">${property.address}, ${property.city}, ${property.postCode}</td>
                        </tr>

				<tr class="prop">
				<td></td>
				</tr>

                         <tr class="prop">
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
                            <td valign="top" class="price2">Offers Over &pound;${property.minPrice}</td>
                        </tr>

				<tr class="prop">
				    <td valign="top" class="title">Description</td>
				</tr>
						
                        <tr class="prop">
                            <td valign="top" class="description">${property.description}</td>
                        </tr>

				<tr class="prop">
				    <td valign="top" class="title">Property Type</td>
				</tr>

				<tr class="prop">
                            <td valign="top" class="description">${property.category}</td>
                        </tr>

				<tr class="prop">
				    <td valign="top" class="title">Number of Bedrooms</td>
				</tr>
                    
                        <tr class="prop">
                            <td valign="top" class="description">${property.bedroomNumber}</td>
                        </tr>

				<tr class="prop">
				    <td valign="top" class="title">Appointments</td>
				</tr>
                    
                        <tr class="prop">               
                            <td  valign="top" style="text-align:left;" class="description">
                                <ul>
                                <g:each var="a" in="${property.appointments}">
                                    <li><g:link controller="appointment" action="show" id="${a.id}">${a}</g:link></li>
                                </g:each>
                                </ul>
                            </td>               
                        </tr>

				<tr class="prop">
				    <td valign="top" class="title">Available Viewing Slots</td>
				</tr>
                    
                        <tr class="prop">                         
                            <td valign="top" class="description"><g:datesDisp mode="view" beanid="${property.id}"/></td>                        
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="value"><richui:googlemaps lat="${resultLat}" lng="${resultLng}" /></td>
                        </tr>

                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${property?.id}" />
			  <g:ifAnyGranted role="ROLE_SELLER">
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code:'property.edit')}"/></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" onclick="return confirm('Are you sure?');" value="${message(code:'property.delete')}"/></span>
			  </g:ifAnyGranted>
			  <g:ifAnyGranted role="ROLE_BUYER">
			  <span class="button"><g:actionSubmit class="edit" action="addInterest" value="${message(code:'buyer.addInterest')}"/></span>
			  </g:ifAnyGranted>
		</g:form>
            </div>
        </div>
    </body>
</html>
