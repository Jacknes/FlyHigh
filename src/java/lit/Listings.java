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
    
    public Listing getListing(String userID)
    {
        for (Listing listing : listings)
            if (listing.isListing(userID))
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
}
