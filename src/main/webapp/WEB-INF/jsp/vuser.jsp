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

    <title>Clan view</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value="${s}/css/bootstrap.min.css" />" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<c:url value="${s}/vuser.css" />" rel="stylesheet">
    
     <!-- Carousel CSS -->
    <link href="<c:url value="${s}/css/carousel.css" />" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
    <%@ include file="../jspf/header.jspf" %>

    <div class="container">

      <div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-12 col-sm-9">
          <div class="jumbotron"> 
          	<div class="row">
	          	<div class="col-xs-6 col-lg-4">
	          		<img src="static/img/unknown-user.jpg" WIDTH=125 HEIGHT=125>
	          	</div>
	          	<div class="col-xs-6 col-lg-4">
	          		<h2>${user.login}</h2>
	            	<p>Bienvenido a su pagina de usuario</p>
	          	</div>
          	</div>
          </div>
          
          <div class="row">
	          <div class="col-xs-6 col-lg-4">
		          <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		            
		            	<h2 class="sub-header">Games</h2>
		            	<div class="table-responsive">
				            <table class="table table-striped">
				              <thead>
				                <tr>
				                  <th>Name</th>
				                  <th>Descripcion</th>
				                </tr>
				              </thead>
				              <tbody>
				                <c:forEach items="${user.games}" var="c" >
				                <tr>
				                  <td> ${c.gameName}</td>
				                  <td> ${c.gameDescription}</td>
				                </tr>
				                </c:forEach>
				              </tbody>
				            </table>
			            </div>
		            </div>
	            </div><!--/.col-xs-6.col-lg-4-->
            
            <div class="col-xs-6 col-lg-4">
              <h2 class="sub-header">Clans</h2>
              <div class="table-responsive">
		            <table class="table table-striped">
		              <thead>
		                <tr>
		                  <th>Name</th>
		                  <th>Game</th>
		                  <th>Number of members</th>
		                  <th>Leave clan</th>
		                </tr>
		              </thead>
		              <tbody>
		                <c:forEach items="${user.clans}" var="c" >
		                <tr>
		                  <td><a href="viewClan?id=${c.id}">${c.clanGame}</a></td> <!-- ESTO ES UNA TIRITA. REVISARLO -->
		                  <td> ${c.clanName}</td>
		                  <td> ${c.memberCount}</td>
		                  <td> sit </td>
		                </tr>
		                </c:forEach>
		              </tbody>
		            </table>
	            </div>         
	      	</div><!--/.col-xs-6.col-lg-4-->
          </div><!--/row-->
        </div><!--/.col-xs-12.col-sm-9-->

        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
          <div class="list-group">
             <h2 class="sub-header">Event list</h2>
             <div class="table-responsive">
	            <table class="table table-striped">
	              <thead>
	                <tr>
	                  <th>Name</th>
	                  <th>Game</th>
	                  <th>Description</th>
	                  <th>Leave Event</th>
	                </tr>
	              </thead>
	              <tbody>
		                <c:forEach items="${user.events}" var="e" >
		                <tr>
		                  <td><a href="/viewEvent?id=${e.id}">${e.eventName}</a></td> <!-- ESTO ES UNA TIRITA. REVISARLO -->
		                  <td> ${e.eventGame.gameName}</td>
		                  <td> ${e.eventDescription}</td>
		                  <td> sit</td>
		                </tr>
		                </c:forEach>
		           </tbody>
		        </table>
          </div>
        </div><!--/.sidebar-offcanvas-->
      </div><!--/row-->
      
      </div>

      <hr>

      <footer>
        <p>&copy; 2017 Company, Inc.</p>
      </footer>

    </div><!--/.container-->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<c:url value="${s}/js/jquery.min.js"/>"></script>
    <script src="<c:url value="${s}/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="${s}/js/holder.min.js"/>"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
    <script src="offcanvas.js"></script>
  </body>
</html>