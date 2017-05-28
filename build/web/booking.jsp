<%-- 
    Document   : booking
    Created on : 06/05/2017, 10:04:03 PM
    Author     : jacknes
--%>

<%--
Booking page: Flight customers can access this page from “Results” page or the “Main” page 
(if customer is logged in). They can perform the following booking management functionalities:
    a- Make a booking (only if a flight has available seats)
    b- View booking (existing customer booking)
    c- Edit booking (A customer cannot change booking details on the same flight date) 
    d- Cancel a booking (A customer cannot cancel a booking on the same flight date)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="lit.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>

<% String filePath = application.getRealPath("WEB-INF/flights.xml");%>
    <jsp:useBean id="flightController" class="lit.FlightController" scope="application">
        <jsp:setProperty name="flightController" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
<html>
    <head>
        <link href="MainCSS.css" rel="stylesheet" type="text/css" media="all">
        <title>FlyHigh - Bookings</title>
    </head>
    <%
        String flightID = request.getParameter("flightID");
        if (flightID == null)
        {
            flightID = "0";
        }
    %>

    <%
        String flightID = request.getParameter("flightID");
        if (flightID == null)
        {
            flightID = "0";
        }
    %>
    <body>
        <div class="wrapper">
            <div class="header">
                <img src="${pageContext.request.contextPath}/FHlogo.PNG" class="logo"/>
                <h1>FlyHigh Airlines</h1>
                <%
                    User user = (User) session.getAttribute("user");
                    if (user != null){
                        if (user.isAdmin()){
                %>
                <p>Welcome back to FlyHigh Airlines <%= user.getName()%>  flightID<%= flightID%></p>   
                <p>Welcome back to FlyHigh Airlines <%= user.getName()%></p>   
                <ul>
                    <li><a href="main.jsp">Home</a></li>
                    <li><a href="booking.jsp">Bookings</a></li>                  
                    <li><a href="admin.jsp">Administrative</a></li>
                    <li style="float:right"><a href="logout.jsp">Logout</a></li>
                </ul>               
                <% } else { %>
                
                <p><%=  user.getName()%>'s Bookings</p>
                <ul>
                    <li><a href="main.jsp">Home</a></li>
                    <li><a href="booking.jsp">Bookings</a></li>                  
                    <li><a href="admin.jsp">Administrative</a></li>
                    <li style="float:right"><a href="logout.jsp">Logout</a></li>
                </ul>               
                <% } else { %>
                
                <p><%=  user.getName()%>'s Bookings</p>
                <ul>
                    <li><a href="main.jsp">Home</a></li>
                    <li><a href="booking.jsp">Bookings</a></li>
                    <li><a href="listings.jsp">Listings</a></li>
                    <li style="float:right"><a href="account.jsp">Account</a></li>
                    <li style="float:right"><a href="logout.jsp">Logout</a></li>
                </ul>
                
                <% } %>
                
                <% } %>
                
                <% 
                    
                    lit.Flight flight = flightController.getFlights().getFlight(flightID);
                    
                    //Check if user booked on this flight already, through the user instance and a bookingController instance. 
                    
                    //if the user is already booked on this flight, allow to edit or cancel, 
                    //if not book. 
                %>
                <table>
                    <tr>
                        <th>Flight ID</th>
                        <th>Origin</th> 
                        <th>Destination</th>
                        <th>Departure Date</th>
                        <th>Return Date</th>
                        <th>Seats Left</th>
                        <th>Price</th>
                        <th>Book</th>
                    </tr>
                    <tr> 
                        <td> <%= flight.getFlightID() %> </td>
                        <td> <%= flight.getOrigin()%> </td>
                        <td> <%= flight.getDestination() %> </td>
                        <td> <%= flight.getDepartureDate() %> </td>
                        <td> <%= flight.getReturnDate() %> </td>
                        <td> <%= flight.getSeats() %> </td>
                        <td> $<%= flight.getPrice() %> </td>
                        <td> <a href="bookingAction.jsp?flightID=<%= flight.getFlightID()%>&userID=<%= user.getUserID()%>">Book</a></td>
                    </tr>
              </table>
                <!--Implement booking options logic here-->
                
                
                
                
                
                
                
                <% } else { %>
                <p>You must be logged in to view this page! Click <a href="login.jsp">here</a> to login into your FlyHigh account or click <a href="main.jsp">here</a>to return to the home page.</p>
                <% }%>
            </div>

  
            <!--Bookings Content goes here-->
                
            
        </div>
    </div>
</body>
</html>
