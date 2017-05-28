/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lit;

import java.util.*;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author jacknes
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
    @XmlElement(name = "bookingTime")
    String bookingDate;
    
    public Booking(String bookingID, String userID, String flightID, String bookingDate) 
    {
        this.bookingID = bookingID;
        this.userID = userID;
        this.flightID = flightID;
        this.bookingDate = bookingDate;
    }
    
    public Booking() 
    {
        super();
    }

    @Override
    public String toString() {
        return "Booking{" + "bookingID=" + bookingID + ", userID=" + userID + ", flightID=" + flightID + ", bookingDate=" + bookingDate + '}';
    }
    
    public boolean isBooking(String bookingID) {
        return this.bookingID.equals(bookingID);
    }
    
    public boolean bookedByUser(String userID) {
        return this.userID.equals(userID);
    }
    
    public String getBookingID() 
    {
        return bookingID;
    }
}
