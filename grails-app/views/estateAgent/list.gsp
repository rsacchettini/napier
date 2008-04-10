

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>EstateAgent List</title>
    </head>
    <body>
		<div id="leftFrame">
	   		<ul class="navLeft">
				<li><span class="menuButton"><g:link class="create" action="create">New EstateAgent</g:link></span></li>
	        </ul>
	    </div>
        <div class="body">
            <h1>EstateAgent List</h1>
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
                    <g:each in="${estateAgentList}" status="i" var="estateAgent">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${estateAgent.id}">${estateAgent.id?.encodeAsHTML()}</g:link></td>
                        
                            <td>${estateAgent.forename?.encodeAsHTML()}</td>
                        
                            <td>${estateAgent.surname?.encodeAsHTML()}</td>
                        
                            <td>${estateAgent.username?.encodeAsHTML()}</td>
                        
                            <td>${estateAgent.password?.encodeAsHTML()}</td>
                        
                            <td>${estateAgent.email?.encodeAsHTML()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${EstateAgent.count()}" />
            </div>
        </div>
    </body>
</html>
