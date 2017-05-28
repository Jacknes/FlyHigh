/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lit.rest;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.xml.bind.JAXBException;
import lit.FlightController;
import lit.Flight;
import lit.Flights;
import lit.Booking;
import lit.Bookings;
import lit.BookingApplication;

/**
 *
 * @author Ryan McCartney 12545378
 */
@Path("/flightService")
public class FlightService 
{
    @Context
    private ServletContext application;
    
    private FlightController getFlightController() throws JAXBException, IOException
    {
        synchronized (application)
        {
            FlightController flightController = (FlightController)application.getAttribute("flightController");
            if (flightController == null)
            {
                flightController = new FlightController();
                flightController.setFilePath(application.getRealPath("WEB-INF/flights.xml"));
                application.setAttribute("flightController", flightController);
            }
            return flightController;
        }
    }
    
    private BookingApplication getBookingController() throws JAXBException, IOException
    {
        synchronized (application)
        {
            BookingApplication bookingController = (BookingApplication)application.getAttribute("bookingApplication");
            if (bookingController == null)
            {
                bookingController = new BookingApplication();
                bookingController.setFilePath(application.getRealPath("WEB-INF/bookings.xml"));
                application.setAttribute("bookingApplication", bookingController);
            }
            return bookingController;
        }
    }
    
    @Path("flights")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public Flights getFlights() throws JAXBException, IOException
    {
        FlightController flightController = getFlightController();
        return flightController.getFlights();
    }
    
    @Path("flights/{userID}")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public Flight getFlight(@PathParam("userID") String userID) throws JAXBException, IOException
    {
        FlightController flightController = getFlightController();
        ArrayList<Flight> allFlights = flightController.getFlights().getFlights();
        BookingApplication bookingController = getBookingController();
        
//        ArrayList<Booking> allBookings = bookingController.getBookings().getBookings();
        Booking ourUserBooking = bookingController.getBookings().getBookingForUserID(userID);
        
        for (Flight flight : allFlights)
        {
            if (flight.getFlightID().equals(ourUserBooking.getFlightID()))
                return flight;
        }
        return null;
    }
      
//    @Path("flights/filterFlights")
//    @GET
//    @Produces(MediaType.APPLICATION_XML)
//    public Flights getFilteredFlights(/*QueryParams*/) throws JAXBException, IOException
//    {
//        // Return the flights according to filters (the QueryParams).
//        // Need to access multiple different classes to do so - use of helper methods required
//        
//    }
    
}
