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
 * @author Jonas
 */

@WebServlet(urlPatterns = {"/editModule"})
public class EditModuleServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
 
    public EditModuleServlet() {
        super();
    }
    // Viser module redigerings siden.
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        Connection conn = MyUtils.getStoredConnection(request);
        
        String module_id = (String) request.getParameter("module_id");
        
        Module module = null;
        
        String errorString = null;
        
        try{
           module = DBUtils.findModule(conn, module_id);
        }
        catch(SQLException e){
            e.printStackTrace();
            errorString = e.getMessage();
        }
        
        //Hvis det ikke er feilmeldinger.
        //Eksisterer ikke modulen til å redigeres.
        //omdirigerer til modulliste siden.
        if(errorString != null && module == null){
            response.sendRedirect(request.getServletPath() + "/moduleList");
            return;
        }
        
        //Lagrer errorString i request attribute, før viderere til visnigner
        request.setAttribute("errorString", errorString);
        request.setAttribute("module", module);
        
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/EditModule.jsp");
        dispatcher.forward(request, response);
    }
    
    //Etter brukeren modifiserer moduleninformasjonen, og klikker Submit.
    //Denne metoden blir utført.
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       Connection conn = MyUtils.getStoredConnection(request);
        
       String module_id = (String) request.getParameter("module_id");
       String module_name = (String) request.getParameter("module_name");
       String delivery_date = (String) request.getParameter("delivery_date");
       String description = (String) request.getParameter("description");
       String learningGoals = (String) request.getParameter("learningGoals");
       String resources = (String) request.getParameter("resources");

       Module module = new Module(module_id, module_name, delivery_date, description, learningGoals, resources);
        
       String errorString = null;
          
        try{    
            DBUtils.editModules(conn, module); 
        }
        catch(SQLException e){
            e.printStackTrace();
            errorString = e.getMessage();
        }      
        
        //lagrer informasjon til request attribute, før viderere til visnigner.
        request.setAttribute("errorString", errorString);
        request.setAttribute("module", module);
        
        //if error, før viderer til redigeringssiden
        if(errorString != null){
            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/EditModule.jsp");
            dispatcher.forward(request, response);
        }
        //Hvis alt fungerer.
        //Omdiriger til module liste siden
        else{
            response.sendRedirect(request.getContextPath() + "/moduleList");
        }
    }  
}