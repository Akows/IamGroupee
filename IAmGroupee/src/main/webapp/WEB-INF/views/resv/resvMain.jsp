<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.iag.resv.entity.ResvDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reserve_main</title>


	<!-- Theme style -->
	<link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
	<!-- Favicon -->
	<link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">

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
							<h1>내 예약</h1>
						</div>	

						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="http://127.0.0.1:8989/iag/main">Home</a></li>
								<li class="breadcrumb-item active">My Reservation</li>
							</ol>
						</div>
					</div>
				</div>
		</section>

	    <section class="content">
	        <div class="container-fluid">
				<div class="row">

					<section class="col-lg-4 connectedSortable">
						<!-- 예약 신청 -->
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">Reservation</h3>
							</div>
							
							<div class="card-body">
								<form action="" method="post">
									<div class="form-group">
										<label for="asset">예약할 자산</label>
										<select class="form-control" id="asset">
											<option>회의실A</option>
											<option>회의실B</option>
											<option>회의실C</option>
										</select>
									</div>
									  
									<div class="form-group">
										<label>예약자</label>
										<input readonly class="form-control" value="${loginUser.name}"> 
									</div>
							
									<!-- Date and time range -->
									<div class="form-group">
										<label for="reservationtime">예약일자 & 시간</label>
										<div class="input-group">
											<div class="input-group-prepend">
												<span class="input-group-text"><i class="far fa-clock"></i></span>
											</div>
											<input type="text" class="form-control float-right" id="reservationtime">
										</div>
									</div>
									
								</form> 

								<input type="submit" value="예약하기" class="btn btn-primary btn-block">
							</div>
						</div>

						<!-- 내 예약 현황 -->
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">내 예약 현황</h3>
							</div>
							<div class="card-body">

							</div>
						</div>

					</section>
	
					<section class="col-lg-8 connectedSortable">
						<div class="card">
							<div class="card-body p-3">
								<!-- THE CALENDAR -->
								<div id="calendar"></div>
							</div>
						</div> 
					</section> <!-- /.col -->

				</div>  <!-- /.row -->
	        </div> <!-- /.container-fluid -->
	    </section>
	</div>
	</main>

 
	<script>
		$(function () {
			//Date range picker with time picker
			$('#reservationtime').daterangepicker({
			timePicker: true,
			timePickerIncrement: 30,
			locale: {
				format: 'MM/DD/YYYY hh:mm A'
				}
    		})
		})

		var request = $.ajax({
			url: "<%=request.getContextPath()%>/resv/resvMain",
			method: "GET",
			dataType: "json"
		});

		document.addEventListener('DOMContentLoaded', function(data) {
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

				// eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
				// 	console.log(obj);
				// },
				// eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
				// 	console.log(obj);
				// },
				// eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
				// 	console.log(obj);
				// },
				// select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
				// 	var title = prompt('Event Title:');
				// 	if (title) {
				// 	calendar.addEvent({
				// 	title: title,
				// 	start: arg.start,
				// 	end: arg.end,
				// 	allDay: arg.allDay
				// 	})
				// 	}
				// 	calendar.unselect()
				// }
			
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

	<!-- InputMask -->
	<script src="${root}/resources/plugins/moment/moment.min.js"></script>
	<script src="${root}/resources/plugins/inputmask/jquery.inputmask.min.js"></script>
	
    <!-- date-range-picker -->
	<link rel="stylesheet" href="${root}/resources/plugins/daterangepicker/daterangepicker.css">
	<script src="${root}/resources/plugins/daterangepicker/daterangepicker.js"></script> 

</body>
</html>