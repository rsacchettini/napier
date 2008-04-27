<%@ page import="org.springframework.util.ClassUtils" %>
<%@ page import="org.codehaus.groovy.grails.plugins.searchable.SearchableUtils" %>
<%@ page import="org.codehaus.groovy.grails.plugins.searchable.lucene.LuceneUtils" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title><g:if test="${params.qPostCode && params.qPostCode?.trim() != ''}">${params.qPostCode} - </g:if>Property List</title>
        <script type="text/javascript">
        var focusQueryInput = function() {
            document.getElementById("qPostCode").focus();
        }
    </script>
    </head>
    <body onload="focusQueryInput();">
		<div class="nav">
			<g:ifAnyGranted role="ROLE_SELLER">
				<span class="menuButton"><g:link class="create" action="create"><g:message code="property.create"/></g:link></span>
			</g:ifAnyGranted>	
		</div>
        <div id="searchField">
            <g:form url='[controller: "property", action: "list"]' id="searchableForm" name="searchableForm" method="get">
			<table width="100%" border="0">
			  <tr>
			    <td>
					<label>Type of property
						<g:select id="category" name="qCategory" from="${property.constraints.category.inList.collect{it.encodeAsHTML()}}" value="${params.qCategory}" ></g:select>
				        
				    </label>
			    </td>
			    <!--<td>
				    <label>*Offer
				        <g:select name="qOffer" from="${['','100000', '200000']}"/>
				    </label>
			    </td>-->
				<td>
					<label>Number of bedroom
						<input type="text" name="qnbBedR" value="${params.qnbBedR}" size="2" />
			        </label>
				</td>
			    <td>
					<label>Post code
						<input type="text" name="qPostCode" value="${params.qPostCode}" size="8" />
			        </label>
				</td>
				<td>
					<input type="submit" value="Search" />
				</td>
			  </tr>
			</table>
			</g:form>
        </div>

        <div class="body">
            <g:set var="haveQuery" value="${params.qPostCode?.trim()}" />
			<g:set var="haveResults" value="${searchResult?.results}" />
			<g:set var="query" value="${params.qCategory} +"-"+ ${params.qOffer} +"-"+ ${params.qnbBedR} +"-"+ ${params.qPostCode}" />
			<span>
		        <g:if test="${haveQuery && haveResults}">
		          Showing <strong>${searchResult.offset + 1}</strong> - <strong>${searchResult.results.size() + searchResult.offset}</strong> of <strong>${searchResult.total}</strong>
		          results for <strong>${query}</strong>
		        </g:if>
		        <g:else>
		        &nbsp;
		        </g:else>
		    </span>
           
            <h1>Property List</h1>

            <g:if test="${parseException}">
		      <p>Your query - <strong>${query}</strong> - is not valid.</p>
		      <p>Suggestions:</p>
		      <ul>
		        <li>Fix the query: see <a href="http://lucene.apache.org/java/docs/queryparsersyntax.html">Lucene query syntax</a> for examples</li>
		        <g:if test="${LuceneUtils.queryHasSpecialCharacters(params.q)}">
		          <li>Remove special characters like <strong>" - [ ]</strong>, before searching, eg, <em><strong>${LuceneUtils.cleanQuery(params.q)}</strong></em><br />
		              <em>Use the Searchable Plugin's <strong>LuceneUtils#cleanQuery</strong> helper method for this: <g:link controller="searchable" action="index" params="[q: LuceneUtils.cleanQuery(params.q)]">Search again with special characters removed</g:link></em>
		          </li>
		          <li>Escape special characters like <strong>" - [ ]</strong> with <strong>\</strong>, eg, <em><strong>${LuceneUtils.escapeQuery(params.q)}</strong></em><br />
		              <em>Use the Searchable Plugin's <strong>LuceneUtils#escapeQuery</strong> helper method for this: <g:link controller="searchable" action="index" params="[q: LuceneUtils.escapeQuery(params.q)]">Search again with special characters escaped</g:link></em><br />
		              <em>Or use the Searchable Plugin's <strong>escape</strong> option: <em><g:link controller="searchable" action="index" params="[q: params.q, escape: true]">Search again with the <strong>escape</strong> option enabled</g:link></em>
		          </li>
		        </g:if>
		      </ul>
		    </g:if>
		    <g:elseif test="${haveQuery && !haveResults}">
		      <p>Nothing matched your query - <strong>${query}</strong></p>
		    </g:elseif>
		    <g:elseif test="${haveResults}">

            <div class="list">
				<g:each var="result" in="${searchResult.results}" status="index">
	                <g:set var="className" value="${ClassUtils.getShortName(result.getClass())}" />
	                <g:set var="link" value="${createLink(controller: className[0].toLowerCase() + className[1..-1], action: 'show', id: result.id)}" />
	                <table width="100%">
					 <tr>
					    <td width="21%">Reference: ${result.id}</td>
					    <td width="79%" class="fullAddress">${result.address}, ${result.city}, ${result.postCode}</td>
					  </tr>
					  <tr>
					    <td width="21%" rowspan="2"><img src="${createLinkTo(dir:'')}/images/properties/${result.picture[0]}" width="150" height="100" /></td>
					    <td class="price">Offers Over &pound;${result.minPrice}</td>
					  </tr>
	                  <g:set var="desc" value="${result.description}" />
	                  <g:if test="${desc.size() > 300}"><g:set var="desc" value="${desc[0..300] + '...'}" /></g:if>
	                  <tr>
					    <td>${desc}</td>
					  </tr>
					  <tr>
	                    <td></td>
	                    <td class="info"><a href="${link}"> more details</a></td>
					  </tr>
					</table>
				</g:each>
			</div>

            <div class="paginateButtons">
                <g:if test="${haveResults}">
	              Page:
	              <g:set var="totalPages" value="${Math.ceil(searchResult.total / searchResult.max)}" />
	              <g:if test="${totalPages == 1}"><span class="currentStep">1</span></g:if>
	              <g:else><g:paginate controller="property" action="list" params="[q: params.q]" total="${searchResult.total}" prev="&lt; previous" next="next &gt;"/></g:else>
				</g:if>
            </div>
            </g:elseif>
        </div>
    </body>
</html>
