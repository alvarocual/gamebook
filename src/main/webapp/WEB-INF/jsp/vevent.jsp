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

    <title>Event View</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value="${s}/css/bootstrap.min.css" />" rel="stylesheet">

	<!-- Carousel CSS -->
    <link href="<c:url value="${s}/css/carousel.css" />" rel="stylesheet">
    
  </head>

  <body>
    <%@ include file="../jspf/header.jspf" %>

    <div class="container">

      <div class="row row-offcanvas row-offcanvas-right">
          <div class="jumbotron">
	         <div class="row">
	          	<div class="col-xs-6 col-lg-4">
	            	<h1>${event.eventName}</h1>
	            </div>
	            <div class="col-xs-6 col-lg-4">
	            <h3>${event.eventDescription}</h3>
	            <h3>${event.eventGame.gameName}</h3>
	            <h4>Fecha inicio: ${event.ini} / Fecha fin: ${event.fin}</h4>
	            </div>
	            <div class="col-xs-6 col-lg-4">
	            	<form action="/joinEvent" method="post">
			      	 	<input type = "hidden" name = "id" value = "${event.id}" />
			         	<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
			   
			         	<c:choose>
					         <c:when test = "${user == null}">
		                  		<button disabled = "true" class="btn btn-success">Join Event</button>
		                  	 </c:when>
		                  	 <c:otherwise>
		                  	 	<button class="btn btn-success">Join Event</button>
		                  	 </c:otherwise>
		                  </c:choose>
	         		</form>
			 		<form action="/leaveEvent" method="post">
			      	 	<input type = "hidden" name = "id" value = "${event.id}" />
			         	<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
			   
			         	<c:choose>
					         <c:when test = "${user == null}">
		                  		<button disabled = "true" class="btn btn-danger">Leave Event</button>
		                  	 </c:when>
		                  	 <c:otherwise>
		                  	 	<button class="btn btn-danger">Leave Event</button>
		                  	 </c:otherwise>
		                  </c:choose>
	         		</form>
	            </div>
	         </div>
          </div>
          
          <div class="row">
            <div class="col-xs-6 col-lg-4">
		        <h2 class="sub-header">Clan List</h2>
		        <div class="table-responsive">
				        <table class="table table-striped">
				            <thead>
				                <tr>
				                  <th>Name</th>
				                  <th>Game</th>
				                  <th>Description</th>
				                  <th>Members</th>
				                </tr>
				            </thead>
				            <tbody>
				                <c:forEach items="${event.clans}" var="c" >
				                <tr>
				                  <td><a href="viewClan?id=${c.id}">${c.clanName}</a></td>
				                  <td> ${c.clanGame.gameName}</td>
				                  <td> ${c.clanDescription}</td>
				                  <td> ${c.memberCount}</td>
				                </tr>
				                </c:forEach>
				            </tbody>
				        </table>
			        </div>
            </div><!--/.col-xs-6.col-lg-4--> 
            
            <div class="col-xs-6 col-lg-4">
              <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		            
		        <h2 class="sub-header">Member List</h2>
		        <div class="table-responsive">
				        <table class="table table-striped">
				            <thead>
				                <tr>
				                  <th>Name</th>
				                </tr>
				            </thead>
				            <tbody>
				                <c:forEach items="${event.members}" var="c" >
				                <tr>
				                  <td> ${c.login}</td>
				                </tr>
				                </c:forEach>
				            </tbody>
				        </table>
			        </div>
		        </div>
            </div><!--/.col-xs-6.col-lg-4--> 
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
  </body>
</html>