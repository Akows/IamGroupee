<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<%@ page import="com.kh.iag.resv.entity.ResvDto"%>
<% 
	List<ResvDto> allRoomResvList = (List<ResvDto>)request.getAttribute("allRoomResvList");	
	List<ResvDto> allAssetResvList = (List<ResvDto>)request.getAttribute("allAssetResvList");	
	List<ResvDto> roomResvList = (List<ResvDto>)request.getAttribute("roomResvList");
	List<ResvDto> assetResvList = (List<ResvDto>)request.getAttribute("assetResvList"); 
	List<ResvDto> roomList = (List<ResvDto>)request.getAttribute("roomList");
	List<ResvDto> assetList = (List<ResvDto>)request.getAttribute("assetList");
%>
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

	<style>
		select option[value=""][disabled] {
			display: none;
		}
	</style>
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
								<form action="delete" method="post">
									<div class="form-group">
										<label>예약할 자산</label>
										<select class="form-control" name="roomNo" >
											<option value="" disabled selected>예약할 회의실을 선택하세요</option>
											<c:forEach items="${roomList}" var="r">
												<option value="${r.roomNo}">${r.roomName}</option>
											</c:forEach>
										</select>
										<select class="form-control" name="assetNo" >
											<option value="" disabled selected>예약할 자산을 선택하세요</option>
											<c:forEach items="${assetList}" var="a">
												<option value="${a.assetNo}">${a.assetName}</option>
											</c:forEach>
										</select>
									</div>
									  
									<div class="form-group">
										<label>예약자</label>
										<input readonly class="form-control" value="${loginUser.name}"> 
										<input type="hidden" name="userNo" value="${loginUser.userNo}">
									</div>
							
									<!-- Date and time range -->
									<div class="form-group">
										<label for="reservationtime">예약일자 & 시간</label>
										<div class="input-group">
											<div class="input-group-prepend">
												<span class="input-group-text"><i class="far fa-clock"></i></span>
											</div>
											<input type="text" class="form-control float-right" name="period" id="reservationtime">
										</div>
									</div>
									
									<input id="addEvent" type="submit" value="예약하기" class="btn btn-primary btn-block">
								</form> 

							</div>
						</div>

						<!-- 내 예약 현황 -->
						<div class="card">
							<form name="form" method="post"> 
							<div class="card-header">
								<h3 class="card-title">
									내 예약 현황
									<button onclick="updateCheck()" name="action" value="update" class="btn btn-primary btn-sm">수정</button>
									<button onclick="returnCheck()" name="action" value="return" class="btn btn-primary btn-sm">반납</button>
									<button onclick="deleteCheck()" name="action" value="delete" class="btn btn-primary btn-sm">취소</button>
								</h3>
							</div>
							<div class="card-body">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th></th>
											<th>항목</th>
											<th>기간</th>
											<th>상태</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach  items="${roomResvList}" var="r">
											<tr>
												<td><input name="resvNo" value="${r.resvNo}" type="checkbox"></td>
												<td>
													<c:set var="m" value="${r.roomName}"></c:set>
													<c:if test="${m ne ''}">
														${r.roomName}
													</c:if>
													<c:set var="a" value="${r.assetName}"></c:set>
													<c:if test="${a ne ''}">
														${r.assetName}
													</c:if>
												</td>
												<td>${r.period}</td>
												<td>${r.returnYn}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							</form>
						</div>
					</section>
	
					<section class="col-lg-8 connectedSortable">
						<div class="card">
							<div class="card-body p-3">
								<!-- THE CALENDAR -->
								<div id="calendar"></div>
								<div class="modal fade" tabindex="-1" role="dialog">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
												<h4 class="modal-title">Create new event</h4>
											</div>
											<div class="modal-body">
												<div class="row">
													<div class="col-xs-12">
														<label class="col-xs-4" for="title">Event title</label>
														<input type="text" name="title" id="title" />
													</div>
												</div>
												<div class="row">
													<div class="col-xs-12">
														<label class="col-xs-4" for="starts-at">Starts at</label>
														<input type="text" name="starts_at" id="starts-at" />
													</div>
												</div>
												<div class="row">
													<div class="col-xs-12">
														<label class="col-xs-4" for="ends-at">Ends at</label>
														<input type="text" name="ends_at" id="ends-at" />
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
												<button type="button" class="btn btn-primary" id="save-event">Save changes</button>
											</div>
										</div><!-- /.modal-content -->
									</div><!-- /.modal-dialog -->
								</div><!-- /.modal -->
							</div>
						</div> 
					</section> <!-- /.col -->

				</div>  <!-- /.row -->

				<section>
					
				</section>

	        </div> <!-- /.container-fluid -->
	    </section>
	</div>
	</main>

	<script>
		$(function () {
			//Date range picker with time picker
			$('#reservationtime').daterangepicker({
			timePicker: true,
			timePickerIncrement: 10,
			timePicker24Hour: true,
			timePickerSeconds: true,
			locale: {
				"separator": "~",               // 시작일시와 종료일시 구분자
				"format": 'YYYY-MM-DD HH:mm',     // 일시 노출 포맷
				"applyLabel": "확인",              // 확인 버튼 텍스트
				"cancelLabel": "취소",             // 취소 버튼 텍스트
				"daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
				"monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
				}
    		})
		});

		var request = $.ajax({
			url: "<%=request.getContextPath()%>/resv/resvMain",
			method: "GET",
			dataType: "json"
		});

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
				
				eventAdd: function() {
				},
				eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
					console.log(obj);
				},
				eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
					console.log(obj);
				},
				events : 
				[ 
					<%if (allRoomResvList != null || allAssetResvList != null ) {%>
						<%for (ResvDto r : allRoomResvList) {%>
							{
								title : '<%=r.getRoomName()%>',
								start : '<%=r.getResvStart()%>',
								end : '<%=r.getResvEnd()%>',
								color : '#2D82D7'
							},
						<%}%>
						<%for (ResvDto a : allAssetResvList) {%>
							{
								title : '<%=a.getAssetName()%>',
								start : '<%=a.getResvStart()%>',
								end : '<%=a.getResvEnd()%>',
								color : '#28a745'
							}
						<%}
					}%>
				]
				
			
			});
			calendar.render();
	
		});

		function updateCheck(){
			if(confirm("선택한 예약을 수정하시겠습니까?") == true){
				document.update.submit();
			}else {
				return false;
			}
		}

		function returnCheck(){
			if(confirm("선택한 예약을 미리 반납하시겠습니까?") == true){
				document.return.submit();
			}else {
				return false;
			}
		}

		function deleteCheck(){
			if(confirm("선택한 예약을 취소하시겠습니까?") == true){
				document.delete.submit();
			}else {
				return false;
			}
		}
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