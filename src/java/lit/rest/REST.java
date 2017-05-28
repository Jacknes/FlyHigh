package lit.rest;
//import javax.ws.rs.*;
//import javax.ws.rs.core.*;
import lit.Flight;

/**
 *
 * @author Ryan McCartney 12545378
 */
//@Path("/")
public class REST 
{
    
//    @Path("hello")
//    @GET
//    @Produces(MediaType.TEXT_PLAIN)
    public String hello()
    {
        return "Hello, world!";
    }
    
    /* @Path("flights")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public Flight flight(@QueryParam("customerName") String customerName, 
            @QueryParam("flightStatus") boolean flightStatus, 
            @QueryParam("numofseats") int numofseats, 
            @QueryParam("numofflights") int numofflights, 
            @QueryParam("numofcustomers") int numofcustomers)
    {
        // Create a list of Flight objects contain objects that apply to these arguments
        // If no valid arguments, return all flights
        // See REST labs for example (Tasks 3-5) 
    
        Flight flight = new Flight(params);
        return flight;
    }*/
    
    
}
