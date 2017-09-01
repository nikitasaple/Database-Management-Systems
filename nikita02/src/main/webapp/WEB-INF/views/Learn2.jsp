<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Learn</title>
<meta charset="utf-8">
<meta name = "format-detection" content = "telephone=no" />
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="css/touchTouch.css">

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
<script src="js/touchTouch.jquery.js"></script>

<script>
 $(window).load(function(){
  $().UItoTop({ easingType: 'easeOutQuart' });
  $('#stuck_container').tmStickUp({}); 
    $('.gallery .gall_item').touchTouch();
 }); 

</script>
</head>

<body class="page1" id="top">
<header>
  <div class="header_top">
    
  </div>
  <section id="stuck_container">
    <div class="container">
      <div class="row">
        <div class="navigation">
            <nav>
              <ul class="sf-menu">
               <li><a href="home.htm">Home</a></li>
               <li class="current"><a href="displayissues.htm">Create Through Tutorials</a></li>
              
               <li><a href="login1.htm" target="contents">LogOut</a></li>
               
               
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
<c:forEach var="model" items="${issues}">
      <div class="grid_4">
        <div class="box">
         <a href="${model.image}" class="gall_item" ><img src="${model.image}" alt=""><span></span></a>
          <div class="box_bot">
            <div class="box_bot_title">${model.title}</div>
            <p>${model.description}</p>
          </div>
        </div>
      </div>
  </c:forEach>
</section>
<footer id="footer">
  <div class="container">
    <div class="row">
      <div class="grid_12"> 
        <br/><br/>
        
    </div>
  </div>  
</footer>

</body>
</html>

    