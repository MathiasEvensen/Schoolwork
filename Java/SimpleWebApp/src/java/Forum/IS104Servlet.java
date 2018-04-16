package Forum;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ellak
 */
@WebServlet(urlPatterns = {"/IS-104"})
public class IS104Servlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    
    public IS104Servlet(){
        super();
    }

  

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/is104View.jsp");
       dispatcher.forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        doGet(request, response);
    }
}