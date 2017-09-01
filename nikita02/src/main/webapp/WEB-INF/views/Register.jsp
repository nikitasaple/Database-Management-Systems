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
               <li><a href="Index.jsp">Create Through Tutorials</a></li>
              
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
		<h2 style= "color: black">Who are you ?</h2>
	</center>
<center>

	<table class="nikitaple">
		<tr>
			<td colspan="2">
				<center><a href="managerReg.htm" class="btn1">Manager</a></center></td>
			<td colspan="2">
				<center><a href="personReg.htm" class="btn1">Person</a></center></td>
		</tr>
	</table>

</center>
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

    