<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Home</title>
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
  <div class="container">
    <div class="row">
      <div class="grid_12">
       
       <h2 style= "color: black">Welcome User ${user.userName} </h2>
        
        <h2 class="ta__center"><br/></h2>
        <h1></h1>
        <div class="shuffle-group">
          <div class="row">
            <div class="grid_8">
              <div data-si-mousemove-trigger="100"  class="shuffle-me offset__1">
                
              </div>
            </div>
            </div>
          </div>
      </div>
    </div>
  </div>
  <div class="sep-1"></div>
  <div class="container">
    <div class="row">
      <div class="grid_8">
        
      </div>
      <div class="grid_4">
        
      </div>
    </div>
  </div>
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

    