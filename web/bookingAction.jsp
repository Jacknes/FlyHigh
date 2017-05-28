<%-- 
    Document   : bookingAction
    Created on : 28/05/2017, 2:19:37 PM
    Author     : jacknes
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="lit.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<% String filePath = application.getRealPath("WEB-INF/bookings.xml");%>
    <jsp:useBean id="bookingApp" class="lit.BookingApplication" scope="application">
        <jsp:setProperty name="bookingApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
    
    <% String filePathFlight = application.getRealPath("WEB-INF/flights.xml");%>
    <jsp:useBean id="flightController" class="lit.FlightController" scope="application">
        <jsp:setProperty name="flightController" property="filePathFlight" value="<%=filePath%>"/>
    </jsp:useBean>
    
     <%
        //Check if the user is already booked on a flight. 
        //if they are, show an error and let them view their booking booking?flightID=
        
        //else create a new booking, 
        //decrease the number of seats on the flight.xml
        String flightID = request.getParameter("flightID");
        String userID = request.getParameter("userID");
        
        Bookings bookings = bookingApp.getBookings();
        Booking currentBooking = bookings.getUserBooking(userID);
        if (currentBooking == null)
        {
            bookingApp.addBooking(userID, flightID);
            bookings = bookingApp.getBookings();
            bookingApp.setBookings(bookings);
            Flights flights = flightController.getFlights();
            flights.changeSeats(flightID, -1);
            flightController.setFlights(flights);
            
            //bookings = bookingApp.getBookings();
            //bookingApp.setBookings(bookings);
    %>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Booking Confirmed!</title>
        </head>
        <body>
            <h1>Flight Booked!</h1>
        </body>
    </html>

    <% } else { %>

    <!--User already has a booking, let them click through to it-->
    <% } %>