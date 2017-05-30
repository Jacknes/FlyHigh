<%-- 
    Document   : navbar
    Created on : 28/05/2017, 8:37:31 PM
    Author     : Owner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="lit.*"%>
<!DOCTYPE html>

                <!--Checks the current session for the user-->
                <%
                    User user = (User) session.getAttribute("user");
                    String username = "";
//                    If there is a user in the session, get the users name
                    if (user != null) {
                        username = user.getName();
                        //Checks if user is an admin
                        if (user.isAdmin()) {
                %>

                <!--Prints out the following menu options if the user is an admin-->
                <p>Welcome back to FlyHigh Airlines, <%= user.getName()%> </p>   
                <ul>
                    <li><a href="main.jsp">Home</a></li>
                    <li><a href="ViewBookings.jsp">Manage Bookings</a></li>
                    <li><a href="manageUsers.jsp">Manage Users</a></li>
                    <li style="float:right"><a href="account.jsp">Account</a></li>
                    <li style="float:right"><a href="logout.jsp">Logout</a></li>
                </ul>

                <% } else {%>
                <!--Prints out the following menu options if it is a normal user-->
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
                <!--Prints out the following menu options if it is a non logged in user-->
                <ul>
                    <li><a href="main.jsp">Home</a></li>
                    <li style="float:right"><a href="login.jsp">Login</a></li>
                    <li style="float:right"><a href="register.jsp">Register</a></li>
                </ul>
                <%}%>

