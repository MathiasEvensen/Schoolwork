/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Progress;

import Connection.DBUtils;
import Connection.MyUtils;
import Admin.UserAccount;
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
@WebServlet(urlPatterns = {"/ProgressMenuAdminSearch"})
public class ProgressMenuAdminSearch extends HttpServlet{
    
    private static final long serialVersionUID = 1L;
    
    public ProgressMenuAdminSearch(){
        super();
    }


  @Override
 protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        

        Connection conn = MyUtils.getStoredConnection(request);
        
        String errorString = null;
        String name=(String) request.getParameter("name");
        List<UserAccount> list = null;
        try{
            list = DBUtils.queryUserAccountSearch(conn, name);
        }
        catch(SQLException e){
            e.printStackTrace();
            errorString = e.getMessage();
        }
        request.setAttribute("errorString", errorString);
        request.setAttribute("userAccountList", list);

        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/progressmenuadminviewsearch.jsp");
        dispatcher.forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        doGet(request, response);
    }
    
}
