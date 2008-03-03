

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Vendor List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Vendor</g:link></span>
        </div>
        <div class="body">
            <h1>Vendor List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="address" title="Address" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="phone" title="Phone" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${vendorList}" status="i" var="vendor">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${vendor.id}">${vendor.id?.encodeAsHTML()}</g:link></td>
                        
                            <td>${vendor.address?.encodeAsHTML()}</td>
                        
                            <td>${vendor.name?.encodeAsHTML()}</td>
                        
                            <td>${vendor.phone?.encodeAsHTML()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Vendor.count()}" />
            </div>
        </div>
    </body>
</html>
