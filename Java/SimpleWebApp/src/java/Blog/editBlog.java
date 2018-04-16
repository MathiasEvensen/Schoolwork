/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Blog;

  import Connection.MyUtils;
import Connection.DBUtils;
import Admin.UserAccount;
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


@WebServlet(name = "editBlog", urlPatterns = {"/editBlog"})
public class editBlog extends HttpServlet {

    
    private static final long serialVersionUID = 1L;
 
    public editBlog() {
        super();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        Connection conn = MyUtils.getStoredConnection(request);
        
      
        String Log_ID = (String) request.getParameter("Log_ID"); 
        String title = (String) request.getParameter("title");
        String content = (String) request.getParameter("content");
        
        BlogBlog blogBlog = null;
        
        String errorString = null;
        
        try {
            blogBlog = DBUtils.findPost(conn, title, content);
        } catch (SQLException ex) {
            Logger.getLogger(editBlog.class.getName()).log(Level.SEVERE, null, ex);
        }
        
     
        
        if(errorString != null && blogBlog == null){
            response.sendRedirect(request.getServletPath() + "/editBlog");
            return;
        }
        
        request.setAttribute("errorString", errorString);
        request.setAttribute("blogBlog", blogBlog);
        
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/editBlog.jsp");
        dispatcher.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Connection conn = MyUtils.getStoredConnection(request);
        
       String Log_ID = (String) request.getParameter("Log_ID");
       String Title = (String) request.getParameter("Title");
       String Content = (String) request.getParameter("Content");
       String Date = (String) request.getParameter("Date");
       String User_Account_ID = (String) request.getParameter("User_Account_ID");

        BlogBlog blogBlog = new BlogBlog(Log_ID, Title, Content, Date, User_Account_ID);
       
        
        String errorString = null;
        
        try{
            DBUtils.updateBlog(conn, blogBlog);
        }
        catch(SQLException e){
            e.printStackTrace();
            errorString = e.getMessage();
        }
        
        request.setAttribute("errorString", errorString);
        request.setAttribute("blogBlog", blogBlog);
        
        if(errorString != null){
            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/editBlog.jsp");
            dispatcher.forward(request, response);
        }
        else{
            System.out.println("");
            response.sendRedirect(request.getContextPath() + "/BlogListView");
        }

    }
}