<%-- 
    Document   : manageBookings
    Created on : 28/05/2017, 6:15:36 PM
    Author     : Owner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="lit.*"%>

<!DOCTYPE html>
<html>
    <head>
        <link href="MainCSS.css" rel="stylesheet" type="text/css" media="all">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>
        <div class="wrapper">
            <div class="header">
                <img src="${pageContext.request.contextPath}/FHlogo.PNG" class="logo"/>
                <h1>Manage Bookings</h1>
                <%@include file="navbar.jsp" %>
                <%
                    user = (User) session.getAttribute("user");
                    username = "";
                    if (user != null) {
                        username = user.getName();
                        if (user.isAdmin()) {
                %>
            </div>
              
                <div class="mainTable">
                    <c:import url="WEB-INF/bookings.xml" var="inputDoc" />

                    <c:import url="WEB-INF/bookings.xsl" var="stylesheet"/>

                    <x:transform xml = "${inputDoc}"
                                 xslt = "${stylesheet}" />
                </div>
                <% } else { %>
                <p>You are not authorised to view this page</p>
                <% }%> 
                <% }%>
            </div>               
    </body>
</html>
