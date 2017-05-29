<%-- 
    Document   : MyBookings
    Created on : 28/05/2017, 8:49:06 PM
    Author     : jacknes
--%>
<%@page import="lit.*"%>
<% String filePath = application.getRealPath("WEB-INF/bookings.xml");%>
    <jsp:useBean id="bookingApp" class="lit.BookingApplication" scope="application">
        <jsp:setProperty name="bookingApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Bookings</title>
        <link href="MainCSS.css" rel="stylesheet" type="text/css" media="all">
        
            </head>
            <div class="wrapper">
            <div class='header'>
                <img src="${pageContext.request.contextPath}/FHlogo.PNG" class="logo"/>
            <%@include file="navbar.jsp"%>
            <%
            user = (User)session.getAttribute("user");
            Booking booking = null;
            String userID = "";
            if (user != null) 
            {
                userID = user.getUserID();
                Bookings bookings = bookingApp.getBookings();
                booking = bookings.getUserBooking(userID);

        %>
            </div>
            
            <%
                if (booking != null) 
                {
            %>
            <body>
                <h1>This is your current booking, <%= user.getName() %></h1>
                <!--Insert booking information-->
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
                    <th>Edit Booking</th>
                    <th>Cancel Booking</th>
                
                </tr>

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
                    <td><a href="editBooking.jsp?bookingID=<%= booking.getBookingID()%>">Edit Booking</a></td>  
                    <td><a href="deleteBooking.jsp?bookingID=<%= booking.getBookingID()%>">Delete Booking</a></td>   
                    <!--http://localhost:8080/FlyHigh/deleteBooking.jsp-->
                     
                </tr>
               

             </table>
                </div> 
               
            </body>
            <% } else { %>
            <body>
                <h1>You do not currently have a booking.</h1>
                <p>Click <a href="main.jsp">here</a> to search for one!</p>
            </body>
            <% }
            
            } else {%>
    
        <body>
            <h1>You can't be here</h1>
            <!--Insert 404 template-->
            <p>Click <a href="main.jsp">here</a> to search for one!</p>
        </body>
            </div>
        
       <% } %>
</html>
