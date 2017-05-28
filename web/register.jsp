<%-- 
    Document   : register
    Created on : 06/05/2017, 9:59:43 PM
    Author     : jacknes
--%>

<%--
Register page: This page is an HTML form where a user interested in booking a flight can enter the following 
details in order to become a flight customer (flight membership): 
    a- Full name
    b- Email (username)
    c- Password
    d- Date of Birth (DOB)
The registration form is processed by adding the new user to an XML. After the viewer is registered as a customer,
there are two options:
    - First option: The customer has performed a search on the “Main” page and obtained
        flight list as result then clicked register link. In this case, the registration form process
        takes the customer to the “Results” page at the Second Scenario.
    - Second option: The customer has not performed a search on the “Main” page. In this
        case, the registration process takes the customer to the “Main” page at the Second Scenario.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="MainCSS.css" rel="stylesheet" type="text/css" media="all">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FlyHigh Register Page</title>
    </head>
    
    <body>
        <div class="wrapper">
            <div class='header'>
                <img src="${pageContext.request.contextPath}/FHlogo.PNG" class="logo"/>
                <h1>Welcome to FlyHigh Airlines</h1>
                <%@include file="navbar.jsp" %>
            </div>
            <form action="registerAction.jsp" method="POST">
                <div class="mainTable">
                    <h2>Register</h2>
                    <table>
                        <tr>
                            <td>Full Name</td>
                            <td><input type="text" name="name"></td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td><input type="text" name="email"></td>
                        </tr>
                        <tr>
                            <td>Password</td>
                            <td><input type="password" name="password"></td>
                        </tr>
                        <tr>
                            <td>Date of Birth</td>
                            <td> <input type="date" name="dob" value="09/09/1999"> </td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Register"></td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
    </body>
</html>
