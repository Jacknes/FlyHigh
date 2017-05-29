/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lit;

import java.io.Serializable;
import java.util.ArrayList;
import javax.xml.bind.annotation.*;
import java.util.Random;

/**
 *
 * @author jacknes
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "bookings")
public class Bookings implements Serializable{
    @XmlElement(name = "booking")
    ArrayList<Booking> bookings = new ArrayList<>();
  
    //TODO: Login functionality, return type the user or null
    //      Does the user exist
    //      Add user
    //      Remove user
    
    
    public Bookings() 
    {
        super();
    }
    
    
    public void removeBooking (String bookingID) 
    {
        Booking bookingToRemove = getBooking(bookingID);
        if (bookingToRemove !=  null) 
        {
            bookings.remove(bookingToRemove);
        }
    }
    
    private Booking getBooking (String bookingID) 
    {
        for (Booking booking : bookings)
            if (booking.isBooking(bookingID))
                return booking;
        return null;
    }
    
    public void addBooking(Booking booking) 
    {
        bookings.add(booking);
    }
    
    public ArrayList<Booking> getBookings ()
    {
        return bookings;
    }
  
    public Booking getUserBooking(String userID) 
    {
        for (Booking booking : bookings)
            if (booking.bookedByUser(userID))
                return booking;
        return null;
    }
    
    public String getRandomBookingIDUnique() 
    {
        Random randomGenerator = new Random(); 
        boolean isUnique = false;
        int randomID = randomGenerator.nextInt(999);
        String id = "" + randomID;;
        while(isUnique == false) 
        {
            isUnique = true;   
            randomID = randomGenerator.nextInt(999);
            id = "" + randomID;
            for (Booking booking : bookings) 
            {
                if (id.equals(booking.getBookingID()))
                    isUnique = false;
            }
       } 
       
       return id;
    }
    
    public void deleteBookingsForUser(String userID) 
    {
        Booking bookingToDelete = getUserBooking(userID);
        bookings.remove(bookingToDelete);
    }
}
