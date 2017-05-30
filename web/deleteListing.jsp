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
                    String listingID = request.getParameter("listingID"); //gets the listing ID
                    Listing listingToDelete = null; //creates a listing object
                    User authorisingUser = (User) session.getAttribute("user"); //gets the user from the session
                    String userID = authorisingUser.getUserID(); //gets the users id
                    if (userID != null && authorisingUser != null) {
                        if (listingID != null) { //gets the listing for the listingID
                            listingToDelete = listingController.getListingForID(listingID);
                        }
                    }
                    //if the listing is not retrieved
                    if (listingToDelete == null) { %> 
                <!--User Not found for ID-->

                <p>Listing to delete not found. Click <a href="main.jsp">here</a> to return home. </p>


                <%} else if (listingController.canUserRemoveListing(userID, listingID)) { //checks the user is authorised to delete the listing
                    listingController.removeListing(listingToDelete);
                %>  

                <p>Listing deleted. Click <a href="main.jsp">here</a> to return home</p>

                <%
                    }
                %>
            </div>
        </body>
    </div>
</html>