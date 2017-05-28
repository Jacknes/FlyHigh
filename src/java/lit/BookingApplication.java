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
public class BookingApplication {
    private String filePath;
    private Bookings bookings;
    
    public BookingApplication() 
    {
        super();
    }
    
    public String getFilePath() 
    {
        return filePath;
    }

    public Bookings getBookings() 
    {
        return bookings;
    }

    public void setBookings(Bookings bookings) 
    {
        this.bookings = bookings;
    }
    
    
    public void setFilePath(String filePath) throws JAXBException, FileNotFoundException, IOException 
    {
        // Create the unmarshaller
         JAXBContext jc = JAXBContext.newInstance(Bookings.class);
         Unmarshaller u = jc.createUnmarshaller();

         // Now unmarshal the object from the file
         FileInputStream fin = new FileInputStream(filePath);
         bookings = (Bookings)u.unmarshal(fin); // This loads the "shop" object
         fin.close();    
    }
    
    public void updateXML(Bookings bookings) throws PropertyException, JAXBException, FileNotFoundException 
    {
        JAXBContext jc = JAXBContext.newInstance(Bookings.class);
        Marshaller m = jc.createMarshaller();     
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);  
        m.marshal(bookings, new FileOutputStream(filePath));    
    }
    
    //public Booking(String bookingID, String userID, String flightID, Date bookingDate) 
    public void addBooking(String userID, String flightID) throws JAXBException, PropertyException, FileNotFoundException, IOException 
    {
        String bookingID = bookings.getRandomBookingIDUnique();
        Booking booking = new Booking(bookingID, userID, flightID);
        bookings.addBooking(booking);
        //updateXML(bookings);
    }
}
