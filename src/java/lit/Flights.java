/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lit;

import java.io.Serializable;
import java.util.*;
import javax.xml.bind.annotation.*;

/**
 *
 * @author Ryan McCartney 12545378
 */

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "flights")
public class Flights implements Serializable 
{
    @XmlElement(name = "flight")
    ArrayList<Flight> flights = new ArrayList<>();
    
    public Flights()
    {
        super();
    }
    
    public Flight getFlight(String flightID)
    {
        for (Flight flight : flights)
            if (flight.isFlight(flightID))
                return flight;
        return null;
    }
    
    public ArrayList<Flight> getFlights() 
    { 
        return flights; 
    }
    
    public void addFlight(Flight flight)
    {
        flights.add(flight);
    }
   
    public void changeSeats (String flightID, int change) 
    {
        for (Flight flight : flights)
            if (flight.isFlight(flightID)) 
            {
                flight.changeSeats(change);
            }
    }
    
}
