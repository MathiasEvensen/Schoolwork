/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 
package Uploads;

import Connection.MyUtils;
import Connection.DBUtils;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


 *
 * @author mathi
 

@WebServlet(urlPatterns = {"/uploadModuleStudents"})
public class UploadModuleStudent extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    
    public UploadModuleStudent(){
        super();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/uploadModuleStudent.jsp");
        dispatcher.forward(request, response);
    }
    
        @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        Connection conn = MyUtils.getStoredConnection(request);
    
        
        String user_account_id = (String) request.getParameter("user_account_id");
        String user = (String) request.getParameter("user");
        String name = (String) request.getParameter("name");
        String module = (String) request.getParameter("module");
    
        Delivery delivery = new Delivery(user_account_id, user, name, module);
        
        String errorString = null;
        
        if(errorString == null) {
        try{
            try{
                boolean hasError;
                hasError = false;
                
                if(name == null || module == null || user == null){
                    
            hasError = true;
                errorString = "Ett eller flere av feltene har ikke blitt fylt ut";
                 
                }else{
                        DBUtils.insertDelivery(conn, delivery);
                        }
            } catch (SQLException ex) {
                Logger.getLogger(UploadModuleStudent.class.getName()).log(Level.SEVERE, null, ex);
            }    
                
            }catch(StringIndexOutOfBoundsException e){
               e.printStackTrace();
               errorString = e.getMessage();
         }
        
        }
    }
}
*/