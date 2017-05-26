/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lit;

import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author jacknes
 */
public class Bookings implements Serializable{
    ArrayList<Booking> bookings = new ArrayList<>();
  
    //TODO: Login functionality, return type the user or null
    //      Does the user exist
    //      Add user
    //      Remove user
    
    
    public Bookings() 
    {
        super();
    }
    
//    
//    public User login (String email, String password)
//    {
//        for (User customer : customers) 
//        {
//            if (customer.login(email,password))
//                return customer;   
//        }
//        return null;
//    }
    
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
    
}
