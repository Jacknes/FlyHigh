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
    @XmlElement(name = "userID")
    String userID;
    @XmlElement(name = "flightID")
    String flightID;
    
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

    @Override
    public String toString() 
    {
        return "Booking{" + "bookingID=" + bookingID + ", userID=" + userID + ", flightID=" + flightID + '}';
    }
    
    public boolean isBooking(String bookingID) 
    {
        return this.bookingID.equals(bookingID);
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
