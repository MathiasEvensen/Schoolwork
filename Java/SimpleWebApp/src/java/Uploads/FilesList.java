/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Uploads;

import Connection.DBUtils;
import Connection.MyUtils;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(urlPatterns = {"/files"})
public class FilesList extends HttpServlet{
    
private static final long serialVersionUID = 1L;
    
    public FilesList(){
        super();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        Connection conn = MyUtils.getStoredConnection(request);
    
        String errorString = null;
        List<Files> list = null;
        try {
            list = DBUtils.queryFiles(conn);
            
        } catch (SQLException ex) {
           Logger.getLogger(DownloadAttachmentServlet.class.getName()).log(Level.SEVERE, null, ex);
           errorString = ex.getMessage();
       }
        request.setAttribute("errorString", errorString);
        request.setAttribute("filesList", list);
        
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/files.jsp");
        dispatcher.forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        doGet(request, response);
    }
    
}
