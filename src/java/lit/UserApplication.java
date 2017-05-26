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
    private String filePath;
    private Users users;
    
    public UserApplication() 
    {
        super();
    }
    
    public String getFilePath() 
    {
        return filePath;
    }

    public Users getUsers() 
    {
        return users;
    }

    public void setUsers(Users users) 
    {
        this.users = users;
    }
    
    
    public void setFilePath(String filePath) throws JAXBException, FileNotFoundException, IOException 
    {
        // Create the unmarshaller
         JAXBContext jc = JAXBContext.newInstance(Users.class);
         Unmarshaller u = jc.createUnmarshaller();

         // Now unmarshal the object from the file
         FileInputStream fin = new FileInputStream(filePath);
         users = (Users)u.unmarshal(fin); // This loads the "shop" object
         fin.close();    
    }
    
    public void updateXML(Users users) throws PropertyException, JAXBException, FileNotFoundException 
    {
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Marshaller m = jc.createMarshaller();     
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);  
        m.marshal(users, new FileOutputStream("WEB-INF/users.xml"));    
    }
    
    public void addUser(User user) throws JAXBException, PropertyException, FileNotFoundException, IOException 
    {
        if(user != null)
            users.addUser(user);
        
        updateXML(this.users);
    }
    
}
