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
 * @author Jack Pascoe
 */
public class FlightController 
{
    private String filePath; //file path to xml
    private Flights flights; //flights object
    
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
    { //returns flights based on params
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
     
     public Flights getFlightsWithQueryParam(BookingApplication bookingController, //gets flights based on params, not all required
             String customerName, boolean flightStatus, int numOfFlights,
             ArrayList<Flight> allFlights, Flights filteredFlights
     ) throws JAXBException, IOException
     {
        // If no queries are specified 
        //ie. all are null/false/0 for respective types of string/boolean/int
        if (customerName == null
                && flightStatus == false
                && numOfFlights == 0)
        {
            return this.getFlights();
        }
        else
        {
            // List to put filtered results in
            ArrayList<Flight> filteredFlightList = new ArrayList<>();
            Booking ourUserBooking = null;
            if (customerName != null)
                // If we have a customer name specified, get the booking for that user (contains flightID)
                ourUserBooking = bookingController.getBookings().getUserBooking(customerName);   
            
            
            for (Flight flight : allFlights)
            {
                // Flight has available seats and specified flightStatus = available
                if (flight.getSeats() > 0 && flightStatus)
                {
                    if (ourUserBooking != null)
                        if (flight.getFlightID().equals(ourUserBooking.getFlightID()))
                            filteredFlightList.add(flight);
                }
                // Flight has no available seats and specified flightStatus = unavailable
                else if (flight.getSeats() == 0 && !flightStatus)
                {
                    if (ourUserBooking != null)
                        if (flight.getFlightID().equals(ourUserBooking.getFlightID()))
                            filteredFlightList.add(flight);
                }
                
                // No customer specified? Add the flight
                if (ourUserBooking == null)
                    filteredFlightList.add(flight);
            }
            
            // Requested a constrained list size
            if (numOfFlights != 0)
            {
                // Size constraint is smaller than our full list
                if (numOfFlights <= filteredFlightList.size())
                    for (Flight flight : filteredFlightList.subList(0, numOfFlights))
                        filteredFlights.addFlight(flight);
                // Size constraint is larger
                else
                    for (Flight flight : filteredFlightList)
                        filteredFlights.addFlight(flight);
            }
            // No requested list size constraint
            else
                if (!filteredFlightList.isEmpty())
                {
                    for (Flight flight : filteredFlightList)
                        filteredFlights.addFlight(flight);
                }
        }
        return filteredFlights;
     }
    
    public void setFilePath(String filePath) throws JAXBException, FileNotFoundException, IOException  //unmarshaller
    {
        // Create the unmarshaller
         JAXBContext jc = JAXBContext.newInstance(Flights.class);
         Unmarshaller u = jc.createUnmarshaller();

         // Now unmarshal the object from the file
         FileInputStream fin = new FileInputStream(filePath);
         flights = (Flights)u.unmarshal(fin); // This loads the "shop" object
         fin.close();    
    }
    
    public void updateXML(Flights flights) throws PropertyException, JAXBException, FileNotFoundException  //marshaller
    {
        JAXBContext jc = JAXBContext.newInstance(Flights.class);
        Marshaller m = jc.createMarshaller();     
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);  
        m.marshal(flights, new FileOutputStream("WEB-INF/flights.xml"));    
    }
    
    public void addFlight(Flight flight) throws JAXBException, PropertyException, FileNotFoundException, IOException //adds a flight
    {
        if(flight != null)
            flights.addFlight(flight);
        
        updateXML(this.flights);
    }
}
