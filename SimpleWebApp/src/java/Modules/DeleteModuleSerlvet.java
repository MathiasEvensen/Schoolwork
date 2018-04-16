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
@WebServlet(urlPatterns = {"/deleteModule"})
public class DeleteModuleSerlvet extends HttpServlet{
    
    private static final long serialVersionUID = 1L;
 
    public DeleteModuleSerlvet() {
        super();
    }
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = MyUtils.getStoredConnection(request);
        
        String module_id = (String) request.getParameter("module_id");
        
        String errorString = null;
        
        try{
            DBUtils.deleteModule(conn, Integer.parseInt(module_id));
        }
        catch(SQLException e){
            e.printStackTrace();
            errorString = e.getMessage();
        }
        
        if(errorString != null){
            request.setAttribute("errorString", errorString);
            
            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/DeleteModuleServlet.jsp");
            dispatcher.forward(request, response);
        }
        else{
            response.sendRedirect(request.getContextPath() + "/moduleList");
        }
    }
    
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
    
}