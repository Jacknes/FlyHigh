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
        Flights flights = new Flights();
        flights = flightController.getFlights();
        ArrayList<lit.Flight>  flightList = flights.getFlights();
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
