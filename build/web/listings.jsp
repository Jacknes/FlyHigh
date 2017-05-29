<%-- 
    Document   : listings
    Created on : 23/05/2017, 4:05:33 PM
    Author     : Owner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="lit.*"%>
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

                <form action="listingsResults.jsp" method="POST">
                <div class="mainTable">
                    <h2>Search Listings</h2>
                    <table>
                        <tr>
                            <td>User ID</td>
                            <td><input type="text" name="userID"></td>
                        </tr>
                        <tr>
                            <td>Origin</td>
                            <td>
                                <select name='origin'>
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
                            <td>Destination</td>
                            <td>
                                <select name='destination'>
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
                    </table>
                </div>
            </form>
            </div>
    </body>
</html>
