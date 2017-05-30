<%-- 
    Document   : ViewBookings
    Created on : 28/05/2017, 3:05:37 PM
    Author     : jacknes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--Use of a bean to allow access to bookings.xml through bookingApplication-->
<% String filePath = application.getRealPath("WEB-INF/bookings.xml");%>
<jsp:useBean id="bookingApp" class="lit.BookingApplication" scope="application">
    <jsp:setProperty name="bookingApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>
<%@page import="lit.*"%>
<%@page import="java.util.*"%>

<%
    //Create new booking object and array list
    Bookings bookings = new Bookings();
    bookings = bookingApp.getBookings();
    ArrayList<Booking> bookingList = bookings.getBookings();
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
                    //Retrieves the user for the session
                    user = (User) session.getAttribute("user");
                    username = "";
                    // Checks if their is a user currently logged in and if it is an admin
                    //if admin then perform the functions below
                    if (user != null) {
                        username = user.getName();
                        if (user.isAdmin()) {
                %>
            </div>
            <div class="mainTable">
                <h2>Manage Bookings</h2>
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
                    <%
                        //a for loop is used to print out all of the bookings in the booking list
                        for (Booking booking : bookingList) {
                    %>
                    <tr>
                        <!--The following data fields are retrieved from the XML and displayed--> 
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
                        <!--Links below are for admin use to either edit or cancel a booking-->
                        <td><a href="editBooking.jsp?bookingID=<%= booking.getBookingID()%>">Edit Booking</a></td>  
                        <td><a href="deleteBooking.jsp?bookingID=<%= booking.getBookingID()%>">Cancel Booking</a></td>       
                    </tr>

                    <%} %>
                </table>
            </div> 

            <% } else {
                    //if the logged in user is not an admin
                    //redirect to 404.jsp error page 
                    String redirectURL = "404.jsp";
              response.sendRedirect(redirectURL);
          }%>
            <% }%>   
        </div>
    </body>
</html>


