/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modules;

public class Module {
       
    private String module_id;
    private String module_name;
    private String delivery_date;
    private String description;
    private String learningGoals;
    private String resources;
  
    
    public Module(){

    }
    
    public Module(String module_id, String module_name, String delivery_date, String description, String learningGoals, String resources){
        
        this.module_id = module_id;
        this.module_name = module_name;
        this.delivery_date = delivery_date;
        this.description = description;
        this.learningGoals = learningGoals;
        this.resources = resources;
        
    }  
    
    public String getModule_id(){
        return module_id;
    }
    
    public void setModule_id(String module_id){
        this.module_id = module_id;
    }
    
    public String getModule_name(){
        return module_name;
    }
    
    public void setModule_name(String module_name){
        this.module_name = module_name;
    }
    
    public String getDelivery_date(){
        return delivery_date;
    }
    
    public void setDelivery_date(String delivery_date){
        this.delivery_date = delivery_date;
    }
    
    public String getDescription(){
        return description;
    }
    
    public void setDescription(String description){
        this.description = description;
    }
    
     public String getLearningGoals(){
        return learningGoals;
    }
    
    public void setLearningGoals(String learningGoals){
        this.learningGoals = learningGoals;
    }
    
     public String getResources(){
        return resources;
    }
    
    public void setResources(String resources){
        this.resources = resources;
    }
    
}
    