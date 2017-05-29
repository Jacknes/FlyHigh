<%-- 
    Document   : deleteBooking
    Created on : 29/05/2017, 2:12:01 PM
    Author     : jacknes
--%>

<%@page import="lit.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking deleted</title>
    </head>
    <%@include file="navbar.jsp" %>
    <% String filePath = application.getRealPath("WEB-INF/users.xml");%>
    <jsp:useBean id="userApp" class="lit.UserApplication" scope="application">
        <jsp:setProperty name="userApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
    
    <% String filePath2 = application.getRealPath("WEB-INF/bookings.xml");%>
    <jsp:useBean id="bookingApp" class="lit.BookingApplication" scope="application">
        <jsp:setProperty name="bookingApp" property="filePath" value="<%=filePath2%>"/>
    </jsp:useBean>
    <% 
    String bookingID = request.getParameter("bookingID");
    Booking bookingToDelete = null;
    User authorisingUser = (User)session.getAttribute("user");
    String userID = authorisingUser.getUserID();
    if (userID != null && authorisingUser != null){
        bookingToDelete = bookingApp.getBookings().getBookingByID(bookingID);
    }
    
    //User userToDelete = (User)session.getAttribute("userToDelete");
    if (bookingToDelete == null) 
    { %>
    <!--Booking Not found for ID-->
    <body>
        <p>Booking to delete not found. Click <a href="main.jsp">here</a> to return home. </p>
    </body>
    

    <%} else if (bookingToDelete.bookedByUser(userID) || userApp.getUsers().isAdmin(authorisingUser.getUserID())) 
        {   
        Bookings bookings = bookingApp.getBookings();
        bookings.removeBooking(bookingID);
        bookingApp.updateXML(bookings);
        
//        userApp.removeUser(userToDelete);
//        Users users = userApp.getUsers();
//        userApp.updateXML(users);
//        Bookings bookings = bookingApp.getBookings();
//        bookings.deleteBookingsForUser(userID);
//        bookingApp.setBookings(bookings);
        //bookingApp.removeBookingForUser(userID);
//        bookingApp.updateXML(bookingApp.getBookings());
//        if(userID.equals(authorisingUser.getUserID()))
//            session.setAttribute("user", null);
  %>  
    <body>
        <p>Booking deleted. Click <a href="main.jsp">here</a> to return home</p>
    </body>
<%
    }  
    %>

</html>
