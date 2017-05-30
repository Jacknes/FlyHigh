<%-- 
    Document   : account
    Created on : 27/05/2017, 12:40:42 PM
    Author     : jacknes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="lit.*"%>
<%@page import="java.util.*"%>
<!--Use of javabean to give access to users.xml through userApplication-->
<% String filePath = application.getRealPath("WEB-INF/users.xml");%>
<jsp:useBean id="userApp" class="lit.UserApplication" scope="application">
    <jsp:setProperty name="userApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
        <link href="MainCSS.css" rel="stylesheet" type="text/css" media="all">
        <title>FlyHigh - Main</title>
    </head>
    <body>
        <div class="wrapper">
            <div class="header">
                <img src="${pageContext.request.contextPath}/FHlogo.PNG" class="logo"/>
                <h1>FlyHigh Airlines</h1>
                <%@include file="navbar.jsp" %>
            </div>

            <%
                //retrieve user for the current session
                user = (User) session.getAttribute("user");
                String userID = user.getUserID();
                //if user enters data in the form below (user edits their account details)
                //this will run and update the user's details
                if (request.getParameter("name") != null || request.getParameter("password") != null || request.getParameter("email") != null) {
                    String name = request.getParameter("name");
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");

                    //Get the users from the userApp, replace the old user, add the new one and update. 
                    Users users = userApp.getUsers();
                    ArrayList<User> userList = users.getUsers();
                    userList.remove(user);
                    user.updateUser(name, email, password);
                    userList.add(user);
                    userApp.setUsers(users);
                }
            %>
            
            <% if (user != null) {%>
            <!--Display information below when a user is logged in-->
            <div class="mainTable">
                <h2>Account Details</h2>
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
                        <!--Button below allows user to cancel their membership-->
                <div class="deleteAccount">
                    <form action="deleteAccount.jsp?userID=<%= userID%>" method="POST">
                        <table>
                            <tr>
                                <td>Cancel Membership?</td>
                                <td><input type="submit" value="Cancel Membership"></td>
                            </tr>
                        </table>
                    </form>  
                </div>
            </div>

            <% } else {%>
            <!--If a viewer is not logged in display this error message -->
            <p>You are not authorised to view this page. Click <a href="main.jsp">here</a> to return to the home page.</p>
            <% }%>
        </div>
    </div>
</body>
</html>
