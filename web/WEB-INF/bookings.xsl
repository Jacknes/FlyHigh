<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : admin.xsl
    Created on : 28 May 2017, 2:01 PM
    Author     : Owner
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="bookings">
        <html>
            <head>
                <h1>Bookings</h1>
            </head> 
            <body>
                <table>
                    <thead>
                        <tr>
                            <th>BookingID</th>
                            <th>Full Name</th>
                            <th>UserID</th>
                            <th>FlightID</th>
                            <th>Departure</th>
                            <th>Return</th>
                            <th>Origin</th>
                            <th>Destination</th>
                            <th>Flight Type</th>
                            <th>Price</th>
                            <th>Seat</th>
                            <th>Description</th>
                            <th>Edit</th>
                            <th>Cancel</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates/>
                    </tbody>
                </table>       
            </body>
        </html>
    </xsl:template>
    
     <xsl:template match="booking">
        <tr>
            <xsl:apply-templates/>
            <td>
                <a href="editBooking.jsp?bookingID={bookingID}">Edit Booking</a>
            </td>
            <td>
                <a href="deleteBooking.jsp?bookingID={bookingID}">Cancel Booking</a>
            </td>
        </tr>
    </xsl:template>
    
    <xsl:template match="bookingID|username|userID|flightID|departureDate|returnDate|origin|destination|flightType|price|seat|description">
        <td>
            <xsl:apply-templates/>
        </td>
    </xsl:template>
    
</xsl:stylesheet>
