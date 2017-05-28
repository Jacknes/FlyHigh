<%-- 
    Document   : navbar
    Created on : 28/05/2017, 8:37:31 PM
    Author     : Owner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="lit.*"%>
<!DOCTYPE html>
<!--<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>-->
                
                <%
                    User user = (User) session.getAttribute("user");
                    String username = "";
                    if (user != null) {
                        username = user.getName();
                        if (user.isAdmin()) {
                %>

                <p>Welcome back to FlyHigh Airlines, <%= user.getName()%> </p>   
                <ul>
                    <li><a href="main.jsp">Home</a></li>
                    <li><a href="manageBookings.jsp">Manage Bookings</a></li>
                    <li><a href="manageUsers.jsp">Manage Users</a></li>
                    <li style="float:right"><a href="account.jsp">Account</a></li>
                    <li style="float:right"><a href="logout.jsp">Logout</a></li>
                </ul>
                <% } else {%>
                <p>Welcome back to FlyHigh Airlines <%= user.getName()%> </p>
                <ul>
                    <li><a href="main.jsp">Home</a></li>
                    <li><a href="MyBookings.jsp">Bookings</a></li>
                    <li><a href="listings.jsp">Listings</a></li>

                    <li style="float:right"><a href="account.jsp">Account</a></li>
                    <li style="float:right"><a href="logout.jsp">Logout</a></li>
                </ul>

                <% } %>
                <% } else { %>
                <ul>
                    <li><a href="main.jsp">Home</a></li>
                    <li style="float:right"><a href="login.jsp">Login</a></li>
                    <li style="float:right"><a href="register.jsp">Register</a></li>
                </ul>
                <%}%>
<!--    </body>
</html>-->
