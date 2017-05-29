<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : users.xsl
    Created on : 29 May 2017, 9:41 PM
    Author     : Owner
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="listings">
        <html>
            <head>
                <h1>Users</h1>
            </head> 
            <body>
                <table>
                    <thead>
                        <tr>
                            <th>UserID</th>
                            <th>Origin</th>
                            <th>Destination</th>
                            <th>Departure Date</th>     
                            <th>Return Date</th>
                            <th>Flight Type</th>                      
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates/>
                    </tbody>
                </table>       
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="listings">
        <tr>
            <xsl:apply-templates/>
            <td>
                    <a href="deleteListing.jsp?userID={userID}"> Delete Listing</a>
            </td>
        </tr>
    </xsl:template>
    
    <xsl:template match="userID|origin|destination|departureDate|returnDate|flightType">
        <td>
            <xsl:apply-templates/>
        </td>
    </xsl:template>
    
</xsl:stylesheet>
