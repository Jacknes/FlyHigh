<%-- 
    Document   : manageBookings
    Created on : 28/05/2017, 6:15:36 PM
    Author     : Owner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="lit.*"%>

<!DOCTYPE html>
<html>
    <head>
        <link href="MainCSS.css" rel="stylesheet" type="text/css" media="all">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>
        <div class='wrapper'>
            <div class='header'>
                <img src="${pageContext.request.contextPath}/FHlogo.PNG" class="logo"/>
                <h1>Bookings</h1>

                <%
                    User user = (User) session.getAttribute("user");
                    String username = "";
                    if (user != null) {
                        username = user.getName();
                        if (user.isAdmin()) {
                %>

                <p>Welcome back to FlyHigh Airlines <%= user.getName()%> </p>   
                <ul>
                    <li><a href="main.jsp">Home</a></li>
                    <li><a href="manageBookings.jsp">Manage Bookings</a></li>
                    <li><a href="manageUsers.jsp">Manage Users</a></li>
                    <li style="float:right"><a href="logout.jsp">Logout</a></li>
                </ul>

                <div class='mainTable'>
                    <c:import url="WEB-INF/bookings.xml" var="inputDoc" />

                    <c:import url="WEB-INF/bookings.xsl" var="stylesheet"/>

                    <x:transform xml = "${inputDoc}"
                                 xslt = "${stylesheet}" />
                </div>
                <% } else { %>
                <ul>
                    <li><a href="main.jsp">Home</a></li>
                    <li style="float:right"><a href="login.jsp">Login</a></li>
                    <li style="float:right"><a href="register.jsp">Register</a></li>
                </ul>
                <p>You are not authorised to view this page</p>
                <% }%>
            </div>
            <% } %>
        </div>
    </body>
</html>
