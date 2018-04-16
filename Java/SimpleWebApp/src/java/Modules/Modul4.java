package Modules;

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
 * @author brage
 */

@WebServlet(urlPatterns = {"/modules/modul4"})
public class Modul4 extends HttpServlet{
    
    private static final long serialVersionUID = 1L;
    
    public Modul4(){
        super();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/modul4view.jsp");
        
        dispatcher.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        doGet(request, response);
    }
}
