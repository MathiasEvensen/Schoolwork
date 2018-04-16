/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Progress;

import Connection.DBUtils;
import Connection.MyUtils;
import Admin.UserAccount;
import Feedback.Feedback;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Brage
 */
@WebServlet(name = "ProgressMenuAdminStudent", urlPatterns = {"/ProgressMenuAdminStudent"})
public class ProgressMenuAdminStudent extends HttpServlet {

private static final long serialVersionUID = 1L;
 
    public ProgressMenuAdminStudent() {
        super();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        Connection conn = MyUtils.getStoredConnection(request);
        
       
        String user_account_id = (String) request.getParameter("user_account_id");
        
        UserAccount useraccount = null;
        
        List<Feedback> list = null;
        
        String errorString = null;
        
        try{
            useraccount = DBUtils.findStudents(conn, user_account_id);
            list = DBUtils.queryStudentFeedback(conn,user_account_id);
        }
        catch(SQLException e){
            e.printStackTrace();
            errorString = e.getMessage();
        }
        
        if(errorString != null && useraccount == null){
            response.sendRedirect(request.getServletPath() + "/studentList");
            return;
        }
        
        request.setAttribute("errorString", errorString);
        request.setAttribute("useraccount", useraccount);
        request.setAttribute("feedbackList", list);
        
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/progressMenuStudentView.jsp");
        dispatcher.forward(request, response);
    }
    
   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        doGet(request, response);
    }
    
}

