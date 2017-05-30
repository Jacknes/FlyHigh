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
import lit.*;

/**
 *
 * @author jacknes
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "bookings")
public class Bookings implements Serializable{
    @XmlElement(name = "booking")
    ArrayList<Booking> bookings = new ArrayList<>();
    
    public Bookings() 
    {
        super();
    }
    
    
    public void removeBooking (String bookingID)  //removes a booking based on id
    {
        Booking bookingToRemove = getBooking(bookingID);
        if (bookingToRemove !=  null) 
        {
            bookings.remove(bookingToRemove);
            
        }
    }
    
    private Booking getBooking (String bookingID) //gets booking based on ID
    {
        for (Booking booking : bookings)
            if (booking.isBooking(bookingID))
                return booking;
        return null;
    }
    
    public void addBooking(Booking booking) //adds a booking
    {
        bookings.add(booking);
    }
    
    public ArrayList<Booking> getBookings () //returns a list of bookings
    {
        return bookings;
    }
  
    public Booking getUserBooking(String userID) //gets a users booking
    {
        for (Booking booking : bookings)
            if (booking.bookedByUser(userID))
                return booking;
        return null;
    }
    
    public Booking getBookingByID(String bookingID) 
    {
        for (Booking booking : bookings)
            if (booking.isBooking(bookingID))
                return booking;
        return null;
    }
    
    public String getRandomBookingIDUnique() //generates a unique booking ID
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
    
    public void deleteBookingsForUser(String userID) //deletes a users booking
    {
        Booking bookingToDelete = getUserBooking(userID);
        if (bookingToDelete != null) 
        {
            bookings.remove(bookingToDelete);
            addSeatBackToFlight(bookingToDelete.getFlightID());
        }

    }
    
    private void addSeatBackToFlight(String flightID) ///adds seats back to a flight
    {
        FlightController flightController = new FlightController();
        Flights flights = flightController.getFlights();
        Flight flightToAddSeat = flights.getFlight(flightID);
        if (flightToAddSeat != null) 
        {
            flightToAddSeat.changeSeats(1);
            flightController.setFlights(flights);
        }
        
    }
}
