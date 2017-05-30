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
        <link href="MainCSS.css" rel="stylesheet" type="text/css" media="all">
    </head>

    <!--Use of bean to allow access to listings.xml through listingController-->
    <% String filePath = application.getRealPath("WEB-INF/listings.xml");%>
    <jsp:useBean id="listingController" class="lit.ListingController" scope="application">
        <jsp:setProperty name="listingController" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
    
    <div class="wrapper">
        <div class="header">
            <img src="${pageContext.request.contextPath}/FHlogo.PNG" class="logo"/>
                <h1>Deleted Listing</h1>
                <%@include file="navbar.jsp" %>
        </div>
    <body>
        <div class="mainTable">
    <% 
    String listingID = request.getParameter("listingID");
    Listing listingToDelete = null;
    User authorisingUser = (User)session.getAttribute("user");
    String userID = authorisingUser.getUserID();
    if (userID != null && authorisingUser != null){
        if (listingID != null) 
        {
            listingToDelete = listingController.getListingForID(listingID);
        }
        //public boolean canUserRemoveListing(String userID, String listingID) 
        //listingToDelete = listingApp.getListings().getListing(listingID);
    }
    
    if (listingToDelete == null) 
    { %>
    <!--User Not found for ID-->
    
        <p>Listing to delete not found. Click <a href="main.jsp">here</a> to return home. </p>

    
        <%} else if (listingController.canUserRemoveListing(userID, listingID)) 
            {
            listingController.removeListing(listingToDelete);
            //Listings listings = listingApp.getListings();
            //listingController.updateXML(listings);
//        if(userID.equals(authorisingUser.getUserID()))
//            session.setAttribute("user", null);
  %>  
    
        <p>Listing deleted. Click <a href="main.jsp">here</a> to return home</p>


<%
    }  
    %>
        </div>
    </body>
    </div>
</html>