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

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="users">
        <html>
            <head>
                <h1>Users</h1>
            </head> 
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="booking">
        <table>
            <thead>
                <tr>
                    <th>UserID</th>
                    <th>Email</th>
                    <th>Full Name</th>
                    <th>Date of Birth</th>
                    <th>Departure</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates/>
            </tbody>
        </table>       
    </xsl:template>
    
    <xsl:template match="userID|email|name|dob">
        <td>
            <xsl:apply-templates/>
        </td>
    </xsl:template>
    
    <xsl:template match="password|admin|bookingID">
    </xsl:template>

</xsl:stylesheet>
