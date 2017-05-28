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
    <xsl:template match="booking/bookings/bookingID">
        <h1>
            <xsl:apply-templates/>
        </h1>
    </xsl:template>
    <xsl:template match="booking/bookings/username">
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    
    <xsl:template match="booking">
        <table>
            <thead>
                <tr>
                    <th>
                        Your Flight Details
                    </th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates/>
            </tbody>
        </table>       
    </xsl:template>
    
    <xsl:template match="booking">
        <tr>
            <xsl:apply-templates/>
        </tr>      
    </xsl:template>
    
    <xsl:template match="">
        <td>
            <xsl:apply-templates/>
        </td>
    </xsl:template>

</xsl:stylesheet>
