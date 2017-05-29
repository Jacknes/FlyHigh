<%-- 
    Document   : account
    Created on : 27/05/2017, 12:40:42 PM
    Author     : jacknes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="lit.*"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="MainCSS.css" rel="stylesheet" type="text/css" media="all">
        <title>FlyHigh - Main</title>
    </head>
    <%  
            
            if (request.getParameter("name") != null){
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String gender = request.getParameter("gender");
            String favcol = request.getParameter("favcol");
            String TOS = request.getParameter("tos");
            //TODO: Actually replace the user values in the userApp and update the XML.         
            User newUser = new User(email, name, password, gender, favcol);
            session.setAttribute("user", newUser);
            }
           
            User user = (User)session.getAttribute("user");
            String userID = user.getUserID();
            
        %>

    <body>
        <div class="wrapper">
            <div class="header">
                <img src="${pageContext.request.contextPath}/FHlogo.PNG" class="logo"/>
                <h1>FlyHigh Airlines</h1>
                <%
                    if (user != null) {
                %>

                <p>Welcome back to FlyHigh Airlines, <%= user.getName()%> </p>   
                 <ul>
                    <li><a href="main.jsp">Home</a></li>
                    <li><a href="booking.jsp">Bookings</a></li>
                    <li><a href="listings.jsp">Listings</a></li>
                    <li style="float:right"><a href="account.jsp">Account</a></li>
                    <li style="float:right"><a href="logout.jsp">Logout</a></li>
                </ul>
                 
                 
                <% } else {%>
                <p>Oops, you shouldn't be here. Click <a href="main.jsp">here</a> to go back</p>
                
                <% } %>
            </div>

           <h1>My Account</h1>
        <form action="account.jsp" method="POST">
            <table>
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="email" value="<%=user.getEmail()%>"></td>
                </tr>
                <tr>
                    <td>Full Name</td>
                    <td><input type="text" name="name"value="<%=user.getName()%>"></td>
                </tr>
                 <tr>
                    <td>Password</td>
                    <td><input type="password" name="password"value="<%=user.getPassword()%>"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Save"></td>
                </tr>

            </table>
        </form>
                
                <form action="deleteAccount.jsp?userID=<%= userID%>" method="POST">
                    <input type="submit" value="Delete Account">
                </form>        
                
                
        </div>
    </div>
</body>
</html>
