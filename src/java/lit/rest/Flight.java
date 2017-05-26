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
}