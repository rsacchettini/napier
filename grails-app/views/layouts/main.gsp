<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'layout.css')}"/>
 <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'main.css')}"/>
 <link rel="shortcut icon" href="${createLinkTo(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>
 <title><g:layoutTitle default="Grails"/> - Napier Estate Agency</title>
     <g:layoutHead/>
    <g:javascript library="application"/>
 </head>
 
 <body>
<div id="container">
  <div id="header">
    <div class="indentmenu">
            <ul>
            <li><a href="/sourceProject" >Home</a></li>
            <li><a href="/sourceProject/buyer">Buyer</a></li>
            <li><a href="/sourceProject/seller">Seller</a></li>
            <li><a href="/sourceProject/estateAgent">Estate Agent</a></li>
        </ul>
        <br style="clear: left" />
    </div>
  </div>
    <div id="content">
    <div id="leftFrame">
   		 <ul class="menugauche">
              <g:each var="c" in="${grailsApplication.controllerClasses}">
                    <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
              </g:each>
            </ul>
    </div>
			<img src="${createLinkTo(dir: 'images', file: 'spinner.gif')}" alt="Spinner"/>
          <g:layoutBody/>  
    </div>
  <div id="footer">GP 2</div>
</div>


</body>
</html>