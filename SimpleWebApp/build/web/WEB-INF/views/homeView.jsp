<%-- 
    Document   : homeView
    Created on : 17.sep.2017, 02:03:05
    Author     : mathi
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
     <meta charset="UTF-8">
     <title>Home Page</title>
  </head>
  <body>
 
     <jsp:include page="_header.jsp"></jsp:include>
     <jsp:include page="_menu.jsp"></jsp:include>
    
      <h3>Home Page</h3>
      <img src="http://tflip.uia.no/images/uia_logo.gif" alt="uia_logo" style="width:600px;height:100px;"><br>
      
    <!-- Add a placeholder for the Twitch embed -->
    <div id="twitch-embed"></div>

    <!-- Load the Twitch embed script -->
    <script src="https://embed.twitch.tv/embed/v1.js"></script>

    <!-- Create a Twitch.Embed object that will render within the "twitch-embed" root element. -->
    <script type="text/javascript">
      new Twitch.Embed("twitch-embed", {
        width: 1500,
        height: 600,
        channel: "shroud"
      });
    </script>
      
      <br>
      
      
      <iframe src="https://open.spotify.com/embed/user/1148996738/playlist/5rbyIO9Smt6hlML3x98gIA" width="600" height="300" frameborder="0" allowtransparency="true" allow="encrypted-media"></iframe>
      
      <form method="GET" action="${pageContext.request.contextPath}/ProgressMenuAdminSearch">
          <table border="0">
              
              <tbody>
                  <tr>
                      <td>Studentsøk: </td>
                      <td> <input type="text" name="name" value="${useraccount.name}" size="50" /> </td>
                  </tr>
              </tbody>
          </table>
          &nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;
          <input type="submit" value="Submit" /> 
      </form>
      
     
    
    <textarea name="txtReason" id="txtReason" style="display: none;" class="textboxmulti">
 
─────────▄▄───────────────────▄▄──
──────────▀█───────────────────▀█─
──────────▄█───────────────────▄█─
──█████████▀───────────█████████▀─
───▄██████▄─────────────▄██████▄──
─▄██▀────▀██▄─────────▄██▀────▀██▄
─██────────██─────────██────────██
─██───██───██─────────██───██───██      Hvorfor er du her å lurker rundt?
─██────────██─────────██────────██
──██▄────▄██───────────██▄────▄██─      Gå heller å se på denne videoen:
───▀██████▀─────────────▀██████▀──      https://www.youtube.com/watch?v=7ohbr90cKDc
──────────────────────────────────
──────────────────────────────────
──────────────────────────────────
───────────█████████████──────────
──────────────────────────────────
──────────────────────────────────

</textarea>
  </body>
</html>