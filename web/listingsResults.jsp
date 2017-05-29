<%-- 
    Document   : listingsResults
    Created on : 29/05/2017, 7:23:01 PM
    Author     : Ryan McCartney 12545738
--%>

<%@page import="lit.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% String filePath = application.getRealPath("WEB-INF/listings.xml");%>
    <jsp:useBean id="listingController" class="lit.ListingController" scope="application">
        <jsp:setProperty name="listingController" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
    
    <%
        String userID = request.getParameter("userID");
        String origin = request.getParameter("departureCity"); 
        String destination = request.getParameter("destinationCity"); 
        String departureDate = request.getParameter("departureDate"); 
        String returnDate = request.getParameter("returnDate"); 
        String type = request.getParameter("flightType");
        
        ArrayList<lit.Listing> listingList = listingController.getListingsFromParam(userID, origin, destination, departureDate, returnDate, type); 
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="MainCSS.css" rel="stylesheet" type="text/css" media="all">
        <title>Listings Results</title>
    </head>
    <body>
        <div class="wrapper">
            <div class="header">
                <img src="${pageContext.request.contextPath}/FHlogo.PNG" class="logo"/>
                <h1>FlyHigh Airlines</h1>
                <%
                   User user = (User) session.getAttribute("user");
                   String username = "";
                   if (user != null) 
                   {
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
        if (!listingList.isEmpty()) {    
            if (user != null) {
        %>
        <table>
            <tr>
                <th>User ID</th>
                <th>Origin</th> 
                <th>Destination</th>
                <th>Departure Date</th>
                <th>Return Date</th>
                <th>Flight Type</th>
            </tr>
        <%
            for (lit.Listing listing : listingList) 
            {
                //String listingInfo = listing.toString();
        %>
                <tr> 
                    <td> <%= listing.getUserID()%> </td>
                    <td> <%= listing.getOrigin()%> </td>
                    <td> <%= listing.getDestination() %> </td>
                    <td> <%= listing.getDepartureDate() %> </td>
                    <td> <%= listing.getReturnDate() %> </td>
                    <td> <%= listing.getFlightType() %> </td>
                </tr>
       
            <%} %>
       
          </table>
            <%
                } else { %>
                <table>
            <tr>
                <th>User ID</th>
                <th>Origin</th> 
                <th>Destination</th>
                <th>Departure Date</th>
                <th>Return Date</th>
                <th>Flight Type</th>
            </tr>
        <%
            for (lit.Listing listing : listingList) {
                //String listingInfo = listing.toString();
        %>
                <tr> 
                    <td> <%= listing.getUserID()%> </td>
                    <td> <%= listing.getOrigin()%> </td>
                    <td> <%= listing.getDestination() %> </td>
                    <td> <%= listing.getDepartureDate() %> </td>
                    <td> <%= listing.getReturnDate() %> </td>
                    <td> <%= listing.getFlightType() %> </td>
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
