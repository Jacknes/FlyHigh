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
        <%
            User user = (User)session.getAttribute("user");
            Booking booking = null;
            String userID = "";
            if (user != null) 
            {
                userID = user.getUserID();
                Bookings bookings = bookingApp.getBookings();
                booking = bookings.getUserBooking(userID);

        %>
            </head>
            <%
                if (booking != null) 
                {
            %>
            <body>
                <h1>This is your current booking, <%= user.getName() %></h1>
                <!--Insert booking information-->
                <%= booking.toString() %>
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
        
        
       <% } %>
</html>
