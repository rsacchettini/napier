

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Buyer List</title>
    </head>
    <body>
		<div id="leftFrame">
	   		<ul class="navLeft">
				<li><span class="menuButton"><g:link class="create" action="create">New Buyer</g:link></span></li>
	        </ul>
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
                        
                   	        <g:sortableColumn property="forename" title="Forename" />
                        
                   	        <g:sortableColumn property="surname" title="Surname" />
                        
                   	        <g:sortableColumn property="username" title="Username" />
                        
                   	        <g:sortableColumn property="password" title="Password" />
                        
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
                        
                            <td>${buyer.password?.encodeAsHTML()}</td>
                        
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