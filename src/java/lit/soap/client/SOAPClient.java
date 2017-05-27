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

import java.io.IOException;
import java.util.Scanner;
import javax.xml.bind.JAXBException;
import lit.*;

/**
 *
 * @author jacknes
 */
public class SOAPClient 
{
    User activeUser;
    Scanner reader = new Scanner(System.in);
    //SOAP_Service locator;
    //SOAP soap;
    public static void main(String[] args) throws JAXBException, IOException 
    {
        new SOAPClient().use();
    }
    
    public SOAPClient() 
    {
        System.out.println("Welcome to the SOAP client for FlyHigh");
        System.out.println("Type ? at any time to get help");
        activeUser = null;
        //locator = new SOAP_Service();
        //soap = locator.getSOAPPort();
    }

    public void use() throws JAXBException, IOException 
    {
        User user = null;

        char option;
        while (!((option = readOption()) == 'x')) 
        {
            switch(option) 
            {
                case('u'): loginLogout(); break;
                case('l'): listings(); break;
                case('b'): bookings(); break;
                case('f'): flights(); break;
                default: help("m"); break;
            } 
        }

    }
    
    private void loginLogout() throws JAXBException, IOException 
    {
        if (activeUser != null) {
            logout();
        } else {
            login(readEmail(), readPassword());
        }
    }
    
    private User login(String email, String password) throws JAXBException, IOException 
    {
        return getUser(email, password);
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
    
    private void flights() 
    {
        findFlights();
    }
    
    private void findFlights() 
    {
        
    }
    

    private User getUser(String email, String password) throws JAXBException, IOException
    {
        //User user = soap.login(email, password);
        return null;
    }
    
    private char readOption() 
    {
        System.out.print("Menu Option (): ");
        return reader.nextLine().charAt(0);
    }
    
    private String readEmail() 
    {
        System.out.print("Email: ");
        return reader.nextLine();
    }
    
    private String readPassword() 
    {
        System.out.print("Password: ");
        return reader.nextLine();
    }
    
    private void help(String context) 
    {
        
    }

}
