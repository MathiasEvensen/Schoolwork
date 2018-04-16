package Admin;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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

@WebServlet(urlPatterns = {"/createStudents"})
public class CreateStudentServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    
    public CreateStudentServlet(){
        super();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/createStudentView.jsp");
        dispatcher.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        Connection conn = MyUtils.getStoredConnection(request);
       
       
       String user_account_id = (String) request.getParameter("user_account_id");
       String username = (String) request.getParameter("username").trim().toLowerCase();
       String gender = (String) request.getParameter("gender").toUpperCase();
       String name = (String) request.getParameter("name").toUpperCase();
       String password = (String) request.getParameter("password");
       String email = (String) request.getParameter("email").toLowerCase();
       String usertype = (String) request.getParameter("usertype").toUpperCase();
      
       
       UserAccount useraccount = new UserAccount(user_account_id, username, gender, name, password, email, usertype);
       
       String errorString = null;
       
       if(errorString == null){
       try{      
           try{
               boolean hasError;
               hasError = false;
               
               if(username == null || password == null || gender == null || name == null || email == null || usertype == null ||
                       username.length() == 0 || password.length() == 0 || gender.length() == 0 || name.length() == 0 || email.length() == 0 || usertype.length() == 0){
                   
            hasError = true;
            errorString = "Ett eller flere av feltene har ikke blitt fylt ut";
            
        }else{
                   DBUtils.insertStudents(conn, useraccount);
               }     
           }catch(StringIndexOutOfBoundsException e){
               e.printStackTrace();
               errorString = e.getMessage();
           }      
          
       }
       catch(SQLException e){
           e.printStackTrace();
           errorString = e.getMessage();
        }
       }
       
       request.setAttribute("errorString", errorString);
       request.setAttribute("userAccount", useraccount);
       
       if(errorString != null){
           RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/createStudentView.jsp");
           dispatcher.forward(request, response);
       }
       else{
           response.sendRedirect(request.getContextPath() + "/studentList");
       }
   }
        
//doGet(request, response);
}
    

