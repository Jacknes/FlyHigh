<%-- 
    Document   : deleteAccount
    Created on : 27/05/2017, 3:47:21 PM
    Author     : jacknes
--%>

<%@page import="lit.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account deleted</title>
    </head>
    <body>
        <div class="wrapper">
            <div class="header">
                <img src="${pageContext.request.contextPath}/FHlogo.PNG" class="logo"/>
                <h1>FlyHigh Airlines</h1>
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
                <%
                    String userID = request.getParameter("userID");
                    User userToDelete = null;
                    User authorisingUser = (User) session.getAttribute("user");
                    if (userID != null && authorisingUser != null) {
                        userToDelete = userApp.getUsers().getUserByID(userID);
                    }

                    //User userToDelete = (User)session.getAttribute("userToDelete");
                    if (userToDelete == null) { %>
            </div>
            <!--User Not found for ID-->
            <p>User to delete not found. Click <a href="main.jsp">here</a> to return home. </p>

            <%} else if (userID.equals(authorisingUser.getUserID()) || userApp.getUsers().isAdmin(authorisingUser.getUserID())) {
                userApp.removeUser(userToDelete);
                Users users = userApp.getUsers();
                userApp.updateXML(users);
                Bookings bookings = bookingApp.getBookings();
                bookings.deleteBookingsForUser(userID);
                bookingApp.setBookings(bookings);
                //bookingApp.removeBookingForUser(userID);
                //        bookingApp.updateXML(bookingApp.getBookings());
                if (userID.equals(authorisingUser.getUserID())) {
                    session.setAttribute("user", null);
                }
            %>  
            <p>Membership has been cancelled. Click <a href="main.jsp">here</a> to return home</p>
            <% }%>
        </div>
    </body>
</html>