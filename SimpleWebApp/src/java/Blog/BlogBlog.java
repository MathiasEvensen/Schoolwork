package Blog;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author evakristine
 */
  
 public class BlogBlog {
    private String Log_ID;
    private String Title;
    private String Content;
    private String Date;
    private String User_Account_ID;
    
    
    public BlogBlog(){
        
    }
    
    public BlogBlog(String Log_ID, String Title, String Content, String Date, String User_Account_ID){
        this.Log_ID = Log_ID;
        this.Title = Title;
        this.Content = Content;
        this.Date = Date;
        this.User_Account_ID = User_Account_ID;
    }

    
   
    public String getLog_ID(){
        return Log_ID;
    }
    
    public String getTitle(){
        return Title;
    }
    
    public String getContent(){
        return Content;
    }
    
     public String getDate(){
        return Date;
    }
    
    
   
    public void getUser_Account_ID(String User_Account_ID){
        this.User_Account_ID = User_Account_ID;
    }
    
     public void setUser_Account_ID(String User_Account_ID){
        this.User_Account_ID = User_Account_ID;    
    }
    public void setLog_ID(String Log_ID){
        this.Log_ID = Log_ID;    
    }
    
    public void setTitle(String Title){
        this.Title = Title;
    }   
    
    public void setContent(String Content){
        this.Content= Content;
    }  
    
    public void setDate(String Date){
        this.Date = Date;
    }
 
}