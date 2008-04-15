

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Property List</title>
    </head>
    <body>
        <div class="nav">
		    <span class="menuButton"><g:link class="create" action="create">New Property</g:link></span>
        </div>
        <div class="body">
            <h1>Property List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <tr>
                        
                        <g:sortableColumn property="id" title="Id" />

                        <g:sortableColumn property="address" title="Address" />

                        <g:sortableColumn property="city" title="City" />

                        <g:sortableColumn property="postCode" title="Post Code" />

                        <g:sortableColumn property="minPrice" title="Price" />

                        <g:sortableColumn property="description" title="Description" />

                    </tr>
                </table>
                <g:each in="${propertyList}" status="i" var="property">
                    <table width="100%">
                        <tr>
                            <td width="21%">Ref: ${property.id?.encodeAsHTML()}</td>
                            <td width="79%" class="fullAddress">${property.address?.encodeAsHTML()}, ${property.city?.encodeAsHTML()}, ${property.postCode?.encodeAsHTML()}</td>
                        </tr>
                        <tr>
                            <td width="21%" rowspan="2"><img src="${createLinkTo(dir:'')}/images/properties/${property.picture[0]}" width="150" height="100" /></td>
                            <td class="price">Offers Over &pound;${property.minPrice?.encodeAsHTML()}</td>
                        </tr>
                        <g:set var="desc" value="${property.description}" />
                        <g:if test="${desc.size() > 300}"><g:set var="desc" value="${desc[0..300] + '...'}" /></g:if>
                        <tr>
                            <td>${desc}</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="info"><g:link action="show" id="${property.id}"> more details</g:link></td>
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
