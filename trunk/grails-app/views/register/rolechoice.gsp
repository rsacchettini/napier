<%--
  Created by IntelliJ IDEA.
  User: Romain
  Date: 16 avr. 2008
  Time: 15:22:09
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="layout" content="main" />
	<title>User Registration</title>
</head>
  <body>
  	  <div class="body">
		  <h1>User Registration : Step 1/2 : Choose your role</h1>
		  <g:if test="${flash.message}">
			<div class="message">${flash.message}</div>
		  </g:if>

		<div class="dialog">
			<table width="100%" border="0" cellspacing="0">
			  <tr>
			    <td height="30" colspan="2"><div align="center"><span class="text">In order to register, you must first select the type of account you wish to have.</span></div></td>
			  </tr>
			  <tr>
			    <td height="30" colspan="2">&nbsp;</td>
			  </tr>
			  <tr>
			    <td><div align="center"><div class="btnAccountB"><a href="createBuyer.gsp"><img src="../images/motifBack.png" width="0" border="0" /></a></div></div></td>
			    <td><div align="center"><div class="btnAccountS"><a href="createSeller.gsp"><img src="../images/motifBack.png" width="0" border="0" /></a></div></div></td>
			  </tr>
			  <tr>
			    <td height="150" colspan="2">&nbsp;</td>
			  </tr>
		</div>

	</div>
  </body>
</html>