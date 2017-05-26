/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lit;

import java.io.Serializable;
import java.util.*;
import javax.xml.bind.annotation.*;

/**
 *
 * @author jacknes
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "users")
public class Users implements Serializable {
    @XmlElement(name = "user")
    ArrayList<User> customers = new ArrayList<>();
  
    //TODO: Login functionality, return type the user or null
    //      Does the user exist
    //      Add user
    //      Remove user
    
    
    public Users() 
    {
        super();
    }
    
    
    public User login (String email, String password)
    {
        for (User customer : customers) 
        {
            if (customer.login(email,password))
                return customer;   
        }
        return null;
    }
    
    public String removeUser (String email) 
    {
        User userToRemove = getUser(email);
        if (userToRemove !=  null) 
        {
            customers.remove(userToRemove);
            return ("user: " + email + " has been removed");
        }
        else 
            return ("user: " + email + " not found");
            
    }
    
    public User getUser (String email) 
    {
        for (User user : customers)
            if (user.isUser(email))
                return user;
        return null;
    }
    
    public boolean addUser(String name, String email, String password, String dob) 
    {
        if (!isEmailAlreadyUsed(email)){
            User user = new User(getRandomUserIDUnique(), name, email, password, dob);
            customers.add(user);
            return true;
        }
        return false;
    }
    
    public ArrayList<User> getUsers ()
    {
        return customers;
    }
    
    
    
    private boolean isEmailAlreadyUsed(String email) {
        for(User user : customers) 
            if (user.getEmail().equals(email))
                return false;
        return true;
    }
    
    
    public String getRandomUserIDUnique() 
    {
        Random randomGenerator = new Random(); 
        boolean isUnique = false;
        int randomID = randomGenerator.nextInt(999);
        String id = "" + randomID;;
        while(isUnique == false) 
        {
            isUnique = true;   
            randomID = randomGenerator.nextInt(999);
            id = "" + randomID;
            for (User user : customers) 
            {
                if (id.equals(user.getUserID()))
                    isUnique = false;
            }
       } 
       
       return id;
    }
    

}
