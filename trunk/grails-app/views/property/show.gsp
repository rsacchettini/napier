<resource:carousel/>
<resource:googlemaps key="ABQIAAAAPV8yFSv3BrLOmXDSgOZToBSZdinvBdzatcCUIyBeKyYBtjjO1RTYrMLX9IGAE-tlgH2Br-wU1D-D6g" />
<g:javascript src="mapManagement.js"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title><g:message code="property.showTitle"/></title>
		<g:javascript library="prototype" />
	</head>
    <body>
        <div class="nav">
			<g:ifAnyGranted role="ROLE_SELLER,ROLE_ESTATEAGENT">
				<span class="menuButton"><g:link class="create" action="create">${message(code:'property.create')}</g:link></span>
			</g:ifAnyGranted>
		</div>
        <div class="body">
            <h1><g:message code="property.showTitle"/></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
			<div class="property">
				<table>
				  <tr>
					<td class="fullAddress">${property.address}, ${property.city}, ${property.postCode}</td>
				  </tr>
				  <tr>
					<td align="center">
						<div class="carousel">
							<richui:carousel direction="horizontal" carouselStyle="height: 210px; width:750px;" itemsStyle="height: 200px;">
								<g:imageDisp2 id="imgDisp" mode="view" beanid="${property.id}" />
						   </richui:carousel>
					   </div>
					</td>
				  </tr>
				  <tr>
					<td class="price">Offers Over &pound;${property.minPrice}</td>
				  </tr>
				  <tr>
					<td class="titleSection">Key features</td>
				  </tr>
				  <tr>
					<td class="valueSection">
						<ul>
							<li>Property Type : ${property.category}</li>
							<li>Number of Bedrooms : ${property.bedroomNumber}</li>
						</ul>
					</td>
					</tr>
				  <tr>
					<td class="titleSection">Description</td>
				  </tr>
				  <tr>
					<td class="valueSection">${property.description}</td>
				  </tr>
				   <tr>
					<td class="titleSection">Appointments
				  <tr class="valueSection">
					<td>
						<ul>
							<g:each var="a" in="${property.appointments}">
			                <li><g:link controller="appointment" action="show" id="${a.id}">${a}</g:link></li>
			                </g:each>			
						</ul>
					</td>
				  </tr>
				  <tr>
					<td class="titleSection">Available Viewing Slots</td>
				  </tr>
				  <tr>
					<td class="valueSection"><g:datesDisp mode="view" beanid="${property.id}"/></td>
				  </tr>
				  <tr>
					<td class="titleSection">Map</td>
				  </tr>
				  <tr>
					<td align="center">
                        <richui:googlemaps lat="${resultLat}" lng="${resultLng}" mapStyle="width: 750px; height: 300px;" style="width: 750px; background: #F1F1F1; border: 1px solid #F1F1F1;" />
                        
					</td>
				  </tr>
				  <tr>
				  <td>The indicator on the above map does not necessarily indicate the exact position of the property and should therefore only be taken as a proximity indicator. Positions outside of built up areas are likely to be less accurate then those in built up areas. Maps are provided by GoogleMaps.
			We cannot plot positions outside of the UK
				  </td>
				  </tr>
				</table>
			</div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${property?.id}" />
			  <g:ifAnyGranted role="ROLE_SELLER,ROLE_ESTATEAGENT">
				  <g:ifSellerProperty>
					  <span class="button"><g:link class="edit" controller="property" action="edit" id="${property?.id}">${message(code:'property.edit')}</g:link></span>
				  </g:ifSellerProperty>
                  <g:ifAnyGranted role="ROLE_ESTATEAGENT">
                      <span class="button"><g:link class="edit" controller="property" action="edit" id="${property?.id}">${message(code:'property.edit')}</g:link></span>
                  </g:ifAnyGranted>
                    <g:ifSellerProperty>
                        <span class="button"><g:actionSubmit class="delete" action="delete" onclick="return confirm('Are you sure?');" value="${message(code:'property.delete')}"/></span>
			        </g:ifSellerProperty>
			      </g:ifAnyGranted>
			     <g:ifAnyGranted role="ROLE_BUYER">


                   <g:if test="${isRemovable==true}">
                                     <span class="button"><g:actionSubmit class="edit" action="removeInterest" value="${message(code:'buyer.removeInterest')}"/></span>
			        </g:if>
                   <g:if test="${isRemovable==false}">
                        <span class="button"><g:actionSubmit class="edit" action="addInterest" value="${message(code:'buyer.addInterest')}"/></span>
			        </g:if>
                 </g:ifAnyGranted>
		</g:form>
            </div>
        </div>
    </body>
</html>