<%-- 
    Document   : ViewUsers
    Created on : May 26, 2017, 11:51:23 PM
    Author     : Jack
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% String filePath = application.getRealPath("WEB-INF/users.xml");%>
    <jsp:useBean id="userApp" class="lit.UserApplication" scope="application">
        <jsp:setProperty name="userApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
<%@page import="lit.*"%>
<%@page import="java.util.*"%>

    <%
        Users users = new Users();
        users = userApp.getUsers();
        ArrayList<User>  usersList = users.getUsers();
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            for (User user : usersList) {
                String userInfo = user.toString();
               %>
               <p> <%= userInfo %> </p>
            <%} %>
            
    </body>
</html>
