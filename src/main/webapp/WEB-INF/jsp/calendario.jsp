<%@ page pageEncoding="utf-8" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<title>Gamebook-Calendario</title>
	
 	<!-- Bootstrap core CSS -->
    	<link href="<c:url value="${s}/css/bootstrap.min.css" />" rel="stylesheet">
    	
    <!-- Carousel CSS -->
    	<link href="<c:url value="${s}/css/carousel.css" />" rel="stylesheet">
    	
    	
<meta charset='utf-8' />
<link href="<c:url value="${s}/css/fullcalendar.min.css" />" rel="stylesheet" />
<link href="<c:url value="${s}/css/fullcalendar.print.min.css" />" rel="stylesheet" media="print" />
<script src="<c:url value="${s}/js/moment.min.js"/>"></script>
<script src="<c:url value="${s}/js/jquery.min.js"/>"></script>
<script src="<c:url value="${s}/js/fullcalendar.min.js"/>"></script>

<script>

	$(document).ready(function() {
		
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,basicWeek,basicDay'
			},
			defaultDate: '2017-04-12',
			navLinks: true, // can click day/week names to navigate views
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: ${events}
		});
		
	});

</script>
<style>

	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 900px;
		margin: 0 auto;
		margin-top: 150px;
	}

</style>
<%@ include file="../jspf/header.jspf" %>
</head>

<body>
	<div id='calendar'></div>

</body>
</html>