/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modules;

import Connection.MyUtils;
import Connection.DBUtils;
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
 * @author mathi
 */

@WebServlet(urlPatterns = {"/createModule"})
public class CreateModuleServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    
    public CreateModuleServlet(){
        super();
    }
    
    //show module creation page
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/createModule.jsp");
        dispatcher.forward(request, response);
    }
    
    //When the user enters the modules information, and click Submit.
    //This method will be called
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
       Connection conn = MyUtils.getStoredConnection(request);
       
       String module_id = (String) request.getParameter("module_id");
       String module_name = (String) request.getParameter("module_name");
       String delivery_date = (String) request.getParameter("delivery_date");
       String description = (String) request.getParameter("description");
       String learningGoals = (String) request.getParameter("learningGoals");
       String resources = (String) request.getParameter("resources");
      
       Module module = new Module(module_id, module_name, delivery_date, description, learningGoals, resources);
       
       String errorString = null;
       
       if(errorString == null){
       try{      
           try{
                   DBUtils.createModules(conn, module);
                   
           }catch(StringIndexOutOfBoundsException e){
               e.printStackTrace();
               errorString = e.getMessage();
           }      
          // DBUtils.insertStudents(conn, students);
       }
       catch(SQLException e){
           e.printStackTrace();
           errorString = e.getMessage();
        }
       }
       
       //Store information to request attribute, before forward to views.
       request.setAttribute("errorString", errorString);
       request.setAttribute("module", module);
       
       //if error, forward to edit page
       if(errorString != null){
           RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/createModule.jsp");
           dispatcher.forward(request, response);
       }
       //If everything is going after the plan
       //Redirect to the listing page.
       else{
           response.sendRedirect(request.getContextPath() + "/moduleList");
       }
   }
}