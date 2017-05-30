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
@XmlAccessorType(XmlAccessType.FIELD) //notations for unmarshalling and marshalling from xml
@XmlRootElement(name = "users")
public class Users implements Serializable {
    @XmlElement(name = "user")
    ArrayList<User> customers = new ArrayList<>(); 
  
    
    public Users() 
    {
        super(); //empty constructor for xml processes
    }
    
    public User login (String email, String password) //validates a users login
    {
        for (User customer : customers) 
        {
            if (customer.login(email,password))
                return customer;   
        }
        return null;
    }
    
    public String removeUser (String email) //removes the user based on an email
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
    
    public User getUser(String email) //gets a user based on an email
    {
        for (User user : customers)
            if (user.isUser(email))
                return user;
        return null;
    }
    
    public boolean isAdmin(String userID) //checks if the user is an admin
    {
        for (User user : customers)
            if (user.getUserID().equals(userID))
                if (user.isAdmin())
                    return true;
        return false;
    }
    
    public User getUserByID(String userID) //get user by userID
    {
       for (User user : customers)
            if (user.getUserID().equals(userID))
                return user;
        return null; 
    }
    
    public boolean addUser(String name, String email, String password, String dob) //adds a user to the system
    {
        if (!isEmailAlreadyUsed(email)){
            User user = new User(getRandomUserIDUnique(), name, email, password, dob);
            customers.add(user);
            return true;
        }
        return false;
    }
    
    public ArrayList<User> getUsers () //returns the user list
    {
        return customers;
    }

    private boolean isEmailAlreadyUsed(String email)  //checks the email isn't already registered
    {
        for(User user : customers) 
            if (user.getEmail().equals(email))
                return true;
        return false;
    }
    
    
    public String getRandomUserIDUnique() //generates a new unique id based on all other users
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
