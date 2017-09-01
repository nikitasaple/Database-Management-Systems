<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Login</title>
<meta charset="utf-8">
<meta name = "format-detection" content = "telephone=no" />
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="css/style.css">
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.1.1.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/script.js"></script> 
<script src="js/superfish.js"></script>
<script src="js/jquery.equalheights.js"></script>
<script src="js/jquery.mobilemenu.js"></script>
<script src="js/tmStickUp.js"></script>
<script src="js/jquery.ui.totop.js"></script>
<script src="js/jquery.shuffle-images.js"></script>
<script>
 $(window).load(function(){
  $().UItoTop({ easingType: 'easeOutQuart' });
  $('#stuck_container').tmStickUp({});  
 }); 

 $(document).ready(function(){
       $(".shuffle-me").shuffleImages({
         target: ".images > img"
       });
    });

</script>
</head>

<body>
<header>
  <div class="header_top">
    
  </div>
  <section id="stuck_container">
    <div class="container">
      <div class="row">
        <div class="navigation">
            <nav>
              <ul class="sf-menu">
               <li class="current"><a href="Index.jsp">Home</a></li>
               
               <li><a href="login1.htm" target="contents">Login</a></li>
              </ul>
            </nav>
            <div class="clear"></div>
          </div>       
         <div class="clear"></div>  
        </div>
     </div> 
  </section>
</header>
<section id="content">
<br/>
<center>
<h2 style= "color: black">Login</h2>
</center>

<form:form action="login1.htm" commandName="user" method="post">
<center>
<table>
<tr>
    <td style="color:black">User Name:</td>
    <td><form:input path="userName" size="30" /> <font color="red"><form:errors path="userName"/></font></td>
</tr>

<tr>
    <td style="color:black"><br/><br/>Password:</td>
    <td><br/><br/><form:input path="password" size="30" /> <font color="red"><form:errors path="password"/></font></td>
</tr>
<tr>
<td><br/><br/><input type = "submit" class="btn" value="Login"></td>
</tr>
<tr>
<td><br/><br/>
<p style= "color: black">Not a Member Yet? <a href="register.htm" style="color: maroon;">Click Here</a></p></td>
</tr>
</table>
</center>
</form:form>
</section>
<footer id="footer">
  <div class="container">
    <div class="row">
      <div class="grid_12"> 
        <br/><br/>
       
      </div>
    </div>
  </div>  
</footer>

</body>
</html>

    