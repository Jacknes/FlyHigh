/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lit;

import java.io.*;
import java.util.*;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author jacknes
 */

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "user")
public class User implements Serializable
{
    @XmlElement(name = "userID")
    String userID;
    @XmlElement(name = "name")
    String name;
    @XmlElement(name = "email")
    String email;
    @XmlElement(name = "password")
    String password;
    @XmlElement(name = "dob")
    String dob;
    @XmlElement(name = "admin")
    boolean admin;
    @XmlElement(name ="bookingID")
    String bookingID;

    public User(String userID, String name, String email, String password, String dob) 
    {
        this.userID = userID;
        this.name = name;
        this.email = email;
        this.password = password;
        this.dob = dob;
        this.admin = false;
        this.bookingID = "0";
    }
    public User() 
    {
        super();
    }
    
    
    public boolean login(String email, String password) 
    {
        return this.email.equals(email) && this.password.equals(password);
    }
    
    public boolean isUser (String email) 
    {
        return email.equals(this.email);
    }
    
    public String getName() {
        return name;
    }
    

    public boolean isAdmin () 
    {
        return admin;
    }
    
    public String getEmail() {
        return email;
    }
    
    
    public String getUserID() 
    {
        return userID;
    }
    
    public String getPassword() {
        return password;
    }

    public String getDob() {
        return dob;
    }

    private String getBookingID() {
        return bookingID;
    }
    
    @Override
    public String toString() {
        return name + " " + email + " " + password + " " + userID + " " + dob + " bookingID " + bookingID;
    }
    

 
}
