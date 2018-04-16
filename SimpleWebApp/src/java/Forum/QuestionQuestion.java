/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Forum;


/**
 *
 * @author ellak
 */

public class QuestionQuestion {
    
         
    private String question_id;
    private String title;
    private String details;
    private String createDate;
    private String name;
    private String email;
    
    public QuestionQuestion(){
        
    }

    public QuestionQuestion(String question_id, String title, String details, String createDate, String name, String email) {
        this.question_id = question_id;
        this.title = title;
        this.details = details;
        this.createDate = createDate;
        this.name = name;
        this.email = email;
    }

   public QuestionQuestion (String name){
       this.name = name;
   }

    public String getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(String question_id) {
        this.question_id = question_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}