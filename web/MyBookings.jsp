<%-- 
    Document   : MyBookings
    Created on : 28/05/2017, 8:49:06 PM
    Author     : jacknes
--%>
<%@page import="lit.*"%>

<!--Use of bean to allow access to bookings.xml through bookingApplication-->
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
    <body>
        <div class="wrapper">
            <div class='header'>
                <img src="${pageContext.request.contextPath}/FHlogo.PNG" class="logo"/>
                <h1>My Bookings</h1>
                <%@include file="navbar.jsp"%>
                <!--Obtains the session with the user attribute-->
                <%
                    user = (User) session.getAttribute("user");
                    Booking booking = null;
                    String userID = "";
                    //If a user is logged in, retrieve their ID
                    //and retrieve their booking through passing in the userID as a parameter 
                    if (user != null) {
                        userID = user.getUserID();
                        Bookings bookings = bookingApp.getBookings();
                        booking = bookings.getUserBooking(userID);
                %>
            </div>
            <!--If the user has a booking, display the booking-->
            <%                if (booking != null) {
            %>

            <!--Creates a table to display the XML getters-->
            <div class="mainTable">
                <!--gets the users name and displays it-->
                <h2>This is your current booking, <%= user.getName()%></h2>
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
                        <!--Used getters to retrieve XML data and display it-->
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
                        <td><a href="deleteBooking.jsp?bookingID=<%= booking.getBookingID()%>">Cancel Booking</a></td>   
                    </tr>
                </table>
            </div> 

            <% } else { %>
            <!--When the user does not have a booking display this message-->
            <h1>You do not currently have a booking.</h1>
            <p>Click <a href="main.jsp">here</a> to make one!</p>

            <% }

            } else {%>
            <!--This displays when a user is not logged in, thus they do not have authority to view this page-->
            <h1>You are not authorised to view this page</h1>
            <p>Click <a href="login.jsp">here</a> to login!</p>
        </div>
        <% }%>
    </body>
</html>
