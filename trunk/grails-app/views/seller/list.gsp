

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Seller List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Seller</g:link></span>
        </div>
        <div class="body">
            <h1>Seller List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="myForename" title="My Forename" />
                        
                   	        <g:sortableColumn property="mySurname" title="My Surname" />
                        
                   	        <g:sortableColumn property="myUsername" title="My Username" />
                        
                   	        <g:sortableColumn property="myPassword" title="My Password" />
                        
                   	        <g:sortableColumn property="myEmail" title="My Email" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${sellerList}" status="i" var="seller">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${seller.id}">${seller.id?.encodeAsHTML()}</g:link></td>
                        
                            <td>${seller.myForename?.encodeAsHTML()}</td>
                        
                            <td>${seller.mySurname?.encodeAsHTML()}</td>
                        
                            <td>${seller.myUsername?.encodeAsHTML()}</td>
                        
                            <td>${seller.myPassword?.encodeAsHTML()}</td>
                        
                            <td>${seller.myEmail?.encodeAsHTML()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Seller.count()}" />
            </div>
        </div>
    </body>
</html>
