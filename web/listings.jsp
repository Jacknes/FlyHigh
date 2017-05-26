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
        <title>FlyHigh - Main</title>
    </head>

    <body>
        <div class="wrapper">
            <div class="header">
                <img src="${pageContext.request.contextPath}/FHlogo.PNG" class="logo"/>
<!--                <h1>FlyHigh Airlines</h1>-->
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
<!--                
                  <% } else { %>
                <ul>
                    <li><a href="main.jsp">Home</a></li>
                    <li style="float:right"><a href="login.jsp">Login</a></li>
                    <li style="float:right"><a href="register.jsp">Register</a></li>
                </ul>-->
                
                      <%}%>
            </div>
            
                <div class="mainTable">
                    <h2>Your Listings</h2>
                    <table id="listingsTable">
                        <tr>
                            <td>Departure City</td>
                            <td><a href="results.jsp">View</a></td>
                        </tr>
                    </table>
                </div>
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
