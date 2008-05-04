

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title> <g:message code="appointment.listTitle"/></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="appointment.new"/></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="appointment.listTitle"/></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="dateAndTime" title="Date And Time" />
                        
                   	        <th>Buyer</th>
                   	    
                   	        <th>Is Managed By</th>
                   	    
                   	        <th>Property</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${appointmentList}" status="i" var="appointment">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${appointment.id}">${appointment.id?.encodeAsHTML()}</g:link></td>
                        
                            <td>${appointment.dateAndTime?.encodeAsHTML()}</td>
                        
                            <td>${appointment.buyer?.encodeAsHTML()}</td>
                        
                            <td>${appointment.isManagedBy?.encodeAsHTML()}</td>
                        
                            <td>${appointment.property?.encodeAsHTML()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Appointment.count()}" />
            </div>
        </div>
    </body>
</html>
