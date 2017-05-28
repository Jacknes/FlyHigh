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

                <div class="mainTable">
                    <h2>Your Listings</h2>
                    <table id="listingsTable">
                        <tr>
                            <td>Listing 1</td>
                            <td><a href="results.jsp">View</a></td>
                        </tr>
                    </table>
                </div>
            </div>
    </body>
</html>
