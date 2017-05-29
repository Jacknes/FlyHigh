<%-- 
    Document   : ViewBookings
    Created on : 28/05/2017, 3:05:37 PM
    Author     : jacknes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% String filePath = application.getRealPath("WEB-INF/bookings.xml");%>
    <jsp:useBean id="bookingApp" class="lit.BookingApplication" scope="application">
        <jsp:setProperty name="bookingApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
<%@page import="lit.*"%>
<%@page import="java.util.*"%>

    <%
        Bookings bookings = new Bookings();
        bookings = bookingApp.getBookings();
        ArrayList<Booking>  bookingList = bookings.getBookings();
    %>
<!DOCTYPE html>
<html>
    <head>
        <link href="MainCSS.css" rel="stylesheet" type="text/css" media="all">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>
        <div class="wrapper">
            <div class="header">
                <img src="${pageContext.request.contextPath}/FHlogo.PNG" class="logo"/>
                <h1>Manage Bookings</h1>
                <%@include file="navbar.jsp" %>
                <%
                    user = (User) session.getAttribute("user");
                    username = "";
                    if (user != null) {
                        username = user.getName();
                        if (user.isAdmin()) {
                %>
            </div>
            <div class="mainTable">
                <table>
                <tr>
                    <th>Booking ID</th>
                    <th>Username</th>
                    <th>User ID</th>
                    <th>Flight ID</th>
                    <th>Departure Date</th>
                    <th>Return Date</th>
                    <th>Origin</th>
                    <th>Destination</th>
                    <th>Flight Type</th>
                    <th>Price</th>
                    <th>Seat</th>
                    <th>Description</th>
                
                </tr>
                      <%
                for (Booking booking : bookingList) {        
                      %>
                <tr>
                     <!--return "Booking{" + "bookingID=" + bookingID + ", username=" + username + ", userID=" + userID + ", flightID=" + flightID + ", departureDate=" + departureDate + 
                     ", returnDate=" + returnDate + ", origin=" + origin + ", destination=" + destination + ", flightType=" + flightType + ", price=" + price + ", seat=" + seat + ", description=" + description + '}';-->
                    <td><%= booking.getBookingID()%></td>
                    <td><%= booking.getUsername()%></td>
                    <td><%= booking.getUserID()%></td>
                    <td><%= booking.getFlightID()%></td>
                    <td><%= booking.getDepartureDate()%></td>
                    <td><%= booking.getReturnDate()%></td>
                    <td><%= booking.getOrigin()%></td>
                    <td><%= booking.getDestination()%></td>
                    <td><%= booking.getFlightType()%></td>
                    <td><%= booking.getPrice()%></td>
                    <td><%= booking.getSeat()%></td>
                    <td><%= booking.getDescription()%></td>   
                </tr>
               
            <%} %>
             </table>
                </div> 
      
            
            
      <% } else {
            String redirectURL = "404.jsp";
            response.sendRedirect(redirectURL); }%>
                <% } %> 
                
        </div>
    </body>
</html>


