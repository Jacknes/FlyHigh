<%-- 
    Document   : createListing
    Created on : 30/05/2017, 1:29:45 PM
    Author     : jacknes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--Gets the bean for ListingController-->
<% String filePath = application.getRealPath("WEB-INF/listings.xml");%>
<jsp:useBean id="listingController" class="lit.ListingController" scope="application">
    <jsp:setProperty name="listingController" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="MainCSS.css" rel="stylesheet" type="text/css" media="all">
        <title>FlyHigh - Listing Created</title>
    </head>
    <div class="wrapper">
        <div class="header">
            <img src="${pageContext.request.contextPath}/FHlogo.PNG" class="logo"/>
            <h1>Listing Created</h1>
            <%@include file = "navbar.jsp" %>
        </div>
        <div class="mainTable">
            <body>
                <%
                    //checks if the user from session is valid, if it is, creates a new listing from the request parameters
                    if (user != null) {
                        String origin = request.getParameter("departureCity");
                        String destination = request.getParameter("destinationCity");
                        String departureDate = request.getParameter("departureDate");
                        String returnDate = request.getParameter("returnDate");
                        String type = request.getParameter("flightType");
                        String randomID = listingController.getListings().getRandomListingIDUnique();
                        Listing newListing = new Listing(randomID, user.getUserID(), origin, destination, departureDate, returnDate, type);
                        listingController.addListings(newListing); //stores the new listing in the xml. 
                %>  

                <h2>Listing Created!</h2>
                <p>Click <a href="listings.jsp">here</a> to go to your listings. </p>

                <%    } else {
                %>
                <h2>Could not complete request</h2>
                <p>Click <a href="main.jsp">here</a> to go home. </p>

                <%    }

                %>

            </body>

        </div>
    </div>
</html>
