

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title><g:message code="buyer.listTitle"/></title>
    </head>
    <body>
		<div class="nav">
				<span class="menuButton"><g:link class="create" action="create"><g:message code="buyer.new"/></g:link></span>
	    </div>
        <div class="body">
            <h1><g:message code="buyer.listTitle"/></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="forename" title="Forename" />
                        
                   	        <g:sortableColumn property="surname" title="Surname" />
                        
                   	        <g:sortableColumn property="username" title="Username" />

                   	        <g:sortableColumn property="email" title="Email" />

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${buyerList}" status="i" var="buyer">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td><g:link action="show" id="${buyer.id}">${buyer.id?.encodeAsHTML()}</g:link></td>
                        
                            <td>${buyer.forename?.encodeAsHTML()}</td>
                        
                            <td>${buyer.surname?.encodeAsHTML()}</td>
                        
                            <td>${buyer.username?.encodeAsHTML()}</td>
                        
                            <td>${buyer.email?.encodeAsHTML()}</td>
                        
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
