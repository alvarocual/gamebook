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

    
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="<c:url value="../../assets/css/ie10-viewport-bug-workaround.css" />" rel="stylesheet">
    
    <!-- Custom styles for this template -->
    <link href="<c:url value="${s}/css/clans.css" />" rel="stylesheet">
    
     <!-- Carousel CSS -->
    	<link href="<c:url value="${s}/css/carousel.css" />" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <%@ include file="../jspf/header.jspf" %>
  </head>

  <body>
        
          <h2 class="sub-header">List 15 Clans</h2>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>Clan's name</th>
                  <th>Game</th>
                  <th>Number of Members</th>
                  <th>Join Request</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${clans}" var="c" >
                <tr>
                  <td><a href="viewClan?id=${c.id}">${c.clanGame}</a></td> 	<!-- ESTO ES UNA TIRITA. REVISARLO -->
                  <td>${c.clanName}</td>
                  <td>${c.memberCount}</td>
                  <td>sit</td>
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
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>