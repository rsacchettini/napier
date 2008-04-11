

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Property List</title>
    </head>
    <body>
		<div id="leftFrame">
	   		<ul class="navLeft">
				<li><span class="menuButton"><g:link class="create" action="create">New Property</g:link></span></li>
	        </ul>
	    </div>
        <div class="body">
            <h1>Property List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            
			<div class="list">
				<g:each in="${propertyList}" status="i" var="property">
				<table width="100%">
				 <tr>
				    <td width="21%">Ref: ${property.referenceNo?.encodeAsHTML()}</td>
				    <td width="79%">${property.address?.encodeAsHTML()}, ${property.postCode?.encodeAsHTML()}</td>
				  </tr>
				  <tr>
				    <td width="21%" rowspan="3"><img src="/sourceProject/images/properties/27/img_1.jpg" width="200" height="203" /></td>
				    <td>Offers Over ${property.minPrice?.encodeAsHTML()}</td>
				  </tr>
				  <tr>
				    <td>${property.description?.encodeAsHTML()}</td>
				  </tr>
				  <tr>
				    <td>+ PLUS</td>
				  </tr>
				</table>
				</g:each>
			</div>	
            
            <div class="paginateButtons">
                <g:paginate total="${Property.count()}" />
            </div>
        </div>
    </body>
</html>
