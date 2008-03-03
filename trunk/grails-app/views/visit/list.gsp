

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Visit List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Visit</g:link></span>
        </div>
        <div class="body">
            <h1>Visit List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>Buyer</th>
                   	    
                   	        <g:sortableColumn property="date" title="Date" />
                        
                   	        <th>Estate Agent</th>
                   	    
                   	        <th>Property</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${visitList}" status="i" var="visit">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${visit.id}">${visit.id?.encodeAsHTML()}</g:link></td>
                        
                            <td>${visit.buyer?.encodeAsHTML()}</td>
                        
                            <td>${visit.date?.encodeAsHTML()}</td>
                        
                            <td>${visit.estateAgent?.encodeAsHTML()}</td>
                        
                            <td>${visit.property?.encodeAsHTML()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Visit.count()}" />
            </div>
        </div>
    </body>
</html>
