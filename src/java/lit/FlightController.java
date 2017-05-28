/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lit;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.PropertyException;
import javax.xml.bind.Unmarshaller;

/**
 *
 * @author jacknes
 */
public class FlightController {
    private String filePath;
    private Flights flights;
    
    public FlightController() 
    {
        super();
    }
    
    public String getFilePath() 
    {
        return filePath;
    }

    public Flights getFlights() 
    {
        return flights;
    }

    public void setFlights(Flights flights) 
    {
        this.flights = flights;
    }
    
     public ArrayList<Flight> getFlightsFromParam(String departure, String destination, String deptDate, String returnDate, String type)  
    { 
        ArrayList<Flight> allFlights = flights.getFlights(); 
        ArrayList<Flight> matchingFlights = new ArrayList(); 
        for (Flight flight : allFlights)  
        { 
            if (flight.getOrigin().toLowerCase().equals(departure.toLowerCase())&& flight.getDestination().toLowerCase().equals(destination.toLowerCase()) && flight.getDepartureDate().toLowerCase().equals(deptDate.toLowerCase()) && flight.getReturnDate().toLowerCase().equals(returnDate.toLowerCase()) && flight.getFlightType().toLowerCase().equals(type.toLowerCase()))  
            { 
                matchingFlights.add(flight); 
            } 
        } 
        return matchingFlights; 
    }
    
    public void setFilePath(String filePath) throws JAXBException, FileNotFoundException, IOException 
    {
        // Create the unmarshaller
         JAXBContext jc = JAXBContext.newInstance(Flights.class);
         Unmarshaller u = jc.createUnmarshaller();

         // Now unmarshal the object from the file
         FileInputStream fin = new FileInputStream(filePath);
         flights = (Flights)u.unmarshal(fin); // This loads the "shop" object
         fin.close();    
    }
    
    public void updateXML(Flights flights) throws PropertyException, JAXBException, FileNotFoundException 
    {
        JAXBContext jc = JAXBContext.newInstance(Flights.class);
        Marshaller m = jc.createMarshaller();     
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);  
        m.marshal(flights, new FileOutputStream("WEB-INF/flights.xml"));    
    }
    
    public void addFlight(Flight flight) throws JAXBException, PropertyException, FileNotFoundException, IOException 
    {
        if(flight != null)
            flights.addFlight(flight);
        
        updateXML(this.flights);
    }
}
