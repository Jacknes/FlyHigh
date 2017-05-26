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
    
    @WebMethod(operationName = "login")
    public User login(@WebParam(name = "email") String email, @WebParam(name = "password") String password) throws JAXBException, IOException {
        UserApplication userApp = getUserApp();
        Users users = userApp.getUsers();
        return users.login(email, password);
    }
    
    private UserApplication getUserApp() throws JAXBException, IOException 
    {
        UserApplication userApp = new UserApplication();
        userApp.setFilePath("WEB-INF/users.xml");
        return userApp;
    }
}
