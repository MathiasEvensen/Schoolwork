package Modules;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Admin.UserAccount;
import Connection.DBUtils;
import Connection.MyUtils;
import Feedback.Feedback;
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
 * @author brage
 */

@WebServlet(urlPatterns = {"/modul1"})
public class Modul1 extends HttpServlet{
    
    private static final long serialVersionUID = 1L;
    
    public Modul1(){
        super();
    }
    
    @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       
      RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/modul1view.jsp");
       
        dispatcher.forward(request, response);
    }
        
    @Override
    protected void doPost (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        Connection conn = MyUtils.getStoredConnection(request);
       
       
       String status = (String) request.getParameter("status");
       String commentOpen = (String) request.getParameter("commentOpen");
       String commentHidden = (String) request.getParameter("commentHidden");
       String score = (String) request.getParameter("score");
       String module_id = (String) request.getParameter("module_id");
       String user_account_id = (String) request.getParameter("user_account_id");
       String name = (String) request.getParameter("name");
       String username = (String) request.getParameter("username");
       String gender = (String) request.getParameter("gender");
       String password = (String) request.getParameter("password");
       String email = (String) request.getParameter("email");
       String usertype = (String) request.getParameter("usertype");

      
       
       Feedback feedback = new Feedback(status, commentOpen, commentHidden, score, module_id, user_account_id);
       
       UserAccount  user_account = new UserAccount(user_account_id, username, gender, name, password, email, usertype);
       
       // UserAccount user_account =  new UserAccount(name);
       
      
       
       String errorString = null;
       
       if(errorString == null){
       try{      
           try{
                   
                   DBUtils.createFeedback(conn, feedback, user_account);
                   
                   
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
       request.setAttribute("feedback", feedback);
       request.setAttribute("user_account", user_account);
       //request.setAttribute("user_account_id", user_account_id);
       
       if(errorString != null){
            System.out.println ("Hei");
           RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/modul1view.jsp");
           dispatcher.forward(request, response);
       }
       else{
          
           response.sendRedirect(request.getContextPath()+ "/modul1graded");
        
        
        
  // doGet(request, response);
}
}
}
