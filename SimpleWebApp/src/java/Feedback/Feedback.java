package Feedback;


/**
 *
 * @author mathi, Brage
 */
public class Feedback {
    

    
    private String status;
    private String commentOpen;
    private String commentHidden;
    private String score;
    private String module_id;
    private String user_account_id;
    
    public Feedback(){

    }
    
    public Feedback(String status, String commentOpen, String commentHidden, String score, String module_id, String user_account_id){
        
        this.status = status;
        this.commentOpen = commentOpen;
        this.commentHidden = commentHidden;
        this.score = score;
        this.module_id = module_id;
        this.user_account_id = user_account_id;
    }

    
    
    public String getStatus(){
        return status;
    }
    
    public void setStatus(String status){
        this.status = status;
    }
    
    public String getCommentOpen(){
        return commentOpen;
    }
    
    public void setCommentOpen(String commentOpen){
        this.commentOpen = commentOpen;
    }
    
    public String getCommentHidden(){
        return commentHidden;
    }
    
    public void setCommentHidden(String commentHidden){
        this.commentHidden = commentHidden;
    }
    
     public String getScore(){
        return score;
    }
    
    public void setScore(String score){
        this.score = score;
    }
    
     public String getModule_id(){
        return module_id;
    }
    
    public void setModule_id(String module_id){
        this.module_id = module_id;
    }
    
    public String getUser_account_id(){
        return user_account_id;
    }
    
    public void setUser_account_id(String user_account_id){
        this.user_account_id = user_account_id;
    }
    

    
}
