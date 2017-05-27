/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lit;

import java.util.Date;
import javax.xml.bind.annotation.*;

/**
 *
 * @author jacknes
 * @author Ryan McCartney 12545378
 */

@XmlRootElement
@XmlAccessorType(XmlAccessType.PROPERTY)
public class Flight 
{
    @XmlElement(name = "flightID")
    String flightID;
    @XmlElement(name = "departureDate")
    Date departureDate;
    @XmlElement(name = "returnDate")
    Date returnDate;
    @XmlElement(name = "price")
    Double price;
    @XmlElement(name = "seats")
    int seats;
    @XmlElement(name = "origin")
    String origin;
    @XmlElement(name = "destination")
    String destination;
    @XmlElement(name = "flightType")
    String flightType;
    
    public Flight() 
    {
        super();
    }
    
    public Flight(String flightID, Date departureDate, Date returnDate, Double price, int seats, String origin, String destination, String flightType) 
    {
        super();
        this.flightID = flightID;
        this.departureDate = departureDate;
        this.returnDate = returnDate;
        this.price = price;
        this.seats = seats;
        this.origin = origin;
        this.destination = destination;
        this.flightType = flightType;
    }

    @Override
    public String toString() {
        return "Flight{" + "flightID=" + flightID + ", departureDate=" + departureDate + ", returnDate=" + returnDate + ", price=" + price + ", seats=" + seats + ", origin=" + origin + ", destination=" + destination + ", flightType=" + flightType + '}';
    }
    
    public String getFlightID() 
    { 
        return flightID;
    }
    
    public int getSeats() 
    { 
        return seats; 
    }
    
    public boolean flightStatus() 
    {
        return seats > 0;
    }
    
    public boolean isFlight (String flightID)
    {
        return flightID.equals(this.flightID);
    }
    
}
