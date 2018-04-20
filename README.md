# Schoolwork
Some of my projects and programs

### Folders with java code I made: Project SimpleWebApp
[Admin Files](Java/SimpleWebApp/src/java/Admin)&emsp;<br>
[Connection Files](Java/SimpleWebApp/src/java/Connection)<br>
[Filter Files](Java/SimpleWebApp/src/java/Filter)<br>
[Log in/Log out Files](Java/SimpleWebApp/src/java/LoginLogout)<br>
[Uploading of Files](Java/SimpleWebApp/src/java/Uploads)<br>
[UserInformation File](Java/SimpleWebApp/src/java/User/UserInfoStud.java)<br>
### Single files with java code I made: Project SimpleWebApp
[CreateStudent File](Java/SimpleWebApp/src/java/Admin/CreateStudentServlet.java)<br>
[Feedback File](Java/SimpleWebApp/src/java/Feedback/Feedback.java)<br>
[UserInformation File](Java/SimpleWebApp/src/java/User/UserInfoStud.java)<br>

### JSP Files correlating with folders: Project SimpleWebApp
#### Admin Folder
[Create Student JSP](Java/SimpleWebApp/web/WEB-INF/views/createStudentView.jsp)<br>
[Delete Error JSP](Java/SimpleWebApp/web/WEB-INF/views/deleteStudentErrorView.jsp)<br>
[Edit Student JSP](Java/SimpleWebApp/web/WEB-INF/views/editStudentView.jsp)<br>
[Student List JSP](Java/SimpleWebApp/web/WEB-INF/views/studentsListView.jsp)<br>
[Student List JSP](Java/SimpleWebApp/web/WEB-INF/views/userInfoView.jsp)<br>
#### LoginLogout Folder
[Student List JSP](Java/SimpleWebApp/web/WEB-INF/views/loginView.jsp)<br>
#### Uploads Folder
[Displaying Files JSP](Java/SimpleWebApp/web/WEB-INF/views/files.jsp)<br>
[Upload To DB Result JSP](Java/SimpleWebApp/web/WEB-INF/views/uploadToDBResults.jsp)<br>
[Upload To DB JSP](Java/SimpleWebApp/web/WEB-INF/views/uploadToDB.jsp)<br>
[Displaying Files JSP](Java/SimpleWebApp/web/WEB-INF/views/files.jsp)<br>
#### Additional Relevant JSP's
[Header JSP](Java/SimpleWebApp/web/WEB-INF/views/_header.jsp)<br>
[Menu JSP](Java/SimpleWebApp/web/WEB-INF/views/_menu.jsp)<br>

### SQL File: Project SimpleWebApp
[SQL Code](SQL%20needed%20for%20Java.SimpleWebApp/skybase.sql)<br>

### Textbased Housemarket
[HouseMarket Main](Java/Hus%20Til%20Salgs/Main.java)<br>
[Bolig File](Java/HusRevamp/Bolig.java)<br>
[Hus File](Java/HusRevamp/Hus.java)<br>
[Leilighet File](Java/HusRevamp/Leilighet.java)<br>
[HouseMarket logic File](Java/HusRevamp/BoligMarked.java)<br>
>There is more in all the folders!

* A short code of the famous FizzBuzz

```

1. // @author Mathias
2. 
3. public class FizzBuzz {
4.
5.    public static void main(String[] args) {
6.        int i=1;
7.        
8.        for(i = 1; i <= 100; i++){
9.            String output = "";
10.            
11.            if(i%3 == 0){
12.                output += "Fizz";
13.            }
14.            if(i%5 == 0){
15.                output += "Buzz";
16.            }
17.            
18.            if(output == ""){
19.                System.out.print(i);
20.            }
21.            System.out.println(output);
22.     }
23.   }
24. }
```
