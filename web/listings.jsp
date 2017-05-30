<%-- 
    Document   : listings
    Created on : 23/05/2017, 4:05:33 PM
    Author     : Owner
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="lit.*"%>

<!--Uses a bean to allow access to listings.xml through listing controller-->
<% String filePath = application.getRealPath("WEB-INF/listings.xml");%>
<jsp:useBean id="listingController" class="lit.ListingController" scope="application">
    <jsp:setProperty name="listingController" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <html>
        <head>
            <link href="MainCSS.css" rel="stylesheet" type="text/css" media="all">
            <title>FlyHigh - Listings</title>
        </head>
        <body>
            <div class="wrapper">
                <div class="header">
                    <img src="${pageContext.request.contextPath}/FHlogo.PNG" class="logo"/>
                    <h1>Listings</h1>
                    <%@include file = "navbar.jsp" %>
                </div>
                <div class="mainTable">
                    <% if (user != null) { %>
                    <h2>Manage Listings</h2>

                    <%
                        String userID = user.getUserID(); //gets the userID from request.

                        ArrayList<Listing> listingsList = listingController.getListingsList(userID); //gets all the users lists

                        if (!listingsList.isEmpty()) {
                    %>
                    <table>
                        <tr>
                            <th>Departure City</th>
                            <th>Destination City</th>
                            <th>Departure Date</th>
                            <th>Return Date</th>
                            <th>Type of Flight</th>
                            <th>Open Listing</th>
                            <th>Close Listing</th>
                        </tr>
                        <% for (Listing listing : listingsList) {%>
                        <!--Show listings-->
                        <tr>

                            <td><%= listing.getOrigin()%></td>
                            <td><%= listing.getDestination()%></td>
                            <td><%= listing.getDepartureDate()%></td>
                            <td><%= listing.getReturnDate()%></td>
                            <td><%= listing.getFlightType()%></td>
                            <% String resultString = "?departureCity=" + listing.getOrigin() + "&destinationCity=" + listing.getDestination()
                                        + "&departureDate=" + listing.getDepartureDate() + "&returnDate=" + listing.getReturnDate() + "&flightType=" + listing.getFlightType();%>

                            <td><a href="results.jsp<%= resultString%>">View Listing</a></td>  
                            <td><a href="deleteListing.jsp?listingID=<%= listing.getListingID()%>">Close Listing</a></td>     
                        </tr>

                        <% } %>
                    </table>
                    <% } else { %>
                    <!--Display this message when a user does not have a listing-->
                    <h2> You currently do not have any listings!</h2>
                    <% } %>
                    <% } else {
                            String redirectURL = "404.jsp";
                            response.sendRedirect(redirectURL);
                        }%>
                </div>
            </div>
        </body>
    </html>
