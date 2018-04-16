package Admin;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author mathi, Brage
 */
public class UserAccount {
    
    public static final String GENDER_MALE ="M";
    public static final String GENDER_FEMALE ="F";
    
    private String user_account_id;
    private String username;
    private String gender;
    private String name;
    private String password;
    private String email;
    private String usertype;
    
    public UserAccount(){

    }
    
    public UserAccount(String user_account_id, String username, String gender, String name, String password, String email, String usertype){
        this.user_account_id = user_account_id;
        this.username = username;
        this.gender = gender;
        this.name = name;
        this.password = password;
        this.email = email;
        this.usertype = usertype;
    }
    
    public UserAccount (String name) {
        
        this.name = name;
       // this.user_account_id = user_account_id;
    }

    
    
    public String getUserName(){
        return username;
    }
    
    public void setUserName(String username){
        this.username = username;
    }
    
    public String getGender(){
        return gender;
    }
    
    public void setGender(String gender){
        this.gender = gender;
    }
    
    public String getPassword(){
        return password;
    }
    
    public void setPassword(String password){
        this.password = password;
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
    
    public String getEmail(){
        return email;
    }
    
    public void setEmail(String email){
        this.email= email;
    }
    
    public String getUserType(){
        return usertype;
    }
    
    public void setUserType(String usertype){
        this.usertype = usertype;
    }

    
}
