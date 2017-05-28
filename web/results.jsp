<%-- 
    Document   : results
    Created on : 24/05/2017, 4:59:44 PM
    Author     : Owner
--%>

<%@page import="lit.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--<?xml-stylesheet type="text/xsl" href="results.xsl"?>-->

<% String filePath = application.getRealPath("WEB-INF/flights.xml");%>
    <jsp:useBean id="flightController" class="lit.FlightController" scope="application">
        <jsp:setProperty name="flightController" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
<!--http://hostname.com/mywebapp/mypage.jsp?name=John+Smith-->
    <%
        String origin = request.getParameter("departureCity"); 
        String destination = request.getParameter("destinationCity"); 
        String departureDate = request.getParameter("departureDate"); 
        String returnDate = request.getParameter("returnDate"); 
        String type = request.getParameter("flightType"); 
        //Flights flights = new Flights(); 
        ArrayList<lit.Flight>  flightList = flightController.getFlightsFromParam(origin, destination, departureDate, returnDate, type); 
        //ArrayList<lit.Flight>  flightList = flights.getFlights(); 
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="MainCSS.css" rel="stylesheet" type="text/css" media="all">
        <title>Results</title>
    </head>
     <body>
        <div class="wrapper">
            <div class="header">
                <img src="${pageContext.request.contextPath}/FHlogo.PNG" class="logo"/>
                <h1>FlyHigh Airlines</h1>
                <%
                    User user = (User) session.getAttribute("user");
                    String username = "";
                    if (user != null) {
                        username = user.getName();
                        if (user.isAdmin()) {
                %>

                <p>Welcome back to FlyHigh Airlines, <%= user.getName()%> </p>   
                <ul>
                    <li><a href="main.jsp">Home</a></li>
                    <li><a href="admin.jsp">Administrative</a></li>
                    <li style="float:right"><a href="account.jsp">Account</a></li>
                    <li style="float:right"><a href="logout.jsp">Logout</a></li>
                </ul>
                <% } else {%>
                <p>Welcome back to FlyHigh Airlines <%= user.getName()%> </p>
                <ul>
                    <li><a href="main.jsp">Home</a></li>
                    <li><a href="booking.jsp">Bookings</a></li>
                    <li><a href="listings.jsp">Listings</a></li>

                    <li style="float:right"><a href="account.jsp">Account</a></li>
                    <li style="float:right"><a href="logout.jsp">Logout</a></li>
                </ul>

                <% } %>
                <% } else { 
                String returnTo = (String)request.getAttribute("javax.servlet.forward.request_uri");
                %>
                <ul>
                    <li><a href="main.jsp">Home</a></li>
                    <li style="float:right"><a href="login.jsp">Login</a></li>
                    <li style="float:right"><a href="register.jsp?returnToResults=<%= returnTo%>">Register</a></li>
                </ul>
                <%}%>
            </div>
            <div>
        <%
        if (!flightList.isEmpty()) {    
            if (user != null) {
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
        <%
            for (lit.Flight flight : flightList) 
            {
                //String flightInfo = flight.toString();
        %>
                <tr> 
                    <td> <%= flight.getFlightID() %> </td>
                    <td> <%= flight.getOrigin()%> </td>
                    <td> <%= flight.getDestination() %> </td>
                    <td> <%= flight.getDepartureDate() %> </td>
                    <td> <%= flight.getReturnDate() %> </td>
                    <td> <%= flight.getSeats() %> </td>
                    <td> $<%= flight.getPrice() %> </td>
                    <td> <a href="booking.jsp?flightID=<%= flight.getFlightID()%>">Book</a></td>
                </tr>
       
            <%} %>
       
          </table>
            <%
                } else { %>
                <table>
            <tr>
                <th>Flight ID</th>
                <th>Origin</th> 
                <th>Destination</th>
                <th>Departure Date</th>
                <th>Return Date</th>
                <th>Seats Left</th>
                <th>Price</th>
            </tr>
        <%
            for (lit.Flight flight : flightList) {
                //String flightInfo = flight.toString();
        %>
                <tr> 
                    <td> <%= flight.getFlightID() %> </td>
                    <td> <%= flight.getOrigin()%> </td>
                    <td> <%= flight.getDestination() %> </td>
                    <td> <%= flight.getDepartureDate() %> </td>
                    <td> <%= flight.getReturnDate() %> </td>
                    <td> <%= flight.getSeats() %> </td>
                    <td> $<%= flight.getPrice() %> </td>
                </tr>
       
            <%} %>
       
          </table>
                
                <% }

        
        } else { %>
        <p>No results found. Please refine your search history. Click <a href="main.jsp">here</a> to return to the main menu</p>
        <% } %>
            </div>
        </div>
    </body>
</html>
