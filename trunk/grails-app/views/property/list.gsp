

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Property List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Property</g:link></span>
        </div>
        <div class="body">
            <h1>Property List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="address" title="Address" />
                        
                   	        <th>Estate Agent</th>
                   	    
                   	        <g:sortableColumn property="postcode" title="Postcode" />
                        
                   	        <g:sortableColumn property="surface" title="Surface" />
                        
                   	        <th>Vendor</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${propertyList}" status="i" var="property">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${property.id}">${property.id?.encodeAsHTML()}</g:link></td>
                        
                            <td>${property.address?.encodeAsHTML()}</td>
                        
                            <td>${property.estateAgent?.encodeAsHTML()}</td>
                        
                            <td>${property.postcode?.encodeAsHTML()}</td>
                        
                            <td>${property.surface?.encodeAsHTML()}</td>
                        
                            <td>${property.vendor?.encodeAsHTML()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Property.count()}" />
            </div>
        </div>
    </body>
</html>
