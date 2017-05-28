<%-- 
    Document   : deleteAccount
    Created on : 27/05/2017, 3:47:21 PM
    Author     : jacknes
--%>

<%@page import="lit.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account deleted</title>
    </head>
    <% String filePath = application.getRealPath("WEB-INF/users.xml");%>
    <jsp:useBean id="userApp" class="lit.UserApplication" scope="application">
        <jsp:setProperty name="userApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
    <% 
    User userToDelete = (User)session.getAttribute("userToDelete");
    if (userToDelete == null) 
    {
        userToDelete = (User)session.getAttribute("user");
        userApp.removeUser(userToDelete);
        Users users = userApp.getUsers();
        userApp.updateXML(users);
        session.setAttribute("user", null);
    } else {
        userApp.removeUser(userToDelete);
        Users users = userApp.getUsers();
        userApp.updateXML(users);
        session.setAttribute("userToDelete", null);
    }
    
    %>
    
    <body>
        <p>Account deleted. Click <a href="main.jsp">here</a> to return home</p>
    </body>
</html>
