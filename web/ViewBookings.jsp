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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            for (Booking booking : bookingList) {
                String bookingInfo = booking.toString();
               %>
               <p> <%= bookingInfo %> </p>
            <%} %>
            
    </body>
</html>

