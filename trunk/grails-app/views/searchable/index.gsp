<%@ page import="org.springframework.util.ClassUtils" %>
<%@ page import="org.codehaus.groovy.grails.plugins.searchable.SearchableUtils" %>
<%@ page import="org.codehaus.groovy.grails.plugins.searchable.lucene.LuceneUtils" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Property List</title>
        <script type="text/javascript">
            var focusQueryInput = function() {
            document.getElementById("q").focus();
        }
        </script>
    </head>
    <body onload="focusQueryInput();">
		<div id="leftFrame">
	   		<ul class="navLeft">
				<li><span class="menuButton"><g:link class="create" action="create">New Property</g:link></span></li>
            </ul>
            <g:form url='[controller: "searchable", action: "index"]' id="searchableForm" name="searchableForm" method="get">
                <g:textField name="q" value="${params.q}" size="50"/> <input type="submit" value="Search" />
            </g:form>
        </div>

        <div class="body">
            <g:set var="haveQuery" value="${params.q?.trim()}" />
            <g:set var="haveResults" value="${searchResult?.results}" />
            <g:if test="${haveQuery && haveResults}">
          Showing <strong>${searchResult.offset + 1}</strong> - <strong>${searchResult.results.size() + searchResult.offset}</strong> of <strong>${searchResult.total}</strong>
          results for <strong>${params.q}</strong>
        </g:if>
        <g:else>
        &nbsp;
        </g:else>
            <h1>Property List</h1>

            <g:if test="${parseException}">
      <p>Your query - <strong>${params.q}</strong> - is not valid.</p>
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
      <p>Nothing matched your query - <strong>${params.q}</strong></p>
    </g:elseif>
    <g:elseif test="${haveResults}">

            <div class="list">
				<g:each var="result" in="${searchResult.results}" status="index">
                <g:set var="className" value="${ClassUtils.getShortName(result.getClass())}" />
                <g:set var="link" value="${createLink(controller: className[0].toLowerCase() + className[1..-1], action: 'show', id: result.id)}" />
                <table width="100%">
				 <tr>
				    <td width="21%">Ref: ${result.id}</td>
				    <td width="79%">${result.address}, ${result.postCode}</td>
				  </tr>
				  <tr>
				    <td width="21%" rowspan="3"><img src="/sourceProject/images/properties/27/img_1.jpg" width="200" height="203" /></td>
				    <td>Offers Over ${result.minPrice}</td>
				  </tr>
                  <g:set var="desc" value="${result.description}" />
                  <g:if test="${desc.size() > 120}"><g:set var="desc" value="${desc[0..120] + '...'}" /></g:if>
                  <tr>
				    <td>${desc.encodeAsHTML()}</td>
				  </tr>
				  <tr>
				    <td>${link}</td>
				  </tr>
				</table>
				</g:each>
			</div>

            <div class="paginateButtons">
                <g:if test="${haveResults}">
              Page:
              <g:set var="totalPages" value="${Math.ceil(searchResult.total / searchResult.max)}" />
              <g:if test="${totalPages == 1}"><span class="currentStep">1</span></g:if>
              <g:else><g:paginate controller="searchable" action="index" params="[q: params.q]" total="${searchResult.total}" prev="&lt; previous" next="next &gt;"/></g:else>
                </g:if>
            </div>
            </g:elseif>
        </div>
    </body>
</html>
