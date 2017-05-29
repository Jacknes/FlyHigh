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
    String userID = request.getParameter("userID");
    User userToDelete = null;
    User authorisingUser = (User)session.getAttribute("user");
    if (userID != null && authorisingUser != null){
        userToDelete = userApp.getUsers().getUserByID(userID);
    }
    
    //User userToDelete = (User)session.getAttribute("userToDelete");
    if (userToDelete == null) 
    { %>
    <!--User Not found for ID-->
    <body>
        <p>User to delete not found. Click <a href="main.jsp">here</a> to return home. </p>
    </body>
    

    <%} else if (userID.equals(authorisingUser.getUserID()) || userApp.getUsers().isAdmin(authorisingUser.getUserID())) {
        userApp.removeUser(userToDelete);
        Users users = userApp.getUsers();
        userApp.updateXML(users);
        if(userID.equals(authorisingUser.getUserID()))
            session.setAttribute("user", null);
  %>  
    
    <body>
        <p>Account deleted. Click <a href="main.jsp">here</a> to return home</p>
    </body>

<%}
    
    %>

</html>