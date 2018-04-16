package Modules;

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

@WebServlet(urlPatterns = {"/modul1graded"})
public class Modul1graded extends HttpServlet{
    
    private static final long serialVersionUID = 1L;
    
    public Modul1graded(){
        super();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        //Fremheve til /WEB-INF/views/homeView.jsp
        //Bruker kan ikke aksesere direkte til JSP sidene plassert i WEB-INF
        
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/modul1gradedview.jsp");
        
        dispatcher.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        doGet(request, response);
    }
    
}
