package Filter;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Admin.UserAccount;
import Connection.DBUtils;
import Connection.MyUtils;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
 
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mathi
 */

@WebFilter(filterName = "cookieFilter", urlPatterns = {"/*"})
public class CookieFilter implements Filter{
    
    public CookieFilter(){
        
    }
    
    @Override
    public void init(FilterConfig fConfig) throws ServletException{
        
    }
    
    @Override
    public void destroy(){
        
    }
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException{
        
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();
        
        UserAccount userInSession = MyUtils.getLoginedUser(session);
        
        UserAccount userIDInSession = MyUtils.getLoginedUserID(session);
        
        if(userInSession != null || userIDInSession != null) {
            session.setAttribute("COOKIE_CHECKED", "CHECKED");
            chain.doFilter(request, response);
            return;
        }
        //Connection var laget i JDBCFilter
        Connection conn = MyUtils.getStoredConnection(request);
        
        //Flag check cookie
        String checked = (String) session.getAttribute("COOKIE_CHECKED");
        if(checked == null && conn != null){
            String userName = MyUtils.getUserNameInCookie(req);
            String user_account_id = MyUtils.getIDInCookie(req);
            
            try{
                UserAccount user = DBUtils.findUser(conn, userName);
                MyUtils.storeLoginedUser(session, user);
                UserAccount id = DBUtils.findUserID(conn, user_account_id);
                MyUtils.storeLoginedUserID(session, id);
            }
            
            
            
            catch(SQLException e){
                e.printStackTrace();
            }
            //merke checked cookies
            session.setAttribute("COOKIE_CHECKED", "CHECKED");
        }
        chain.doFilter(request, response);
    }
}
