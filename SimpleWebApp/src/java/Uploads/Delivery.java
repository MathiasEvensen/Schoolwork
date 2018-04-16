/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Uploads;

/**
 *
 * @author Mr.Schibbye
 */
public class Delivery {
    
    private String user_account_id;
    private String user;
    private String name;
    private String module;
        
    public Delivery(String user_account_id,String user, String name, String module){
        this.user_account_id = user_account_id;
        this.user = user;
        this.name = name;
        this.module = module;
        
    }
    //returnerer verdien til user_account_id
    public String getUser_account_id(){
        return user_account_id;
    }
    
    //gir en ny verdi til user_account_id
    public void setUser_account_id(String user_account_id){
        this.user_account_id = user_account_id;
    }
    
    //returnerer verdien til user
    public String getUser(){
        return user;
    }
    
    //gir en ny verdi til user
    public void setUser(String user){
        this.user = user;
    }
    
    //returnerer verdien til name
    public String getName(){
        return name;
    }
    
    //gir en ny verdi til name
    public void setName(String name){
        this.name = name;
    }
    
    //returnerer verdien til module
    public String getModule(){
        return module;
    }
    
    //gir en ny verdi til module
    public void setModule(String module){
        this.module = module;
    }
    
}
