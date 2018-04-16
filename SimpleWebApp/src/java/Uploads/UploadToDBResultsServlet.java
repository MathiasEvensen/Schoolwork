package Uploads;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author mathi
 */
import java.io.IOException;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
@WebServlet("/uploadToDBResults")
public class UploadToDBResultsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
  
 
    public UploadToDBResultsServlet() {
        super();
    }
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        RequestDispatcher dispatcher
            = request.getServletContext().getRequestDispatcher("/WEB-INF/views/uploadToDBResults.jsp");
 
        dispatcher.forward(request, response);
    }
 
}
