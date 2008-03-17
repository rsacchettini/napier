

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>EstateAgent List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New EstateAgent</g:link></span>
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
                        
                   	        <g:sortableColumn property="myForename" title="My Forename" />
                        
                   	        <g:sortableColumn property="mySurname" title="My Surname" />
                        
                   	        <g:sortableColumn property="myUsername" title="My Username" />
                        
                   	        <g:sortableColumn property="myPassword" title="My Password" />
                        
                   	        <g:sortableColumn property="myEmail" title="My Email" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${estateAgentList}" status="i" var="estateAgent">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${estateAgent.id}">${estateAgent.id?.encodeAsHTML()}</g:link></td>
                        
                            <td>${estateAgent.myForename?.encodeAsHTML()}</td>
                        
                            <td>${estateAgent.mySurname?.encodeAsHTML()}</td>
                        
                            <td>${estateAgent.myUsername?.encodeAsHTML()}</td>
                        
                            <td>${estateAgent.myPassword?.encodeAsHTML()}</td>
                        
                            <td>${estateAgent.myEmail?.encodeAsHTML()}</td>
                        
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
