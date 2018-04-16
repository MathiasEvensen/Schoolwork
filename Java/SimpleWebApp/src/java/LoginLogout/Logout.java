package LoginLogout;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Mathias
 */
@WebServlet(urlPatterns = {"/logout.jsp"})
public class Logout extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public Logout() {
        super();
    }

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*
        HttpSession session = request.getSession();
        if(session.getAttribute("user") != null){
            session.removeAttribute("user");
            response.sendRedirect("/WEB-INF/views/homeView.jsp");
*/
        HttpSession session = request.getSession(false);
            if(session != null)
                session.invalidate();
                
                    request.getRequestDispatcher("/WEB-INF/views/loginView.jsp").forward(request,response);
                    System.out.println("Logged out");
        }
    }
