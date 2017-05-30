<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : users.xsl
    Created on : 28 May 2017, 5:15 PM
    Author     : Owner
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!--Creates the HTML output for the whole XML document-->
    <!--Defines the headers for the table that will be used to output the XML data-->
    <!--XML data will be outputed in the <tbody> through the use of apply-templates-->
    <xsl:template match="users">
        <html>
            <head>
            </head> 
            <body>
                <h2>Manage Users</h2>
                <table>
                    <thead>
                        <tr>
                            <th>UserID</th>
                            <th>Email</th>
                            <th>Full Name</th>
                            <th>Date of Birth</th>     
                            <th>Edit User</th>                      
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates/>
                    </tbody>
                </table>       
            </body>
        </html>
    </xsl:template>
    
    <!--For every user a new row is created in the table-->
    <!--and there is a link for an admin to delete the account with an xpath to the userID appended on the end of the URL-->
    <xsl:template match="user">
        <tr>
            <xsl:apply-templates/>
            <td>
                    <a href="deleteAccount.jsp?userID={userID}"> Cancel Membership</a>
            </td>
        </tr>
    </xsl:template>
    
    <!--Outputing userID, email, name and DOB in the table defined above-->
    <xsl:template match="userID|email|name|dob">
        <td>
            <xsl:apply-templates/>
        </td>
    </xsl:template>
    
    <!--Omitting the password, admin field and bookingID from being outputed in the transformation-->
    <xsl:template match="password|admin|bookingID">
    </xsl:template>
    
</xsl:stylesheet>
