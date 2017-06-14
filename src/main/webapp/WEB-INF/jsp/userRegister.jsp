<%@ page pageEncoding="utf-8" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

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
  
  	<sec:authorize access="isAnonymous()">
	  	<div class="container">
	        <div class="row centered-form">
	        	<div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
		        	<div class="panel panel-default">
		        		<div class="panel-heading">
					    	<h3 class="panel-title">Welcome, join us!</h3>
					 	</div>
					 	<div class="panel-body">
					 			
						    <form action="/userRegister" method="post">
							    
							    <h4> UserName:</h4>
							    <div class="form-group">			
						    		<input name="login" class="form-control input-sm" placeholder = "Name">
						    	</div>	
						    	
						    	<h4> Password:</h4>
						    	<div class="form-group">
						    		<input type ="password" name = "password" class="form-control input-sm" placeholder = "Password">
						    	</div>	
						    	
						    	<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
						    		
						    	<button type="submit" class="btn btn-info btn-block">Register</button>
						    </form>
						</div>
					</div>
		        </div>
	    	</div>
	    </div>
	</sec:authorize>
    
    <sec:authorize access="isAuthenticated()">
		<div class="container">
			<div class="row" style="margin-top: 50px;">
				<div class="col-md-12" style="text-align: center;">
					<h1>You have already sing in, please log out</h1>
				</div>
			</div>
		</div>
	</sec:authorize>
	
  </body>
</html>