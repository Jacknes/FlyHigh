<%-- 
    Document   : loginAction
    Created on : 08/05/2017, 2:41:03 PM
    Author     : jacknes
--%>

<%--
This page handles the login request from the login.jsp form. 

If login is successful, it takes the customer to the “Main” page at the Second Scenario. 
After logging in, if the customer performs a search on the “Main” page, the flights list displayed on 
the “Results” page become clickable or selectable. (If a customer select a flight it 
should take them to the “Booking” page)
--%>
<%@page import="lit.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <% String filePath = application.getRealPath("WEB-INF/users.xml");%>
    <jsp:useBean id="userApp" class="lit.UserApplication" scope="application">
        <jsp:setProperty name="userApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fly High Login</title>
        <link href="MainCSS.css" rel="stylesheet" type="text/css" media="all">
    </head>
    <div class="wrapper">
        <div class="header">
            <img src="${pageContext.request.contextPath}/FHlogo.PNG" class="logo"/>
            <h1>Login</h1>
            <%@include file = "navbar.jsp" %>
        </div>

        <%
            Users users = new Users();
            users = userApp.getUsers();
            User loginUser = null;
            String email = "";
            if (users != null) {
                email = request.getParameter("email");
                String password = request.getParameter("password");
                loginUser = users.login(email, password);
                if (loginUser != null) {
                    session.setAttribute("user", loginUser);
                }
            }
            if (loginUser != null) {
                String redirectURL = "main.jsp";
                response.sendRedirect(redirectURL);
            } else {
        %>
        <div class="mainTable">
            <body>
                <p style="text-align: center">Login unsuccessful, click <a href="login.jsp?email=<%= email%>">here</a> to retry or <a href="main.jsp">here</a> to return to the main screen.</p>
            </body>
        </div>
        <% }%>
    </div>
</html>
