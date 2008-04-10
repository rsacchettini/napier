

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Seller List</title>
    </head>
    <body>
		<div id="leftFrame">
	   		<ul class="navLeft">
				<li><span class="menuButton"><g:link class="create" action="create">New Seller</g:link></span></li>
	        </ul>
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
                        
                   	        <g:sortableColumn property="forename" title="Forename" />
                        
                   	        <g:sortableColumn property="surname" title="Surname" />
                        
                   	        <g:sortableColumn property="username" title="Username" />
                        
                   	        <g:sortableColumn property="password" title="Password" />
                        
                   	        <g:sortableColumn property="email" title="Email" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${sellerList}" status="i" var="seller">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${seller.id}">${seller.id?.encodeAsHTML()}</g:link></td>
                        
                            <td>${seller.forename?.encodeAsHTML()}</td>
                        
                            <td>${seller.surname?.encodeAsHTML()}</td>
                        
                            <td>${seller.username?.encodeAsHTML()}</td>
                        
                            <td>${seller.password?.encodeAsHTML()}</td>
                        
                            <td>${seller.email?.encodeAsHTML()}</td>
                        
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
