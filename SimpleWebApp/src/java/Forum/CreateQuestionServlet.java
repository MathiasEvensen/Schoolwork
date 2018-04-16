import Connection.MyUtils;
import Connection.DBUtils;
import Forum.QuestionQuestion;
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

/**
 *
 * @author ellak
 */
@WebServlet(urlPatterns = {"/createQuestions"})
public class CreateQuestionServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    
    public CreateQuestionServlet(){
        super();
    }

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/createQuestionView.jsp");
        dispatcher.forward(request, response);
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        Connection conn = MyUtils.getStoredConnection(request);
        
        String question_id = (String) request.getParameter("question_id");
        String title= (String) request.getParameter("title").toUpperCase();
        String details = (String) request.getParameter("details").toUpperCase();
        String createDate = (String) request.getParameter("createDate");
        String name = (String) request.getParameter("name").toUpperCase();
        String email = (String) request.getParameter("email").toLowerCase();
        
        QuestionQuestion question = new QuestionQuestion(question_id, title, details, createDate, name, email);
        
        String errorString = null;
                
         
        if(errorString == null){
         //try{
             try{
            boolean hasError;
            hasError = false;
            
            if( title == null || details == null || createDate == null || name== null || email== null ||
                    title.length() == 0 || details.length() == 0 || createDate.length() == 0 || name.length() == 0|| email.length() == 0){
                            
                                
                hasError = true;
                errorString = "Trenger å fylle på alt feltene";
                                
                }else{
                           
                    DBUtils.insertQuestion (conn, question);
                    
                    }
               }catch(StringIndexOutOfBoundsException e){
               e.printStackTrace();
               errorString = e.getMessage();
            
              }
                catch(SQLException e){
                 e.printStackTrace();
                errorString = e.getMessage();
             }
         }
            request.setAttribute("errorString", errorString);
            request.setAttribute("QuestionQuestion", question);
            
            
            if(errorString != null){
                RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/questionListView.jsp");
                dispatcher.forward(request, response);
            
            }
            else{
                response.sendRedirect(request.getContextPath() + "/questionList");
       }
     }
   }