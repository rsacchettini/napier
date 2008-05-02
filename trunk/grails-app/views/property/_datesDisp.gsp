<%--
  Created by IntelliJ IDEA.
  User: Romain
  Date: 13 avr. 2008
  Time: 02:07:04
  To change this template use File | Settings | File Templates.
--%>

<table>
	<g:each var="it" status="i" in="${property.availableFrom}">
			<g:if test="${(i % 2) == 0}">
			  <tr>
			  <td>From:</td><td><g:formatDate format="dd-MM-yyyy" date="${(Date)it}"/></td>
			</g:if>
			<g:else>
				<td>To:</td><td><g:formatDate format="dd-MM-yyyy" date="${(Date)it}"/></td>
			 </tr>
			</g:else>
	</g:each>
</table>