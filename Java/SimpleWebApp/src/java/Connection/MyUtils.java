package Connection;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Admin.UserAccount;
import Forum.QuestionQuestion;
import java.sql.Connection;
import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mathias, Brage
 */
public class MyUtils {
    
    public static final String ATT_NAME_CONNECTION = "ATTRIBUTE_FOR_CONNECTION";
    
        public static final String ATT_NAME_USER_NAME = "ATTRIBUTE_FOR_STORE_USER_NAME_IN_COOKIE";
    
    public static final String ATT_NAME_USER_ID = "ATTRIBUTE_FOR_STORE_USER_ID_IN_COOKIE";
    
    //lagre Connection i request attribute
    //Informasjonen lagres kun under requests
    public static void storeConnection(ServletRequest request, Connection conn) {
        request.setAttribute(ATT_NAME_CONNECTION, conn);
    }
 
    // Get the Connection object has been stored in attribute of the request.
    public static Connection getStoredConnection(ServletRequest request) {
        Connection conn = (Connection) request.getAttribute(ATT_NAME_CONNECTION);
        return conn;
    }
    
    //lagre bruker info i session
    public static void storeLoginedUser(HttpSession session, UserAccount loginedUser){
        //JSP kan få tilgang via ${loginedUser}
        session.setAttribute("loginedUser", loginedUser);
    }
    
    //få brukeren sin info lagret i session
    public static UserAccount getLoginedUser(HttpSession session){
        UserAccount loginedUser = (UserAccount) session.getAttribute("loginedUser");
        return loginedUser;
    }
    
     //lagre bruker info i session
        public static void storeLoginedUserID(HttpSession session, UserAccount loginedUserID){
        //JSP kan aksesere via ${loginedUser}
        session.setAttribute("loginedUserID", loginedUserID);
    }
    
    //få brukeren sin info lagret i session
    public static UserAccount getLoginedUserID(HttpSession session){
        UserAccount loginedUserID = (UserAccount) session.getAttribute("loginedUserID");
        return loginedUserID;
    }
    
    
    
    //lagre info i cookie
    public static void storeUserCookie(HttpServletResponse response, UserAccount user){
        System.out.println("Store user cookie");
            Cookie cookieUserName = new Cookie(ATT_NAME_USER_NAME, user.getUserName());
        // 1 dag (i sekunder)
        cookieUserName.setMaxAge(24*60*60); 
        response.addCookie(cookieUserName);
    }
    
    
    
    public static String getUserNameInCookie(HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        if(cookies != null){
        for(Cookie cookie : cookies){
        if (ATT_NAME_USER_NAME.equals(cookie.getName())){
            return cookie.getValue();
        }
      }
    }
        return null;
    }
    
        public static void storeIDCookie(HttpServletResponse response, UserAccount user){
        System.out.println("Store id cookie");
        Cookie cookieUserID = new Cookie (ATT_NAME_USER_ID, user.getUser_account_id());
        // 1 dag (i sekunder)
        
        cookieUserID.setMaxAge(24*60*60);
        response.addCookie(cookieUserID);
    }
    
     public static String getIDInCookie(HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        if(cookies != null){
        for(Cookie cookie : cookies){
            if (ATT_NAME_USER_ID.equals(cookie.getName())){
            return cookie.getValue();
      
        }
      }
    }
        return null;
    }
    
    //Slette cookies
    public static void deleteUserCookie(HttpServletResponse response){
        Cookie cookieUserName = new Cookie(ATT_NAME_USER_NAME, null);
        //cookie slettes umiddelbart
        cookieUserName.setMaxAge(0);
        response.addCookie(cookieUserName);
    }
    
    public static QuestionQuestion getCreateQuestion(HttpSession session) {
         QuestionQuestion createQuestion = (QuestionQuestion) session.getAttribute("createQuestion");
        return createQuestion;
    }
    
    public static void storeCreateQuestionID(HttpSession session, QuestionQuestion createQuestion){
        //JSP kan aksesere via ${createQuestion}
     session.setAttribute("createQuestion", createQuestion);   
    }
        //få brukeren sin info lagret i session
    public static QuestionQuestion getCreateQuestionID(HttpSession session){
        QuestionQuestion createQuestionID = (QuestionQuestion) session.getAttribute("createQuestionID");
        return createQuestionID;
    }
    public static void storeUserCookie(HttpServletResponse response, QuestionQuestion createTopic) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public static void storeLoginedUser(HttpSession session, QuestionQuestion createTopic) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
