/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Kalender;

/**
 *
 * @author Ann Margrethe
 */
public class CalendarCalendar {
    private String Calendar_ID;
    private String Date;
    private String Event;
    
    public CalendarCalendar(){
        
    }
    
    public CalendarCalendar(String Calendar_ID, String Date, String Event){
        this.Calendar_ID = Calendar_ID;
        this.Date = Date;
        this.Event = Event;
    }

    
    
    public String getCalendar_ID(){
        return Calendar_ID;
    }
    
    public String getDate(){
        return Date;
    }
    
    public String getEvent(){
        return Event;
    }
    
    public void setCalendar_ID(String Calendar_ID){
        this.Calendar_ID = Calendar_ID;
    }
    
    public void setDate(String Date){
        this.Date = Date;
    }

    public void setEvent(String Event){
        this.Event = Event;
    }
}