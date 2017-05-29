<%-- 
    Document   : registerAction
    Created on : 08/05/2017, 2:46:29 PM
    Author     : jacknes
--%>


<%-- 
The registration form is processed by adding the new user to an XML. After the viewer is registered as a customer,
there are two options:
    - First option: The customer has performed a search on the “Main” page and obtained
        flight list as result then clicked register link. In this case, the registration form process
        takes the customer to the “Results” page at the Second Scenario.
    - Second option: The customer has not performed a search on the “Main” page. In this
        case, the registration process takes the customer to the “Main” page at the Second Scenario.
--%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="lit.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.xml.validation.*;"%>

 <% String filePath = application.getRealPath("WEB-INF/users.xml");%>
    <jsp:useBean id="userApp" class="lit.UserApplication" scope="application">
        <jsp:setProperty name="userApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>

    <%
        boolean createUserSuccess = false;
        Users users = new Users();
        users = userApp.getUsers();
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String dob = request.getParameter("dob");
        
        if (name.isEmpty() || email.isEmpty() || password.isEmpty()) {
            //invalid submission
            createUserSuccess = false;
        } else 
        {
            users.addUser(name, email, password, dob);
            userApp.updateXML(users);
            createUserSuccess = true;
            User user = users.getUser(email);
            session.setAttribute("user", user);
        }
         

        if(createUserSuccess == false) {
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Unsuccessful</title>
    </head>
    <body>
        <p>Your registration was unsuccessful. Please click <a href="register.jsp">here</a> to try again. </p>
    </body>
</html>


<% } else { 

    String redirectURL = "main.jsp";
    response.sendRedirect(redirectURL);


} %>