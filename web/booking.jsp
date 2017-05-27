<%-- 
    Document   : booking
    Created on : 06/05/2017, 10:04:03 PM
    Author     : jacknes
--%>

<%--
Booking page: Flight customers can access this page from “Results” page or the “Main” page 
(if customer is logged in). They can perform the following booking management functionalities:
    a- Make a booking (only if a flight has available seats)
    b- View booking (existing customer booking)
    c- Edit booking (A customer cannot change booking details on the same flight date) 
    d- Cancel a booking (A customer cannot cancel a booking on the same flight date)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="lit.*"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="MainCSS.css" rel="stylesheet" type="text/css" media="all">
        <title>FlyHigh - Bookings</title>
    </head>


    <body>
        <div class="wrapper">
            <div class="header">
                <img src="${pageContext.request.contextPath}/FHlogo.PNG" class="logo"/>
                <h1>FlyHigh Airlines</h1>
                <%
                    User user = (User) session.getAttribute("user");
                    if (user != null) {
                %>

                <p>These are your bookings, <%=  user.getName()%> </p>
                <ul>
                    <li><a href="main.jsp">Home</a></li>
                    <li><a href="booking.jsp">Bookings</a></li>
                    <li><a href="listings.jsp">Listings</a></li>
                    <li style="float:right"><a href="account.jsp">Account</a></li>
                    <li style="float:right"><a href="logout.jsp">Logout</a></li>
                </ul>

                <% // } %>
                <% } else { %>
                <ul>
                    <li><a href="main.jsp">Home</a></li>
                    <li style="float:right"><a href="login.jsp">Login</a></li>
                    <li style="float:right"><a href="register.jsp">Register</a></li>
                </ul>
                <% }%>
            </div>

  
            <!--Bookings Content goes here-->
            
            
        </div>
    </div>
</body>
</html>
