<%@ page pageEncoding="utf-8" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>GameBook</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value="${s}/css/bootstrap.min.css" />" rel="stylesheet">

    

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]
    <script src="js/ie-emulation-modes-warning.js"></script>-->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Custom styles for this template -->
    <link href="<c:url value="${s}/index.css" />" rel="stylesheet">

    <!-- Carousel CSS -->
    <link href="<c:url value="${s}/css/carousel.css" />" rel="stylesheet">
	
  </head>
<!-- NAVBAR
================================================== -->
  <body>
    <div class="navbar-wrapper">
      <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="index">GameBook</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li><a href="clans">Clans</a></li>
                <li><a href="calendario">Calendar</a></li>
              </ul>
              <div id="navbar" class="navbar-collapse collapse">
              
			      <c:choose>
			         <c:when test = "${user == null}">
			            Welcome, guest!	
			            
			            <div>
						  <form class="navbar-form navbar-right" action="/login" method="post">
				            <div class="form-group">
				              <input type="text" placeholder="Email" name="username" class="form-control">
				            </div>
				            <div class="form-group">
				              <input type="password" placeholder="Password" name="password" class="form-control">
				            </div>
				            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				            <button type="submit" class="btn btn-success">Sign in</button>
				          </form>
				        </div><!--/.navbar-collapse -->		            
			         </c:when>
			         
			         <c:otherwise>
			   			<p>Welcome, <c:out value = "${user.login}"/> !</p>	
			   			
			   			
		
			   			<div>
						  <form class="navbar-form navbar-right" action="/logout" method="post">
						  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				            <button type="submit" class="btn btn-success">Log out</button>
				          </form>
				        </div><!--/.navbar-collapse -->		            
			         </c:otherwise>
		    	</c:choose>
	

            </div>
          </div>
        </nav>

      </div>
    </div>


    <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img class="first-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Join clans now and play!</h1>
              <p>You just have to sign up to send your join request to any open clan and play. Or you may like to open yours!</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="second-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>No just clans</h1>
              <p>Join clans is only the begining: you can also chat with your clans-mates, link tutorials or YouTube videos, share on your RRSS...</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="third-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Take a look.</h1>
              <p>On our gallery you can see those features yourself! click the button right down and see some captures of what you could do once you are in!</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div><!-- /.carousel -->

	<div>
		${steamInfo}
	</div>


    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container marketing">

      <!-- FOOTER -->
      <footer>
        <p></p>
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>&copy; 2016 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
      </footer>

    </div><!-- /.container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<c:url value="${s}/js/jquery.min.js"/>"></script>
    <script src="<c:url value="${s}/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="${s}/js/holder.min.js"/>"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! 
    <script src="../../assets/js/vendor/holder.min.js"></script>
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
    -->
  </body>
</html>