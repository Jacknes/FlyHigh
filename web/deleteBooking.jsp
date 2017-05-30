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
        <link href="MainCSS.css" rel="stylesheet" type="text/css" media="all">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking deleted</title>
    </head>
    <body>
        <div class="wrapper">
            <div class="header">
                <img src="${pageContext.request.contextPath}/FHlogo.PNG" class="logo"/>
                <%@include file="navbar.jsp" %>
                
                <!--Use of javabean to allow access to users.xml through userApplication-->
                <% String filePath = application.getRealPath("WEB-INF/users.xml");%>
                <jsp:useBean id="userApp" class="lit.UserApplication" scope="application">
                    <jsp:setProperty name="userApp" property="filePath" value="<%=filePath%>"/>
                </jsp:useBean>
                
                <!--Use of javabean to allow access to bookings.xml through bookingApplication-->
                <% String filePath2 = application.getRealPath("WEB-INF/bookings.xml");%>
                <jsp:useBean id="bookingApp" class="lit.BookingApplication" scope="application">
                    <jsp:setProperty name="bookingApp" property="filePath" value="<%=filePath2%>"/>
                </jsp:useBean>
                 </div>
                <div class="mainTable">
                <%
                    String bookingID = request.getParameter("bookingID");
                    Booking bookingToDelete = null;
                    User authorisingUser = (User) session.getAttribute("user");
                    String userID = "0";
                    if (authorisingUser != null) {
                        userID = authorisingUser.getUserID();
                    }
                    if (userID != null && authorisingUser != null) {
                        bookingToDelete = bookingApp.getBookings().getBookingByID(bookingID);
                    }

                    //User userToDelete = (User)session.getAttribute("userToDelete");
                    if (bookingToDelete == null) { %>
           
            <!--Booking Not found for ID-->
            <p>Booking to delete not found. Click <a href="main.jsp">here</a> to return home. </p>

            <%} else if (bookingToDelete.bookedByUser(userID) || userApp.getUsers().isAdmin(authorisingUser.getUserID())) {
                Bookings bookings = bookingApp.getBookings();
                bookings.removeBooking(bookingID);
                //bookingApp.updateXML(bookings);

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
            <p>Booking deleted. Click <a href="main.jsp">here</a> to return home</p>
            <%}%>
                </div>
        </div>
    </body>
</html>
