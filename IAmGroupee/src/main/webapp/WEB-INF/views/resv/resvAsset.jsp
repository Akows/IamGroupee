<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reserve_asset</title>
	
	<!-- Theme style -->
	<link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
	<!-- Favicon -->
	<link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">
    <!-- adminLTE CDN -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.1/dist/css/adminlte.min.css">

	<!-- fullcalendar 언어 CDN -->
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>

</head>
<body>

	<%@ include file="/WEB-INF/views/common/headerSide.jsp" %>
		
	<main class="main">
	<div class="container">

		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>자산별 예약현황</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="http://127.0.0.1:8989/iag/main">Home</a></li>
							<li class="breadcrumb-item active">Asset Reservations</li>
						</ol>
					</div>
				</div>
			</div><!-- /.container-fluid -->
		</section>

		<section class="content-body">
			<div class="container-fluid">
				<div class="row">
				
					<section class="col-md-3 connectedSortable">
						<div class="sticky-top mb-3">
						<div class="card">
							<div class="card-header"><h4 class="card-title">회의실 목록</h4></div>
							<div class="card-body">
								<c:forEach items="" var="i">
									<button id="add-new-event" type="button" class="btn btn-primary">${}</button>
								</c:forEach>
							</div> <!-- /.card-body -->
						</div>
						<div class="card">
							<div class="card-header"><h3 class="card-title">자산 목록</h3></div>
							<div class="card-body">
							
							</div>
						</div>
						</div>
					</section><!-- /.col -->

					<section class="col-md-9 connectedSortable">
						<div class="card">
							<div class="card-body p-3">
								<!-- THE CALENDAR -->
								<div id="calendar"></div>
							</div>
						</div> 
					</section> 
					
				</div> <!-- /.row -->
			</div> <!-- /.container-fluid -->
		</section>

	</div>
	</main>
	
	
	<script>

		document.addEventListener('DOMContentLoaded', function() {
		  var calendarEl = document.getElementById('calendar');
		  var calendar = new FullCalendar.Calendar(calendarEl, {
			googleCalendarApiKey: 'AIzaSyAs1UZKO49dOGkrpX3qeYNU0wZx_vbq1Co',
				eventSources:{
					googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
					className: '대한민국의 휴일',
					color : '#DD5246'
				},
				headerToolbar: {
					left: 'prev,next today',
					center: 'title',
					right: 'dayGridMonth,timeGridWeek,timeGridDay'
				},
				slotMinTime: '08:00', // Day 캘린더에서 시작 시간
				slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
				initialView: 'dayGridMonth',
				navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
				selectable: true, // 달력 일자 드래그 설정가능
				nowIndicator: true, // 현재 시간 마크
				dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
				locale: 'ko', // 한국어 설정

		  });
		  calendar.render();
		});

	</script>

	<%@ include file="/WEB-INF/views/common/footer.jsp" %>

	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>

	<!-- FullCalendar -->
	<link rel="stylesheet" href="${root}/resources/plugins/fullcalendar/main.css">
	<script src="${root}/resources/plugins/moment/moment.min.js"></script>
	<script src="${root}/resources/plugins/fullcalendar/main.js"></script> 

</body>
</html>