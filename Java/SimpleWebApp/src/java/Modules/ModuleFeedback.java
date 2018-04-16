/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modules;

/**
 *
 * @author Brage
 */
public class ModuleFeedback {
 
    private String module_id;
    private String user_account_id;
    private String name;
    private String attachment_id;
    private String status;
    private String score;
    private String commentHidden;
    private String commentOpen;
    private String description;
    
    

 public ModuleFeedback(){
        
    }
    
    public ModuleFeedback(String module_id, String user_account_id, String name, String attachment_id, String status, String score,  String commentHidden, String commentOpen, String description){
        
        this.module_id = module_id;
        this.user_account_id = user_account_id; 
        this.name = name;
        this.attachment_id = attachment_id;
        this.status = status;
        this.score = score;
        this.commentHidden = commentHidden;
        this.commentOpen = commentOpen;
        this.description = description;
        
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
    
    public String getName(){
    return name;
    }
    
    public void setName(String name){
        this.name = name;
    }
    
    public String getAttachment_id(){
        return attachment_id;
    }
    
    public void setAttachment_id(String attachment_id){
        this.attachment_id = attachment_id;
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
    
    public String getDescription(){
        return description;
    }
    
    public void setDescription(String description){
        this.description = description;
      
    
}
    
}