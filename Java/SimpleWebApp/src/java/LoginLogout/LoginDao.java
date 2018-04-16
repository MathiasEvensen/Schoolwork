/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LoginLogout;

/**
 *
 * @author Mathias, Jonas
 */
import Connection.MySQLConnUtils;
import Admin.UserAccount;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class LoginDao {
    public String authenticateUser(UserAccount user) throws ClassNotFoundException{
        String userName = user.getUserName();
        String password = user.getPassword();
        Connection conn = null;
        Statement statement = null;
        ResultSet resultSet = null;
        String userNameDB = "";
        String passwordDB = "";
        String roleDB = "";
        
            try{
                conn = MySQLConnUtils.getMySQLConnection();
                statement = conn.createStatement();
                resultSet = statement.executeQuery("select user_name, password, usertype from user_account");
                    while(resultSet.next()){
                        userNameDB = resultSet.getString("user_name");
                        passwordDB = resultSet.getString("password");
                        roleDB = resultSet.getString("usertype");
                        
                        if(userName.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("ADMIN"))
                            return "Admin_Role";
                        
                        else if(userName.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("USER"))
                            return "User_Role";
                        }
                    }

            catch(SQLException e){

                e.printStackTrace();
            }
            return "Invalid user credentials";
    }
}
