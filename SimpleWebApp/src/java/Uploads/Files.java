/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Uploads;

import java.sql.Blob;

/**
 *
 * @author mathi
 */
public class Files {
    
    private Integer attachment_id;
    private String fileName;
    private Blob fileData;
    private String description;
    private String user_account_id;
    private String module_id;
    
    public Files(){

    }
    
    public Files(Integer attachment_id, String fileName, Blob fileData, String description, String user_account_id, String module_id){
        this.attachment_id = attachment_id;
        this.fileName = fileName;
        this.fileData = fileData;
        this.description = description;
        this.user_account_id = user_account_id;
        this.module_id  = module_id;
    }

    
    
    public Integer getId(){
        return attachment_id;
    }
    
    public void setId(Integer attachment_id){
        this.attachment_id = attachment_id;
    }
    
    public String getFileName(){
        return fileName;
    }
    
    public void setFileName(String fileName){
        this.fileName = fileName;
    }
    
    public Blob getFileData(){
        return fileData;
    }
    
    public void setFileData(Blob fileData){
        this.fileData = fileData;
    }
    
     public String getDescription(){
        return description;
    }
    
    public void setDescription(String description){
        this.description = description;
    }
    
     //returnerer verdien til user_account_id
    public String getUser_account_id(){
        return user_account_id;
    }
    
    //gir en ny verdi til user_account_id
    public void setUser_account_id(String user_account_id){
        this.user_account_id = user_account_id;
    }
    
     //returnerer verdien til user_account_id
    public String getModule_id(){
        return module_id;
    }
    
    //gir en ny verdi til user_account_id
    public void setModule_id(String module_id){
        this.module_id = module_id;
    }
    
}