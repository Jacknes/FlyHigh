/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lit;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.PropertyException;
import javax.xml.bind.Unmarshaller;

/**
 *
 * @author jacknes
 */
public class UserApplication 
{
    private String filePath; //filepath of the xml
    private Users users; //used to store the users
    
    public UserApplication() //empty constructor for xml operations
    {
        super();
    }
    
    public String getFilePath() //returns the filepath
    {
        return filePath;
    }

    public Users getUsers() //returns the users
    {
        return users;
    }

    public void setUsers(Users users) //sets the users
    {
        this.users = users;
    }
    
    
    public void setFilePath(String filePath) throws JAXBException, FileNotFoundException, IOException //unmarshals the xml data
    {
        // Create the unmarshaller
         JAXBContext jc = JAXBContext.newInstance(Users.class);
         Unmarshaller u = jc.createUnmarshaller();

         // Now unmarshal the object from the file
         FileInputStream fin = new FileInputStream(filePath);
         this.filePath = filePath;
         users = (Users)u.unmarshal(fin); // This loads the "shop" object
         fin.close();    
    }
    
    public void updateXML(Users users) throws PropertyException, JAXBException, FileNotFoundException //marshalls the users object back into xml
    {
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Marshaller m = jc.createMarshaller();     
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);  
        m.marshal(users, new FileOutputStream(filePath));    
    }
    
    public void addUser(String name, String email, String password, String dob) throws JAXBException, PropertyException, FileNotFoundException, IOException 
    { //adds a user to the users object
        users.addUser(name, email, password, dob);
        updateXML(this.users);
    }
    
    public void removeUser (User user) throws JAXBException, PropertyException, FileNotFoundException 
    {//removes a user from the users object
        ArrayList<User> usersList = users.getUsers();
        if (usersList.contains(user))
            usersList.remove(user);
        
        updateXML(users);
    }    
}
