<%-- 
    Document   : login
    Created on : 23/04/2017, 11:40:00 PM
    Author     : jacknes
--%>

<%--
Login page: This page is a HTML form where a registered customer can login to flight center. 
Login form require the following unique customer parameters:
    a- Email (Username).
    b- Password.
The login form is processed by verifying the customer’s login data against existing data in an XML. 
If login is successful, it takes the customer to the “Main” page at the Second Scenario. 
After logging in, if the customer performs a search on the “Main” page, the flights list displayed on 
the “Results” page become clickable or selectable. (If a customer select a flight it 
should take them to the “Booking” page)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="MainCSS.css" rel="stylesheet" type="text/css" media="all">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FlyHigh Login Page</title>
    </head>
    <body>
        <div class="wrapper">
        
                <div class="header">
                <img src="${pageContext.request.contextPath}/FHlogo.PNG" class="logo"/>
                <h1>Login</h1>
                <%@include file = "navbar.jsp" %>
            </div>
            
                <%
                    String email = request.getParameter("email");
                    String emailText = "";
                    if (email != null) 
                    {    
                        emailText = email;
                    }
                %>

            <form action="loginAction.jsp" method="POST">
                <div class="mainTable">
                    <table>
                        <tr>
                            <td>Email</td>
                            <td><input type="text" name="email" value="<%= emailText%>"></td>
                        </tr>
                        <tr>
                            <td>Password</td>
                            <td><input type="password" name="password"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Login"></td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
    </body>
</html>
