/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modules;

import Connection.DBUtils;
import Connection.MyUtils;
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
 * @author jonas
 */
@WebServlet(name = "moduleDetails", urlPatterns = {"/moduleDetails"})
public class moduleDetails extends HttpServlet {

private static final long serialVersionUID = 1L;
 
    public moduleDetails() {
        super();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        Connection conn = MyUtils.getStoredConnection(request);
              
        String module_id = (String) request.getParameter("module_id");
        Module module = null;
        List<Module> list = null; 
        String errorString = null;
        
        try{
            module = DBUtils.findModule(conn, module_id);
            list = DBUtils.listModuleDetails(conn, module_id);
        }
        catch(SQLException e){
            e.printStackTrace();
            errorString = e.getMessage();
        }
        
        if(errorString != null && module == null){
            response.sendRedirect(request.getServletPath() + "/moduleList");
            return;
        }
        
        request.setAttribute("errorString", errorString);
        request.setAttribute("module", module);
        request.setAttribute("moduleList", list);
        
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/moduleViewDetails.jsp");
        dispatcher.forward(request, response);
    }
    
   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        doGet(request, response);
    }
    
}