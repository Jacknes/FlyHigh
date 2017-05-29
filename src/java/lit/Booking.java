/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lit;

import java.util.*;
import javax.xml.bind.annotation.*;

/**
 *
 * @author jacknes
 * @author Ryan McCartney 12545378
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "booking")
public class Booking 
{
    @XmlElement(name = "bookingID")
    String bookingID;
    @XmlElement(name = "username")
    String username;
    @XmlElement(name = "userID")
    String userID;
    @XmlElement(name = "flightID")
    String flightID;
    @XmlElement(name = "departureDate")
    String departureDate;
    @XmlElement(name = "returnDate")
    String returnDate;
    @XmlElement(name = "origin")
    String origin;
    @XmlElement(name = "destination")
    String destination;
    @XmlElement(name = "flightType")
    String flightType;
    @XmlElement(name = "price")
    double price;
    @XmlElement(name = "seat")
    int seat;
    @XmlElement(name = "description")
    String description;
    
    
    public Booking()
    {
        super();
    }
    
    public Booking(String bookingID, String userID, String flightID)
    {
        super();
        this.bookingID = bookingID;
        this.userID = userID;
        this.flightID = flightID;
    }
    
    public Booking(String bookingID, String username, String userID, String flightID, String departureDate, String returnDate, String origin, String destination, String flightType, double price, int seat, String description) {
        this.bookingID = bookingID;
        this.username = username;
        this.userID = userID;
        this.flightID = flightID;
        this.departureDate = departureDate;
        this.returnDate = returnDate;
        this.origin = origin;
        this.destination = destination;
        this.flightType = flightType;
        this.price = price;
        this.seat = seat;
        this.description = description;
    }

    @Override
    public String toString() 
    {
        return "Booking{" + "bookingID=" + bookingID + ", userID=" + userID + ", flightID=" + flightID + '}';
    }
    
    public boolean isBooking(String bookingID) 
    {
        return this.bookingID.equals(bookingID);
    }
    
    public boolean bookingIsByUser(String userID)
    {
        return this.userID.equals(userID);
    }
    public String getUserID() 
    {
        return userID;
    }

    public String getFlightID() 
    {
        return flightID;
    }
      
    public boolean bookedByUser(String userID) 
    {
        return this.userID.equals(userID);
    }
    
    public String getBookingID() 
    {
        return bookingID;
    }
}
