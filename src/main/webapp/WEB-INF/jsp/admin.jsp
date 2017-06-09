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

    <title>GameBook - Admin</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value="${s}/css/bootstrap.min.css" />" rel="stylesheet">
    
    <!-- Carousel CSS -->
    <link href="<c:url value="${s}/css/carousel.css" />" rel="stylesheet">
  	<%@ include file="../jspf/header.jspf" %>
  </head>
  
  <body>
  	<div class="container">
      <div class="row">
        <div class="col-md-4">
          <h2 class="sub-header">Users</h2>
          <div class="table-responsive">
	            <table class="table table-striped">
	              <thead>
	                <tr>
	                  <th>Name</th>
	                  <th>Delete</th>
	                </tr>
	              </thead>
	              <tbody>
	                <c:forEach items="${users}" var="c" >
	                <tr>
	                  <td>${c.login}</td>
	                  <td> sit </td>
	                </tr>
	                </c:forEach>
	              </tbody>
	            </table>
	       </div>          
        </div>
        
        <div class="col-md-4">
          <h2 class="sub-header">Clans</h2>
          <div class="table-responsive">
	            <table class="table table-striped">
	              <thead>
	                <tr>
	                  <th>Name</th>
	                  <th>Delete</th>
	                </tr>
	              </thead>
	              <tbody>
	                <c:forEach items="${clans}" var="c" >
	                <tr>
	                  <td><a href="viewClan?id=${c.id}">${c.clanName}</a></td>
	                  <td>sit</td>
	                </tr>
	                </c:forEach>
	              </tbody>
	            </table>
	       </div>
       </div>
       
        <div class="col-md-4">
          <h2 class="sub-header">Events</h2>
          <div class="table-responsive">
	            <table class="table table-striped">
	              <thead>
	                <tr>
	                  <th>Name</th>
	                  <th>Delete</th>
	                </tr>
	              </thead>
	              <tbody>
	                <c:forEach items="${events}" var="c" >
	                <tr>
	                  <td><a href="viewEvent?id=${c.id}">${c.eventName}</a></td>
	                  <td> sit </td>
	                </tr>
	                </c:forEach>
	              </tbody>
	            </table>
	       </div>
          
        </div>
      </div>

      <hr>
      <footer>
        <p>&copy; 2017 Company, Inc.</p>
      </footer>
    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<c:url value="${s}/js/jquery.min.js"/>"></script>
    <script src="<c:url value="${s}/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="${s}/js/holder.min.js"/>"></script>
  </body>
</html>