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
public class SOAPClient {
    Scanner reader = new Scanner(System.in);

    public static void main(String[] args) 
    {
      
//        SOAP_Service locator = new SOAP_Service();
//        SOAP soap = locator.getSOAPPort();
//        /**
//         * Insert your code here *
//         */
    }
    
    public class SOAPUse {
    
    
        public SOAPUse() 
        {
            use();
        }
    private void use() 
    {
        System.out.println("Welcome to the SOAP client for FlyHigh");
        System.out.println("Type ? at any time to get help");
        User user = null;
        
        char option = ' ';
        while (!((option = readOption()) == 'x')) 
        {
            
        }
        
        
    }
    
//    public User getUser(String email, String password) throws JAXBException, IOException, IOException_Exception, JAXBException_Exception 
//    {
//        SOAP_Service locator = new SOAP_Service();
//        SOAP soap = locator.getSOAPPort();
//        User user = soap.login(email, password);
//        return user;
//    }
//    
    
    
    
        private char readOption () {
            System.out.print("Menu Option (): ");
            return reader.nextLine().charAt(0);
        }
    }
}
