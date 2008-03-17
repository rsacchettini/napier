

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Buyer List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Buyer</g:link></span>
        </div>
        <div class="body">
            <h1>Buyer List</h1>
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
                    <g:each in="${buyerList}" status="i" var="buyer">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${buyer.id}">${buyer.id?.encodeAsHTML()}</g:link></td>
                        
                            <td>${buyer.myForename?.encodeAsHTML()}</td>
                        
                            <td>${buyer.mySurname?.encodeAsHTML()}</td>
                        
                            <td>${buyer.myUsername?.encodeAsHTML()}</td>
                        
                            <td>${buyer.myPassword?.encodeAsHTML()}</td>
                        
                            <td>${buyer.myEmail?.encodeAsHTML()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Buyer.count()}" />
            </div>
        </div>
    </body>
</html>
