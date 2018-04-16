package LoginLogout;


import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
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

@WebFilter(filterName = "aut", urlPatterns = {"/aut/*"})
public class LoginRestrictions implements Filter{
    
    //private static final long serialVersionUID = 1L;
    /*
    public LoginRestrictions(){
        super();
    }
    */
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        //Filter.super.init(filterConfig); //To change body of generated methods, choose Tools | Templates.

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);
    
        if(session == null || session.getAttribute("loginedUser") == null){
            response.sendRedirect(request.getContextPath() + "/login"); // redirect hvis ikke logget inn
        }
        else{
            chain.doFilter(req, res); //Hvis loget inn, alt er greit
        }
        
    }
    
    public void destroy(){
        //clean/close
    }
    
}
