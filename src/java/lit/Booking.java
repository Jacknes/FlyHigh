/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lit;

import java.util.*;

/**
 *
 * @author jacknes
 */
public class Booking 
{
    String bookingID;
    String userID;
    String flightID;
    Date bookingDate;
    
    public Booking(String bookingID, String userID, String flightID, Date bookingDate) 
    {
        this.bookingID = bookingID;
        this.userID = userID;
        this.flightID = flightID;
        this.bookingDate = bookingDate;
    }
    
    public boolean isBooking(String bookingID) {
        return this.bookingID.equals(bookingID);
    }
}
