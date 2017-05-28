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
import lit.BookingApplication;

/**
 *
 * @author Ryan McCartney 12545378
 */

//To use: http://localhost:8080/FlyHigh/rest/flightService/flights
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
    public Flights getFilteredFlights(@QueryParam("customerName") String customerName, 
            @QueryParam("flightStatus") boolean flightStatus, 
            @QueryParam("numOfFlights") int numOfFlights) throws JAXBException, IOException
    {
        FlightController flightController = getFlightController();
        ArrayList<Flight> allFlights = flightController.getFlights().getFlights();
        BookingApplication bookingController = getBookingController();
        
        Flights filteredFlights = new Flights();
        
        filteredFlights = flightController.getFlightsWithQueryParam(bookingController, customerName, flightStatus, numOfFlights, allFlights, filteredFlights);
        
        return filteredFlights;
    }
}
