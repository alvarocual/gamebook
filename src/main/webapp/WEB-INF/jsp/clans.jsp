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

    <title>GameBook - Clans</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value="${s}/css/bootstrap.min.css" />" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<c:url value="${s}/css/clans.css" />" rel="stylesheet">
    
    <!-- Carousel CSS -->
    <link href="<c:url value="${s}/css/carousel.css" />" rel="stylesheet">
    
  </head>

  <body>
        <%@ include file="../jspf/header.jspf" %>
        
          <h2 class="sub-header">List of Clans</h2>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>Clan's name</th>
                  <th>Description</th>
                  <th>Game</th>
                  <th>Number of Members</th>
                  <th>Number of Events</th>
                  <th>Join Request</th>
                  <th>Leave Request</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${clans}" var="c" >
                <tr>
                  <td><a href="viewClan?id=${c.id}">${c.clanName}</a></td>
                  <td>${c.clanDescription}</td>
                  <td>${c.clanGame.gameName}</td>
                  <td>${c.memberCount}</td>
                  <td>${c.eventsCount}</td>
                  
                  <td>
                  	<form action="/joinClan" method="post">
	      	 			<input type = "hidden" name = "id" value = "${c.id}" />
	         			<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
	   
	         			<c:choose>
			         		<c:when test = "${user == null}">
                  				<button disabled = "true" class="btn btn-success">Join Clan</button>
                  	 		</c:when>
                  	 	<c:otherwise>
                  	 	<button class="btn btn-success">Join Clan</button>
                  	 	</c:otherwise>
                  		</c:choose>
	         		</form>
                  </td>
                  
                  <td>
		             <form action="/leaveClan" method="post">
						<input type = "hidden" name = "id" value = "${c.id}" />
			         	<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
			         	
					 	<c:choose>
		                  	<c:when test = "${user == null}">
		                  		<button disabled = "true" class="btn btn-danger">Leave Clan</button>
		                  	 </c:when>
		                  	 <c:otherwise>
		                  	 	<button class="btn btn-danger">Leave Clan</button>
		                  	 </c:otherwise>
		                  </c:choose>
					 </form>
                  </td>
                </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<c:url value="${s}/js/jquery.min.js"/>"></script>
    <script src="<c:url value="${s}/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="${s}/js/holder.min.js"/>"></script>
  </body>
</html>