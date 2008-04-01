<resource:dateChooser/>
 <g:javascript src="datesManagement.js"/>
<%--
  Created by IntelliJ IDEA.
  User: Romain
  Date: 26 mars 2008
  Time: 15:08:58
  To change this template use File | Settings | File Templates.
--%>

 <table>
	   <tbody>
		  <g:each var="a" status="i" in="${params.availableFrom}">
			<g:if test="${(i % 2) == 0}">
				<tr>
				<td valign="top" class="name">
				  <label>Available From:</label>
			   </td>
				<td valign="top" class="value ${hasErrors(bean:property,field:'availableFrom','errors')}">
					<richui:dateChooser name="${i <2 ? 'availableFrom1' : 'availableFrom1'+'_'+((i/2)+1) }" format="dd/MM/yyyy" value="${(Date)a}" />
				</td>
			</g:if>
			<g:else>
				<td valign="top" class="name">
					<label>To:</label>
				</td>
				<td valign="top" class="value ${hasErrors(bean:property,field:'availableFrom','errors')}">
					<richui:dateChooser name="${i <2 ? 'availableFrom2' : 'availableFrom2'+'_'+((i-1)/2+1) }" format="dd/MM/yyyy" value="${(Date)a}" />
				</td>
				<td><a href="#" onclick="delLigne(this); return false;">Del</a></td>
			 </tr>
			</g:else>
		 </g:each>
	   </tbody>
	   <tfoot>
		   <tr>
			   <th>
				   <a onclick="addLigne(this); return false;" href="#">Ajouter une ligne</a>
			   </th>
		   </tr>
	   </tfoot>
   </table>