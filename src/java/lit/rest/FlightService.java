/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lit.rest;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.xml.bind.JAXBException;
import lit.FlightController;
import lit.Flight;
import lit.Flights;

/**
 *
 * @author Ryan McCartney 12545378
 */
@Path("/flightService")
public class FlightService 
{
    @Context
    private ServletContext application;
    
    // need to add the equivalent of "DiaryApplication". Can lit.FlightController work?
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
    
    @Path("flights")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public Flights getFlights() throws JAXBException, IOException
    {
        FlightController flightController = getFlightController();
        return flightController.getFlights();
    }
}
