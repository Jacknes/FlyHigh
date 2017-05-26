<%-- 
    Document   : main
    Created on : 23/04/2017, 11:40:14 PM
    Author     : jacknes
--%>

<%--
Main page: Shows the main search form for flights. The search results of the “Main” page are displayed on 
the “Results” page.
A user can search for flights using the following parameters:
    a- between two cities in Australia (Sydney, Melbourne, Brisbane, Perth ...)
    b- The type of flight (either “business‟, “economy‟) c- Departure date
    d- Return date
There are three possible scenarios for the “Main” page:
    - First Scenario (No login).
    - Second Scenario (Customer logged in).
    - Third Scenario (Admin logged in).
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="lit.*"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="MainCSS.css" rel="stylesheet" type="text/css" media="all">
        <title>FlyHigh - Main</title>
    </head>


    <body>
        <div class="wrapper">
            <div class="header">
                <img src="${pageContext.request.contextPath}/FHlogo.PNG" class="logo"/>
                <h1>FlyHigh Airlines</h1>
 <%
            User user = (User)session.getAttribute("user");
            String username = "";
            if(user != null){ 
               username = user.getName();
 %>
            
                <p>Welcome back to FlyHigh Airlines <%= user.getName()%> </p>
                 <ul>
                    <li><a href="main.jsp">Home</a></li>
                    <li><a href="booking.jsp">Bookings</a></li>
                    <li><a href="listings.jsp">Listings</a></li>
                    
                    <li style="float:right"><a href="logout.jsp">Logout</a></li>
                </ul>
                
                  <% } else { %>
                <ul>
                    <li><a href="main.jsp">Home</a></li>
                    <li style="float:right"><a href="login.jsp">Login</a></li>
                    <li style="float:right"><a href="register.jsp">Register</a></li>
                </ul>
                
                      <%}%>
            </div>
            
            <form action="loginAction.jsp" method="POST">
                <div class="mainTable">
                    <h2>Search Flights</h2>
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
                    </table>
                </div>
            </form>
        </div>
    </div>


    <!--    <br>
        <div id="wrapper">
          <div id="searchDiv">
            <input type="text" id="queryTerm" autofocus> </input>
            <br><br>
            <div id="buttonWrapper">
              <button onclick="query_btnpress()" id="queryBTN">Search</button>
            </div>
          </div>
            <br>-->
</body>
</html>

