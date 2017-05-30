<%-- 
    Document   : editBooking
    Created on : 29/05/2017, 2:12:10 PM
    Author     : jacknes
--%>


<!--Gets the BookingApplication bean-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String filePathBookings = application.getRealPath("WEB-INF/bookings.xml");%>
<jsp:useBean id="bookingApp" class="lit.BookingApplication" scope="application">
    <jsp:setProperty name="bookingApp" property="filePath" value="<%=filePathBookings%>"/>
</jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Booking</title>
        <link href="MainCSS.css" rel="stylesheet" type="text/css" media="all">   
    </head>
    <div class="wrapper">
        <div class="header">
            <img src="${pageContext.request.contextPath}/FHlogo.PNG" class="logo"/>
            <h1>Edit Booking</h1>
            <%@include file="navbar.jsp" %>
        </div>       
        <div class="mainTable">
            <%
                String bookingID = request.getParameter("bookingID"); //gets the bookingID
                if (bookingID != null) {
                    //get booking object, if non is found display error,
                    //else display booking in a form
                    Bookings bookings = bookingApp.getBookings();
                    Booking booking = bookings.getBookingByID(bookingID); //gets the booking object for that ID.
                    if (booking != null) {
            %>
            <body>
                <h2>Edit Booking</h2>
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
                    </tr>
                    <tr>
                    <form action="editBookingAction.jsp" method="POST">
                        <!--The following data fields are retrieved from the XML and displayed--> 
                        <td><%= booking.getBookingID()%> <input type="hidden" name="bookingID" value="<%= booking.getBookingID()%>"></td>
                        <td><%= booking.getUsername()%></td>
                        <td><%= booking.getUserID()%></td>
                        <td><%= booking.getFlightID()%></td>
                        <td><%= booking.getDepartureDate()%></td>
                        <td><%= booking.getReturnDate()%></td>
                        <td><%= booking.getOrigin()%></td>
                        <td><%= booking.getDestination()%></td>
                        <td><select name='flightType'>
                                <% if (booking.getFlightType().equals("economy")) {%>
                                <option value='Economy' selected="selected" >Economy</option>   
                                <option value='Business'>Business</option>
                                <% } else { %>
                                <option value='Economy'>Economy</option>   
                                <option value='Business' selected="selected">Business</option>

                                <% }%>
                            </select>
                        </td>
                        <td><%= booking.getPrice()%></td>
                        <td><%= booking.getSeat()%></td>
                        <td><%= booking.getDescription()%></td>   
                        <!--Links below are for admin use to either edit or cancel a booking-->
                        <td><input type="submit" value="Edit Booking"></td>
                        <!--<td><a href="editBooking.jsp?bookingID=<%= booking.getBookingID()%>&type=">Edit Booking</a></td>-->    
                    </form>
                    </tr>

                    <!--Show booking info-->
            </body>
            <% } else { %>

            <!--No booking found for id-->

            <% }
            } else { %>
            <body>
                <h2>Error no ID passed in.</h2>
                <p>Click <a href="main.jsp">here</a> to return home.</p>
            </body>
            <% }%>
        </div>
    </div>
</html>
