<%-- 
    Document   : editBookingAction
    Created on : 30/05/2017, 6:16:30 PM
    Author     : jacknes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--Get the booking bean-->
<% String filePath = application.getRealPath("WEB-INF/bookings.xml");%>
<jsp:useBean id="bookingApp" class="lit.BookingApplication" scope="application">
    <jsp:setProperty name="bookingApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>
<%@page import="lit.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Edited</title>
    </head>
    <div class="wrapper">
        <div class="header">
            <img src="${pageContext.request.contextPath}/FHlogo.PNG" class="logo"/>
            <h1>Booking Edited</h1>
            <%@include file="navbar.jsp" %>
        </div>   
        <div class="mainTable"> 
        <%
            String bookingID = request.getParameter("bookingID"); //get the ids from the request
            String type = request.getParameter("flightType");
            if (bookingID != null) {
                //get booking object, if non is found display error,
                //else display booking in a form
                Bookings bookings = bookingApp.getBookings();
                Booking booking = bookings.getBookingByID(bookingID);
                bookings.removeBooking(bookingID);
                booking.changeType(type);
                bookings.addBooking(booking);
                bookingApp.setBookings(bookings);
                String redirectURL = "main.jsp"; //after the booking is updated, direct the user to the main page.
                response.sendRedirect(redirectURL);
        %>
            <body>
                <h1>Hello World!</h1>
            </body>
            <% } else { %>
            <body>
                <h2>Could not find booking for that ID</h2>
                <p>Click <a href="main.jsp">here</a> to return home.</p>
            </body>
            <% } %>
        </div>
    </div>
</html>
