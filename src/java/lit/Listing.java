/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lit;

import java.io.Serializable;
import javax.xml.bind.annotation.*;

/**
 *
 * @author Ryan McCartney 12545378
 */
@XmlRootElement
@XmlAccessorType(XmlAccessType.PROPERTY)
public class Listing implements Serializable
{
    @XmlElement(name = "listingID")
    String listingID;
    @XmlElement(name = "userID")
    String userID;
    @XmlElement(name = "origin")
    String origin;
    @XmlElement(name = "destination")
    String destination;
    @XmlElement(name = "departureDate")
    String departureDate;
    @XmlElement(name = "returnDate")
    String returnDate;
    @XmlElement(name = "type")
    String flightType;
    
    public Listing()
    {
        super();
    }

    public Listing(String listingID, String userID, String origin, String destination, String departureDate, String returnDate, String flightType) 
    {
        super();
        this.listingID = listingID;
        this.userID = userID;
        this.origin = origin;
        this.destination = destination;
        this.departureDate = departureDate;
        this.returnDate = returnDate;
        this.flightType = flightType;
    }
    
    @Override
    public String toString() 
    {
        return "test";
    }

    public String getUserID() 
    {
        return userID;
    }

    public String getOrigin() 
    {
        return origin;
    }

    public String getDestination() 
    {
        return destination;
    }

    public String getDepartureDate() 
    {
        return departureDate;
    }

    public String getReturnDate() 
    {
        return returnDate;
    }

    public String getFlightType() 
    {
        return flightType;
    }
    
    public String getListingID() 
    {
        return listingID;
    }
    
    public boolean isListing (String listingID)
    {
        return listingID.equals(this.listingID);
    }
}
