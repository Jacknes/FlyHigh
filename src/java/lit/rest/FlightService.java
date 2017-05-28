/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lit.rest;

import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.*;

/**
 *
 * @author Ryan McCartney 12545378
 */
@Path("/flightFilter")
public class FlightService 
{
    @Context
    private ServletContext application;
    
    // need to add the equivalent of "DiaryApplication". Can lit.FlightController work?
    
}
