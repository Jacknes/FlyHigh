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
@XmlRootElement
@XmlAccessorType(XmlAccessType.PROPERTY)
public class Booking 
{
    @XmlElement(name = "bookingID")
    String bookingID;
    @XmlElement(name = "userID")
    String userID;
    @XmlElement(name = "flightID")
    String flightID;
    @XmlElement(name = "bookingDate")
    Date bookingDate;
    
    public Booking()
    {
        super();
    }
    
    public Booking(String bookingID, String userID, String flightID, Date bookingDate) 
    {
        super();
        this.bookingID = bookingID;
        this.userID = userID;
        this.flightID = flightID;
        this.bookingDate = bookingDate;
    }
    
    public boolean isBooking(String bookingID) {
        return this.bookingID.equals(bookingID);
    }
    
    public String getBookingID() {
        return this.bookingID;
    }

    public String getUserID() {
        return userID;
    }

    public String getFlightID() {
        return flightID;
    }
}
