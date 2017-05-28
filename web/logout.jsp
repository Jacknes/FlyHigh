<%-- 
    Document   : logout
    Created on : 25/05/2017, 1:53:08 PM
    Author     : jacknes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="MainCSS.css" rel="stylesheet" type="text/css" media="all">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>

    </head>
    <body>
        <div class="wrapper">
            <div class="header">
                <img src="${pageContext.request.contextPath}/FHlogo.PNG" class="logo"/>
                <h1>FlyHigh Airlines</h1>
                <ul>
                    <li><a href="main.jsp">Home</a></li>
                    <li style="float:right"><a href="login.jsp">Login</a></li>
                    <li style="float:right"><a href="register.jsp">Register</a></li>
                </ul>
            </div>
                    <% session.invalidate(); %>
            <p>You have been logged out. Click <a href="main.jsp">here</a> to return to the main page.</p>
        </div>
    </body>
</html>
