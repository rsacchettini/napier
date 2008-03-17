

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
                        
                   	        <g:sortableColumn property="myReferenceNo" title="My Reference No" />
                        
                   	        <g:sortableColumn property="myAvailableFrom[0]" title="Start Date" />

                            <g:sortableColumn property="myAvailableFrom[1]" title="End Date" />

                            <g:sortableColumn property="myaddress" title="Myaddress" />
                        
                   	        <g:sortableColumn property="myPostCode" title="My Post Code" />
                        
                   	        <g:sortableColumn property="myMinPrice" title="My Min Price" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${propertyList}" status="i" var="property">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${property.id}">${property.id?.encodeAsHTML()}</g:link></td>
                        
                            <td>${property.myReferenceNo?.encodeAsHTML()}</td>
                        
                            <td>${property.myAvailableFrom[0]?.encodeAsHTML()}</td>

                            <td>${property.myAvailableFrom[1]?.encodeAsHTML()}</td>
                        
                            <td>${property.myaddress?.encodeAsHTML()}</td>
                        
                            <td>${property.myPostCode?.encodeAsHTML()}</td>
                        
                            <td>${property.myMinPrice?.encodeAsHTML()}</td>
                        
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
