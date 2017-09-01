<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>register</title>
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
               <li><a href="Index.jsp">Create Through Tutorials</a></li>
               <li><a href="Index.jsp">Buy Models</a></li>
               <li><a href="login1.htm" target="contents">Login</a></li>
               <li><a href="Index.jsp">Cart</a></li>
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
		<h2 style= "color: black">Manager Register</h2>
	</center>
	
	<form:form action="managerReg.htm" commandName="manager" method="post">
				<center>
			<table>
				<tr>
				    <td style="color:black">First Name:</td>
				    <td><form:input path="firstName" size="30" pattern="[a-zA-Z]*"  required = "true" /> <font color="red"><form:errors path="firstName"/></font></td>
				</tr>
				
				<tr>
				    <td style="color:black"><br/>Last Name:</td>
				    <td><br/><form:input path="lastName" size="30" pattern="[a-zA-Z]*"  required = "true" /> <font color="red"><form:errors path="lastName"/></font></td>
				</tr>
				
				<tr>
				    <td style="color:black"><br/>User Name:</td>
				    <td><br/><form:input path="userName" size="30" pattern="[a-zA-Z]*"  required = "true" /> <font color="red"><form:errors path="userName"/></font></td>
				</tr>
				
				<tr>
				<td style="color:black"><br/>Password:</td>
				<form:input path="password" required = "true" title="Minimum length of password should be 6 characters." type="password"/></tr>				
				
				<tr>
				    <td style="color:black"><br/>Email ID:</td>
				    <td><br/><form:input path="email" size="30" type="email"  required = "true" /> <font color="red"><form:errors path="email"/></font></td>
				</tr>
				
				<tr>
				    <td style="color:black"><br/>Gender:</td>
				    <td><br/><input type="radio" name="gender" value="male" checked> Male        
  					<input type="radio" name="gender" value="female"> Female</td>
				</tr>
				
				<tr>
				    <td style="color:black"><br/>Phone:</td>
				    <td><br/><form:input path="phone" size="30" /> <font color="red"><form:errors path="phone"/></font></td>
				</tr>
				
				<tr>
				<td><br/>
				<input type = "submit" class="btn" value="Submit"></td>
				<td><br/>
				<center>
				<a href="managerReg.htm" class="btn">Clear</a></center></td>
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

    