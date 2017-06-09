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
    
    <!-- Carousel CSS -->
    <link href="<c:url value="${s}/css/carousel.css" />" rel="stylesheet">

  </head>

  <body>
    <%@ include file="../jspf/header.jspf" %>

    <div class="container">

      <div class="row row-offcanvas row-offcanvas-right">
          <p class="pull-right visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
          </p>
          <div class="jumbotron">
          <div class="row">
          	 <div class="col-xs-6 col-lg-4">
	          	<h1>${clan.clanName}</h1>
	         </div>
	         <div class="col-xs-6 col-lg-4"> 	
	          	<h3>Game: ${clan.clanGame}</h3>
	          	<p>${clan.clanDescription}</p>
	         </div>
          	</div>
          </div>
          
          <div class="row">
	          <div class="col-xs-6 col-lg-4">
	            	<h2 class="sub-header">Member list</h2>
	            	<div class="table-responsive">
			            <table class="table table-striped">
			              <thead>
			                <tr>
			                  <th>Name</th>
			                </tr>
			              </thead>
			              <tbody>
			                <c:forEach items="${clan.members}" var="m">
			                <tr>
			                  <td> ${m.login}</td>
			                </tr>
			                </c:forEach>
			              </tbody>
			            </table>
		            </div>
	            </div><!--/.col-xs-6.col-lg-4-->
            
            <div class="col-xs-6 col-lg-4">
              <h2 class="sub-header">Next Events of Clan</h2>
              <div class="table-responsive">
		            <table class="table table-striped">
		              <thead>
		                <tr>
		                  <th>Name</th>
		                  <th>Description</th>
		                  <th>Game</th>
		                </tr>
		              </thead>
		              <tbody>
		                <c:forEach items="${clan.events}" var="e">
		                <tr>
		                  <td> <a href="viewEvent?id=${e.id}">${e.eventName}</a></td>
		                  <td> ${e.eventDescription}</td>
		                  <td> ${e.eventGame.gameName}</td>
		                </tr>
		                </c:forEach>
		              </tbody>
		            </table>
	            </div>         
	      	</div><!--/.col-xs-6.col-lg-4-->
          </div><!--/row-->

        
      </div><!--/row-->

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
  </body>
</html>