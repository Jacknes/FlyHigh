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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            for (lit.Flight flight : flightList) {
                String flightInfo = flight.toString();
               %>
               <p> <%= flightInfo %> </p>
            <%} %>
            
    </body>
</html>
