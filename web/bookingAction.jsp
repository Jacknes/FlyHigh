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
<!--Use of javabean to allow access to bookings.xml through bookingApplication-->
<% String filePath = application.getRealPath("WEB-INF/bookings.xml");%>
<jsp:useBean id="bookingApp" class="lit.BookingApplication" scope="application">
    <jsp:setProperty name="bookingApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>

<!--Use of javabean to allow access to flight.xml through flightApplication-->
<% String filePathFlight = application.getRealPath("WEB-INF/flights.xml");%>
<jsp:useBean id="flightController" class="lit.FlightController" scope="application">
    <jsp:setProperty name="flightController" property="filePathFlight" value="<%=filePath%>"/>
</jsp:useBean>

<% String filePathUser = application.getRealPath("WEB-INF/users.xml");%>
<jsp:useBean id="userApp" class="lit.UserApplication" scope="application">
    <jsp:setProperty name="userApp" property="filePathUser" value="<%=filePath%>"/>
</jsp:useBean>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="MainCSS.css" rel="stylesheet" type="text/css" media="all">
        <title>Booking Confirmed!</title>
    </head>
    <body>
        <div class="wrapper">
            <div class="header">
                <img src="${pageContext.request.contextPath}/FHlogo.PNG" class="logo"/>
                <h1>Booking Confirmation</h1>
                <%@include file="navbar.jsp"%>
            </div>
            <%
                //Check if the user is already booked on a flight. 
                //if they are, show an error and let them view their booking booking?flightID=
                //else create a new booking, 
                //decrease the number of seats on the flight.xml
                String flightID = request.getParameter("flightID");
                String userID = request.getParameter("userID");

                Bookings bookings = bookingApp.getBookings();
                Booking currentBooking = bookings.getUserBooking(userID);
                if (currentBooking == null) {
                    bookingApp.addBooking(userID, flightID, flightController, userApp);
                    bookings = bookingApp.getBookings();
                    bookingApp.setBookings(bookings);
       //            Flights flights = flightController.getFlights();
       //            flights.changeSeats(flightID, -1);
       //            flightController.setFlights(flights);

                    //bookings = bookingApp.getBookings();
                    //bookingApp.setBookings(bookings);
            %>
            <!--display message below if booking is successful-->
            <p>Your flight has been successfully booked!</p>

            <% } else { %>
            <!--User already has a booking, insert a link to redirect them to it-->
            <p>It appears you already have a booking! Click <a href="MyBookings.jsp">here</a> to view your current booking.</p>
            <% } %>
        </div>
    </body>
</html>