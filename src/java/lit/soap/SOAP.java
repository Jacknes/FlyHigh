/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lit.soap;

import java.io.IOException;
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
    public User login(@WebParam(name = "email") String email, @WebParam(name = "password") String password) throws JAXBException, IOException {
        UserApplication userApp = getUserApp();
        Users users = userApp.getUsers();
        return users.login(email, password);
    }
    
    
    @WebMethod(operationName = "createBooking")
    public String createBooking(@WebParam(name = "userID") String userID, @WebParam(name = "flightID") String flightID) 
    {
        //TODO: Finalise parameters of this method and write it. Add authentication.
        
        String bookingID = "0";
        return bookingID;       
    }
    
    @WebMethod(operationName = "cancelBooking")
    public void cancelBooking(@WebParam(name = "userID") String userID, @WebParam(name = "bookingID") String bookingID) 
    {
        //cancel flight;
        
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
    
    
    @WebMethod(operationName = "createBooking")
    public void createBooking() {
        
    }

    
    private UserApplication getUserApp() throws JAXBException, IOException 
    {
        UserApplication userApp = new UserApplication();
        userApp.setFilePath("WEB-INF/users.xml");
        return userApp;
    }
}
