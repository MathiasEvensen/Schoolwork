/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Forum;

import Connection.MyUtils;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ellak
 */
@WebServlet(urlPatterns = {"/questionInfo"})
public class QuestionInfo extends HttpServlet {
        
 private static final long serialVersionUID = 1L;
    
    public QuestionInfo(){
        super();
    }


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        HttpSession session = request.getSession();
        QuestionQuestion createQuestion = MyUtils.getCreateQuestion(session);
         if(createQuestion == null){
            //redirect
            response.sendRedirect(request.getContextPath() + "/createQuestion");
            return;
        }
            //lagre info i request attributes
        request.setAttribute("Question", createQuestion);
        
        //
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/questionInfoView.jsp");
        dispatcher.forward(request, response);
    }
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
            doGet(request, response);
    }
    
}