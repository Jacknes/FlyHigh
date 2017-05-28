<%-- 
    Document   : 404
    Created on : 28/05/2017, 7:00:31 PM
    Author     : Owner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="MainCSS.css" rel="stylesheet" type="text/css" media="all">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="wrapper">
            <div class="header">
            <img src="${pageContext.request.contextPath}/FHlogo.PNG" class="logo"/>
            <h1>FlyHigh Airlines</h1>
            <%@include file="navbar.jsp" %>
            </div>
        
        <p>Your request could not be completed. Please refer to the menu to return to the home page, register or login to FlyHigh Airlines.</P>
        </div>
         
    </body>
</html>
