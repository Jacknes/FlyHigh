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
package lit.soap.client;

import java.io.Console;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;
import javax.xml.bind.JAXBException;
import lit.*;

//public static void main(String[] args) 
//    {
//        DiaryApp diaryApp = new DiaryApp();
//        DiarySOAP diarySOAP = diaryApp.getDiarySOAPPort();
//        String email;
//        User user;
//        boolean found = true;
//        do {
//            email = readEmail();
//            user = diarySOAP.fetchUser(email);
//            if (user != null){
//                System.out.println("Found " + user.getName());
//            } else {
//                found = false;
//                System.out.println("No such user found.");
//            }  
//         
//        } while(found == true);
//        
//        
//    }

/**
 *
 * @author jacknes
 */
public class SOAPClient 
{
    User activeUser;
    Scanner reader = new Scanner(System.in);
    SOAP_Service locator;
    SOAP soap;
    public static void main(String[] args) throws JAXBException, IOException, IOException_Exception, JAXBException_Exception 
    {
        new SOAPClient().use();
    }
    
    public SOAPClient() 
    {
        System.out.println("Welcome to the SOAP client for FlyHigh");
        System.out.println("Type ? at any time to get help");
        activeUser = null;
        locator = new SOAP_Service();
        soap = locator.getSOAPPort();
    }

    public void use() throws JAXBException, IOException, IOException_Exception, JAXBException_Exception 
    {
        User user = null;

        char option;
        while (!((option = readOption()) == 'x')) 
        {
            switch(option) 
            {
                case('u'): user = loginLogout(); break;
                case('l'): listings(); break;
                case('b'): bookings(); break;
                case('f'): flights(); break;
                default: help("m"); break;
            } 
        }

    }
    
    private User loginLogout() throws JAXBException, IOException, IOException_Exception, JAXBException_Exception
    {
        if (activeUser != null) {
            logout();
            return null;
        } else {
            User user = login(readEmail(), readPassword());
            return user;
        }
    }
    
    private User login(String email, String password) throws JAXBException, IOException, IOException_Exception, JAXBException_Exception
    {
        User user = getUser(email, password);
        if (user != null)
            System.out.println("Logged in as " + user.getEmail());
        else 
            System.out.println("Login failed");
        return user;
    }
    
    private void logout() 
    {
        //Set active user to null;
    }
    
    private void listings() 
    {
        createListing();
        closeListing();
    }
    
    private void bookings() 
    {
        createBooking();
        cancelBooking();
    }
    
    private void createListing() 
    {
        
    }
    
    private void closeListing() 
    {
        
    }
    
    private void createBooking() 
    {
        
    }
    
    private void cancelBooking() 
    {
        
    }
    
    private void flights() throws IOException_Exception, JAXBException_Exception 
    {
        System.out.println("To search for a flight, enter each parameter as requested, or leave them blank if you wish to not");
        System.out.println("search by that parameter. Dates are formatted YYYY-MM-DD, enter them as such please.");
        ArrayList<Flight> allFlights = new ArrayList();
        Flights filteredFlights = new Flights();
        Flights flights = findFlights(readName(), readStatus(), readNumberOfFlights(), allFlights, filteredFlights);
        if (flights == null)
            System.out.println("No Flights found.");
        else 
            displayFlights(flights);
        
        
    }
    
//    (BookingApplication bookingController, 
//             String customerName, boolean flightStatus, int numOfFlights,
//             ArrayList<lit.Flight> allFlights, Flights filteredFlights
//     )
    private Flights findFlights(String customerName, boolean flightStatus, int numOfFlights,
                                ArrayList<Flight> allFlights, Flights filteredFlights) throws IOException_Exception, JAXBException_Exception 
    {
        return soap.searchForFlights(customerName, flightStatus, numOfFlights, allFlights, filteredFlights);
    }
    
    
    private void displayFlights(Flights flights) 
    {
        System.out.println("The flights found are: ");
        ArrayList<Flight> flightsList = (ArrayList<Flight>) flights.getFlight(); // fix
        for (Flight flight : flightsList) {
            System.out.println(flight.toString());
        }
    }
    

    private User getUser(String email, String password) throws JAXBException, IOException, IOException_Exception, JAXBException_Exception
    {
        User user = soap.login(email, password);
        return user;
    }
    
    private char readOption() 
    {
        System.out.print("Menu Option (): ");
        String answer = reader.nextLine();
        return answer.charAt(0);
    }
    
    private String readEmail() 
    {
        System.out.print("Email: ");
        return reader.nextLine();
    }
    
    private String readName() 
    {
        System.out.print("Name: ");
        return reader.nextLine();
    }
    
    private int readNumberOfFlights() 
    {
        System.out.print("Number of results: ");
        int num = Integer.parseInt(reader.nextLine());
        return num;
    }
    
    private boolean readStatus() 
    {
        System.out.print("Status (either true or false: ");
        String result = reader.nextLine();
        if (result.equals("false")) {
            return false;
        } else {
            return true;
        }
    }
            
    private String readPassword() 
    {
        System.out.print("Password: ");
        return reader.nextLine();
    }
    
    
    

    private void help(String context) 
    {
        if (context.equals("m")) 
        {
            System.out.println("u - Login and Logout");
            System.out.println("l - Create or close a listing");
            System.out.println("b - Create or cancel a booking");
            System.out.println("f - Search for flights");
        }
    }
    
    private String readDate(String type) 
    {
        System.out.print(type + " Date: ");
        return reader.nextLine();
    }

}
