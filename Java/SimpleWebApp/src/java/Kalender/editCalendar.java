/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Connection.MyUtils;
import Connection.DBUtils;
import Kalender.CalendarCalendar;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author Ann Margrethe
 */
@WebServlet(urlPatterns = {"/editCalendar"})
public class editCalendar extends HttpServlet {

    private static final long serialVersionUID = 1L;
 
    public editCalendar() {
        super();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        Connection conn = MyUtils.getStoredConnection(request);
        
        //String Calendar_ID = (String) request.getParameter("Calendar_ID");
        String Date = (String) request.getParameter("Date");
         String Event = (String) request.getParameter("Event");
        
        CalendarCalendar calendar = null;
        
        String errorString = null;
        
        try{
            calendar = DBUtils.findDate(conn, Date, Event);
        }
        catch(SQLException e){
            e.printStackTrace();
            errorString = e.getMessage();
        }
        
        if(errorString != null && calendar == null){
            response.sendRedirect(request.getServletPath() + "/editCalendar");
            return;
        }
        
        request.setAttribute("errorString", errorString);
        request.setAttribute("calendar", calendar);
        
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/editCalendar.jsp");
        dispatcher.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Connection conn = MyUtils.getStoredConnection(request);
        
       String Calendar_ID = (String) request.getParameter("Calendar_ID");
       String Date = (String) request.getParameter("Date");
       String Event = (String) request.getParameter("Event");

        CalendarCalendar calendar = new CalendarCalendar(Calendar_ID, Date, Event);
        
        String errorString = null;
        
        try{
            DBUtils.updateCalendar(conn, calendar);
        }
        catch(SQLException e){
            e.printStackTrace();
            errorString = e.getMessage();
        }
        
        request.setAttribute("errorString", errorString);
        request.setAttribute("calendar", calendar);
        
        if(errorString != null){
            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/editCalendar.jsp");
            dispatcher.forward(request, response);
        }
        else{
            System.out.println("");
            response.sendRedirect(request.getContextPath() + "/CalendarList");
        }

//doGet(request, response);
    }
    
}