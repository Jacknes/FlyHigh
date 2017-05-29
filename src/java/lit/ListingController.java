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
import java.util.ArrayList;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.PropertyException;
import javax.xml.bind.Unmarshaller;

/**
 *
 * @author Ryan McCartney 12545378
 */
public class ListingController 
{
    private String filePath;
    private Listings listings;
    
    public ListingController()
    {
        super();
    }

    public String getFilePath() 
    {
        return filePath;
    }

    public Listings getListings() 
    {
        return listings;
    }
    
    public ArrayList<Listing> getListingsList(String userID) 
    {
        ArrayList<Listing> returnList = new ArrayList();
        ArrayList<Listing> listingsList = listings.getListings();
        for (Listing listing : listingsList) 
        {
            if (listing.getUserID().equals(userID))
                returnList.add(listing);
        }
        return listingsList;
        
    }
    
    
    public void setListings(Listings listings)
    {
        this.listings = listings;
    }
    
    public void removeListing(Listing listing) throws JAXBException, PropertyException, FileNotFoundException 
    {
        ArrayList<Listing> listingsList = listings.getListings();
        if (listingsList.contains(listing))
            listingsList.remove(listing);
        
        updateXML(listings);
    }
    
    public ArrayList<Listing> getListingsFromParam(String userID, String origin, String destination, String departureDate, String returnDate, String flightType)
    {
        ArrayList<Listing> allListings = listings.getListings();
        ArrayList<Listing> matchingListings = new ArrayList();
        for (Listing listing : allListings)
        {
            if (listing.getUserID().toLowerCase().equals(userID.toLowerCase()) && listing.getOrigin().toLowerCase().equals(origin.toLowerCase()) && listing.getDestination().toLowerCase().equals(destination.toLowerCase()) && listing.getDepartureDate().toLowerCase().equals(departureDate.toLowerCase()) && listing.getReturnDate().toLowerCase().equals(returnDate.toLowerCase()) && listing.getFlightType().toLowerCase().equals(flightType.toLowerCase()))
            {
                matchingListings.add(listing);
            }
        }
        return matchingListings;
    }
    
    public void setFilePath(String filePath) throws JAXBException, FileNotFoundException, IOException 
    {
        // Create the unmarshaller
         JAXBContext jc = JAXBContext.newInstance(Listings.class);
         Unmarshaller u = jc.createUnmarshaller();

         // Now unmarshal the object from the file
         FileInputStream fin = new FileInputStream(filePath);
         listings = (Listings)u.unmarshal(fin); // This loads the "shop" object
         fin.close();    
    }
    
    public void updateXML(Listings listings) throws PropertyException, JAXBException, FileNotFoundException 
    {
        JAXBContext jc = JAXBContext.newInstance(Listings.class);
        Marshaller m = jc.createMarshaller();     
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);  
        m.marshal(listings, new FileOutputStream("WEB-INF/listings.xml"));    
    }
    
    public void addListings(Listing listing) throws JAXBException, PropertyException, FileNotFoundException, IOException 
    {
        if(listing != null)
            listings.addListing(listing);
        
        updateXML(this.listings);
    }
    
    
}
