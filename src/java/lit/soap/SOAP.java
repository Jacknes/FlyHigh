/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

 /*
Create a SOAP web service that allows customers to: 
    a- Login/Logout
    b- Create a listing
    c- Create a booking
    d- View a list of flights, with parameters as above (using SOAP rather than REST)
    e- Close a listing
    f- Cancel a booking (Additional);
User authentication information (for flight customers) must be provided for creating and closing listings, 
as only flight customers have permission to perform these operations. Retrieving a list of flights can be done without authentication. 
If the username and password provided are incorrect, the operation should not be performed. If successful, the method for creating a listing 
should return the ID number of the listing just created. For the method to close a listing, if the specified listing to be closed 
does not belong to the authenticated person (i.e. it was a listing created by another person), then the operation should not be performed. 
Note: for this assignment, it is adequate to pass the username and password in an unencrypted form as a SOAP message parameter.
 */
package lit.soap;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.xml.bind.JAXBException;
import lit.*;

/**
 *
 * @author jacknes
 */
@WebService(serviceName = "SOAP")
public class SOAP {
    
    @WebMethod(operationName = "login")
    public User login(@WebParam(name = "email") String email, @WebParam(name = "password") String password) throws JAXBException, IOException 
    {
        UserApplication userApp = getUserApp();
        Users users = userApp.getUsers();
        return users.login(email, password);
    }
    
    
    @WebMethod(operationName = "createBooking")
    public void createBooking(@WebParam(name = "email") String email, @WebParam(name = "password") String password, @WebParam(name = "userID") String userID, @WebParam(name = "flightID") String flightID) throws JAXBException, IOException 
    {   
        User user = login(email, password);
        if (user != null) 
        {
            if (user.getUserID().equals(userID) && !flightID.equals("0")) 
            {
                BookingApplication bookingApp = getBookingApp();
                String date = new SimpleDateFormat("dd-MM-yyyy").format(new Date());
                bookingApp.addBooking(userID, flightID, date);
                Bookings bookings = bookingApp.getBookings();
                bookingApp.setBookings(bookings);
            }
        }
    }
    
    @WebMethod(operationName = "cancelBooking")
    public void cancelBooking(@WebParam(name = "email") String email, @WebParam(name = "password") String password, @WebParam(name = "userID") String userID, @WebParam(name = "bookingID") String bookingID) throws JAXBException, IOException 
    {
        User user = login(email, password);
        if (user != null) 
        {
            if (user.getUserID().equals(userID)) 
            {
                BookingApplication bookingApp = getBookingApp();
                Bookings bookings = bookingApp.getBookings();
                bookings.removeBooking(bookingID);
                bookingApp.setBookings(bookings);
            }
        }
        //cancel booking;
        
    }
    
    @WebMethod(operationName = "createListing")
    public String createListing(@WebParam(name = "userID") String userID, @WebParam(name = "flightID") String flightID) 
    {
        //TODO: Finalise parameters of this method and write it. Add authentication. 
  
        String listingID = "0";
        return listingID;       
    }
    
    
    @WebMethod(operationName = "closeListing")
    public void closeListing(@WebParam(name = "userID") String userID, @WebParam(name = "listingID") String listingID) 
    {
        //close the listing;
    }
    
    @WebMethod(operationName = "viewFlights")
    public void viewFlights(@WebParam(name = "username") String username, @WebParam(name = "status") boolean status, @WebParam(name = "numofflights") int numofflights)  
    {
        //return flights;
    }

 
    @WebMethod(operationName = "fetchUser")
    public User fetchUser(@WebParam(name = "email") String email) throws JAXBException, IOException 
    {
        UserApplication userApp = getUserApp();
        Users users = userApp.getUsers();
        return users.getUser(email);
    }
     
    private UserApplication getUserApp() throws JAXBException, IOException 
    {
        UserApplication userApp = new UserApplication();
        userApp.setFilePath("WEB-INF/users.xml");
        return userApp;
    }
    
    private BookingApplication getBookingApp() throws JAXBException, IOException 
    {
        BookingApplication bookingApp = new BookingApplication();
        bookingApp.setFilePath("WEB-INF/bookings.xml");
        return bookingApp;
    }
    
    private FlightController getFlightController() throws JAXBException, IOException 
    {
        FlightController flightController = new FlightController();
        flightController.setFilePath("WEB-INF/flights.xml");
        return flightController;
    }
}
