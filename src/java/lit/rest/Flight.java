import javax.xml.bind.annotation.*;
/**
 *
 * @author Ryan McCartney 12545378
 */

@XmlRootElement
@XmlAccessorType(XmlAccessType.PROPERTY)
public class Flight 
{
    private String userID;
    private boolean flightStatus;
    private int seats;
    private int numOfFlights;
    private int numOfCustomers;
    
    public Flight()
    {
        super();
    }
    
    public Flight(String userID, boolean flightStatus, int seats, int numOfFlights, int numOfCustomers)
    {
        super();
        this.userID = userID;
        this.flightStatus = flightStatus;
        this.seats = seats;
        this.numOfFlights = numOfFlights;
        this.numOfCustomers = numOfCustomers;
    }
    
    @XmlElement
    public String getUserID() 
    {
        return userID;
    }

    public void setUserID(String userID) 
    {
        this.userID = userID;
    }
    
    @XmlElement
    public boolean isFlightStatus() 
    {
        return flightStatus;
    }

    public void setFlightStatus(boolean flightStatus) 
    {
        this.flightStatus = flightStatus;
    }
    
    @XmlElement
    public int getSeats() 
    {
        return seats;
    }

    public void setSeats(int seats) 
    {
        this.seats = seats;
    }
    
    @XmlElement
    public int getNumOfFlights() 
    {
        return numOfFlights;
    }

    public void setNumOfFlights(int numOfFlights) 
    {
        this.numOfFlights = numOfFlights;
    }
    
    @XmlElement
    public int getNumOfCustomers() 
    {
        return numOfCustomers;
    }

    public void setNumOfCustomers(int numOfCustomers) 
    {
        this.numOfCustomers = numOfCustomers;
    }
    
    
    // method for searching each flight.
    // Requires class Flights
    
}