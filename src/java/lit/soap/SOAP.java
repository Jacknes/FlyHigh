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
import java.util.ArrayList;
import java.util.Date;
import javax.annotation.Resource;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.servlet.ServletContext;
import javax.xml.bind.JAXBException;
import javax.xml.ws.WebServiceContext;
import javax.xml.ws.handler.MessageContext;
import lit.*;

/**
 *
 * @author jacknes
 */
@WebService(serviceName = "SOAP")
public class SOAP {
    
    @Resource
    private WebServiceContext context;
    
    @WebMethod(operationName = "login") //done
    public User login(@WebParam(name = "email") String email, @WebParam(name = "password") String password) throws JAXBException, IOException 
    {
        UserApplication userApp = getUserApp();
        Users users = userApp.getUsers();
        return users.login(email, password);
    }
    
    
    @WebMethod(operationName = "createBooking") //check that the user doesn't already have a booking. 
    public void createBooking(@WebParam(name = "email") String email, @WebParam(name = "password") String password, @WebParam(name = "userID") String userID, @WebParam(name = "flightID") String flightID) throws JAXBException, IOException 
    {   
        User user = login(email, password);
        if (user != null) 
        {
            if (user.getUserID().equals(userID) && !flightID.equals("0")) 
            {
                BookingApplication bookingApp = getBookingApp();
                bookingApp.addBooking(userID, flightID);
                Bookings bookings = bookingApp.getBookings();
                bookingApp.setBookings(bookings);
            }
        }
    }
    
    @WebMethod(operationName = "cancelBooking") //done
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
    
    
// public Flights getFlightsWithQueryParam(BookingApplication bookingController, 
//             String customerName, boolean flightStatus, int numOfFlights,
//             ArrayList<Flight> allFlights, Flights filteredFlights
//     )
    @WebMethod(operationName = "viewFlights")
    public ArrayList<Flight> viewFlights(@WebParam(name = "username") String username, @WebParam(name = "status") boolean status, @WebParam(name = "numofflights") int numofflights) throws JAXBException, IOException  
    {
        //ArrayList<Flight> results = new ArrayList();
        FlightController flightController = getFlightController();
        BookingApplication bookingApp = new BookingApplication();
        Flights flights = flightController.getFlightsWithQueryParam(bookingApp, username, status, numofflights, null, null);
        
        //flights = flightController.getFlights();
        ArrayList<Flight> flightList = flights.getFlights();
        
        //return flights;
        return flightList;
    }
    @WebMethod(operationName = "searchForFlights")
    public Flights searchForFlights(@WebParam(name = "customerName") String customerName, @WebParam(name = "status") boolean flightStatus, @WebParam(name = "numOfFlights") int numOfFlights,
                                @WebParam(name = "allFlights") ArrayList<Flight> allFlights, @WebParam(name = "filteredFlights") Flights filteredFlights) throws JAXBException, IOException 
    {
        BookingApplication bookingApp = getBookingApp();
        FlightController flightController = getFlightController();
        Flights flights = flightController.getFlightsWithQueryParam(bookingApp, customerName, flightStatus, numOfFlights, allFlights, filteredFlights);
        return flights;
    }

 
    @WebMethod(operationName = "fetchUser")
    public User fetchUser(@WebParam(name = "email") String email) throws JAXBException, IOException 
    {
        UserApplication userApp = getUserApp();
        Users users = userApp.getUsers();
        return users.getUser(email);
    }
     
//    private UserApplication getUserApp() throws JAXBException, IOException 
//    {
//        UserApplication userApp = new UserApplication();
//        userApp.setFilePath("WEB-INF/users.xml");
//        return userApp;
//    }
    
     @WebMethod
    private UserApplication getUserApp() throws JAXBException, IOException {
        // This needs to be local variable in your "getDiaryApp" method
// It will not work if declared as a field (since field initializers
// are executed before dependency injection takes place).
    ServletContext application = (ServletContext)context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
  // The web server can handle requests from different clients in parallel.
  // These are called "threads".
  //
  // We do NOT want other threads to manipulate the application object at the same
  // time that we are manipulating it, otherwise bad things could happen.
  //
  // The "synchronized" keyword is used to lock the application object while
  // we're manpulating it.
  synchronized (application) {
   UserApplication userApp = (UserApplication)application.getAttribute("userApp");
   if (userApp == null) {
    userApp = new UserApplication();
    userApp.setFilePath(application.getRealPath("WEB-INF/users.xml"));
    application.setAttribute("userApp", userApp);
   }
   return userApp;
  }
 }
    
    
      @WebMethod
    private BookingApplication getBookingApp() throws JAXBException, IOException {
        // This needs to be local variable in your "getDiaryApp" method
// It will not work if declared as a field (since field initializers
// are executed before dependency injection takes place).
    ServletContext application = (ServletContext)context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
  // The web server can handle requests from different clients in parallel.
  // These are called "threads".
  //
  // We do NOT want other threads to manipulate the application object at the same
  // time that we are manipulating it, otherwise bad things could happen.
  //
  // The "synchronized" keyword is used to lock the application object while
  // we're manpulating it.
  synchronized (application) {
   BookingApplication bookingApp = (BookingApplication)application.getAttribute("bookingApp");
   if (bookingApp == null) {
    bookingApp = new BookingApplication();
    bookingApp.setFilePath(application.getRealPath("WEB-INF/bookings.xml"));
    application.setAttribute("bookingApp", bookingApp);
   }
   return bookingApp;
  }
 }
    
//    private BookingApplication getBookingApp() throws JAXBException, IOException 
//    {
//        BookingApplication bookingApp = new BookingApplication();
//        bookingApp.setFilePath("WEB-INF/bookings.xml");
//        return bookingApp;
//    }
    
     @WebMethod
    private FlightController getFlightController() throws JAXBException, IOException {
        // This needs to be local variable in your "getDiaryApp" method
// It will not work if declared as a field (since field initializers
// are executed before dependency injection takes place).
    ServletContext application = (ServletContext)context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
  // The web server can handle requests from different clients in parallel.
  // These are called "threads".
  //
  // We do NOT want other threads to manipulate the application object at the same
  // time that we are manipulating it, otherwise bad things could happen.
  //
  // The "synchronized" keyword is used to lock the application object while
  // we're manpulating it.
  synchronized (application) {
   FlightController flightController = (FlightController)application.getAttribute("flightController");
   if (flightController == null) {
    flightController = new FlightController();
    flightController.setFilePath(application.getRealPath("WEB-INF/flights.xml"));
    application.setAttribute("flightController", flightController);
   }
   return flightController;
  }
 }
}
