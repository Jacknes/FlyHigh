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
 * @author Ryan McCartney 12545378
 */

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "listings")
public class Listings implements Serializable
{
    @XmlElement(name = "listing")
    ArrayList<Listing> listings = new ArrayList<>();
    
    public Listings()
    {
        super();
    }
    
    public Listing getListing(String listingID)
    {
        for (Listing listing : listings)
            if (listing.isListing(listingID))
                return listing;
        return null;
    }
    
    public ArrayList<Listing> getListings()
    {
        return listings;
    }
    
    public void addListing(Listing listing)
    {
        listings.add(listing);
    }
    
    public ArrayList<Listing> getListingsForUserID(String userID) 
    {
        ArrayList<Listing> results = new ArrayList();
        for (Listing listing : listings) 
        {   
            if(listing.getUserID().equals(userID))
                    results.add(listing);
        }
        return results;
    }
    
    public String getRandomListingIDUnique() 
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
            for (Listing listing : listings) 
            {
                if (id.equals(listing.getListingID()))
                    isUnique = false;
            }
       } 
       
       return id;
    }
}
