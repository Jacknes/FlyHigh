<%-- 
    Document   : logout
    Created on : 25/05/2017, 1:53:08 PM
    Author     : jacknes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
        <%
            session.invalidate();
        %>
    </head>
    <body>
        <p>You have been logged out. Click <a href="main.jsp">here</a> to return to the main page.</p>
    </body>
</html>
