<%-- 
    Document   : results
    Created on : 24/05/2017, 4:59:44 PM
    Author     : Owner
--%>
<!--
<table>
                        <tr>
                            <td>Departure City</td>
                            <td>
                                <select name='departureCity'>
                                    <option value='Sydney'>Sydney</option>   
                                    <option value='Adelaide'>Adelaide</option>
                                    <option value='Melbourne'>Melbourne</option>  
                                    <option value='Brisbane'>Brisbane</option>
                                    <option value='Darwin'>Darwin</option>
                                    <option value='Perth'>Perth</option>
                                    <option value='Hobart'>Hobart</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Destination City</td>
                            <td>
                                <select name='destinationCity'>
                                    <option value='Sydney'>Sydney</option>   
                                    <option value='Adelaide'>Adelaide</option>
                                    <option value='Melbourne'>Melbourne</option>  
                                    <option value='Brisbane'>Brisbane</option>
                                    <option value='Darwin'>Darwin</option>
                                    <option value='Perth'>Perth</option>
                                    <option value='Hobart'>Hobart</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Departure Date</td>
                            <td><input type="date" name="departureDate"></td>
                        </tr>
                        <tr>
                            <td>Return Date</td>
                            <td><input type="date" name="returnDate"></td>
                        </tr>
                        <tr>
                            <td>Type of Flight</td>
                            <td>
                                <select name='flightType'>
                                    <option value='Economy'>Economy</option>   
                                    <option value='Business'>Business</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Search"></td>
                        </tr>
                    </table>-->
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
