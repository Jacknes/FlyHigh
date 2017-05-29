<%-- 
    Document   : deleteAccount
    Created on : 29/05/2017, 9:49 PM
    Author     : Ryan McCartney
--%>

<%@page import="lit.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listing deleted</title>
    </head>
    <% String filePath = application.getRealPath("WEB-INF/listings.xml");%>
    <jsp:useBean id="listingApp" class="lit.ListingController" scope="application">
        <jsp:setProperty name="listingApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
    
    <% 
    String listingID = request.getParameter("listingID");
    Listing listingToDelete = null;
    User authorisingUser = (User)session.getAttribute("user");
    String userID = authorisingUser.getUserID();
    if (userID != null && authorisingUser != null){
        listingToDelete = listingApp.getListings().getListing(listingID);
    }
    
    if (listingToDelete == null) 
    { %>
    <!--User Not found for ID-->
    <body>
        <p>Listing to delete not found. Click <a href="main.jsp">here</a> to return home. </p>
    </body>
    
    <%} else if (userID.equals(authorisingUser.getUserID())) {
        listingApp.removeListing(listingToDelete);
        Listings listings = listingApp.getListings();
        listingApp.updateXML(listings);
//        if(userID.equals(authorisingUser.getUserID()))
//            session.setAttribute("user", null);
  %>  
    
    <body>
        <p>Listing deleted. Click <a href="main.jsp">here</a> to return home</p>
    </body>

<%
    }  
    %>

</html>