<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.kh.iag.prj.entity.PrjReportDto"%>
<% 
	List<PrjReportDto> eventList = (List<PrjReportDto>)request.getAttribute("eventList");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>prj_dept</title>

	<!-- Theme style -->
	<link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
	<!-- Favicon -->
	<link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">
	<!-- adminLTE CDN -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.1/dist/css/adminlte.min.css">

	<!-- FullCalendar -->
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.3.0/main.min.js"></script>
	
</head>
<body>
	
	<%@ include file="/WEB-INF/views/common/headerSide.jsp" %>
	  
	<main class="main">
	<div class="container">

		<section class="content-header">
	      <div class="container-fluid">
	        <div class="row mb-2">
	          <div class="col-sm-6">
					<div class="btn-group btn-block">
						<form action="" method="get">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-outline-primary active">
									<input type="radio" name="departNo" value="1" autocomplete="off" checked> 홍보팀
								</label>
								<label class="btn btn-outline-primary">
									<input type="radio" name="departNo" value="2"  autocomplete="off"> 인사팀
								</label>
								<label class="btn btn-outline-primary">
									<input type="radio" name="departNo" value="3"  autocomplete="off"> 총무팀
								</label>
								<label class="btn btn-outline-primary">
									<input type="radio" name="departNo" value="4"  autocomplete="off"> 회계팀
								</label>
								<label class="btn btn-outline-primary">
									<input type="radio" name="departNo" value="5"  autocomplete="off"> 영업팀
								</label>
								<label class="btn btn-outline-primary">
									<input type="radio" name="departNo" value="6"  autocomplete="off"> 기획팀
								</label>
							</div>
						</form>
					</div>
	          </div>
	          <div class="col-sm-6">
	            <ol class="breadcrumb float-sm-right">
	              <li class="breadcrumb-item"><a href="http://127.0.0.1:8989/iag/main">Home</a></li>
	              <li class="breadcrumb-item active">Dept_Project</li>
	            </ol>
	          </div>
	        </div>
	      </div><!-- /.container-fluid -->
	    </section>
	    
	    <section class="content">
			<div class="container-fluid">
				<div class="row">
					
					<section class="col-lg-6 connectedSortable">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title"> Project List</h3>
							</div>

							<c:forEach items="${prjList}" var="p">
								<a href="<%=request.getContextPath()%>/prj/prjDetail/${p.prjNo}">
									<div class="card-body">
										<div class="info-box bg-lightblue">
											<span class="info-box-icon"><i class="far fa-calendar-alt"></i></span>
							  
											<div class="info-box-content">
											  <span class="info-box-number">${p.prjName}</span>
											  <span class="info-box-text">${p.departmentName}</span>
							  
											  <div class="progress">
												<div class="progress-bar" style="width: 0%"></div>
											  </div>
											  <span class="progress-description">
												기간 :  ${p.period}
											  </span>
											</div><!-- /.info-box-content -->
										</div>
									</div> 
								</a>
							</c:forEach>

							<div class="card-footer">
								<!-- paging start -->
								<ul class="pagination pagination-sm">
									<c:if test="${page.currentPage != 1}"> 
										<li class="page-item"><a class="page-link" href="${root}/prj/prjDetail/${page.currentPage - 1}">&laquo;</a></li>
									</c:if>
									<c:if test="${page.currentPage == 1}">
										<li class="page-item disabled"><a class="page-link">&laquo;</a></li>&nbsp;
									</c:if>
									
									<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
										<c:if test="${page.currentPage != i and i <= page.lastPage}">
											<li class="page-item"><a class="page-link" href="${root}/prj/prjDetail/${i}">${i}&nbsp;</a></li>
										</c:if>
										
										<c:if test="${page.currentPage == i and i <= page.lastPage}">
											<li class="page-item disabled"><a class="page-link">${i}&nbsp;</a></li>
										</c:if>
									</c:forEach>
									
									<c:if test="${page.currentPage < page.lastPage}"> 
										<li class="page-item"><a class="page-link" href="${root}/prj/prjDetail/${page.currentPage + 1}">&raquo;</a></li>
									</c:if>
									<c:if test="${!(page.currentPage < page.lastPage) || page.currentPage == page.lastPage}">
										<li class="page-item disabled"><a class="page-link">&raquo;</a></li>
									</c:if>
								</ul>
								<!-- paging end -->
						</div>
					</section>

					<section class="col-lg-6 connectedSortable">
						<!-- Calendar -->
						<div class="card">
							<div class="card-header border-0">
								<h3 class="card-title">Calendar</h3>
							</div>
							<div class="card-body pt-0">
								<div id="calendar"></div>
							</div>
						</div> 
					</section>

				</div>
			</div>
		</section>

	</div>	
    </main>

	<script>
		$("input[type=radio]").click(function(){
			$(this).prop("checked", true);
			$("form").submit();
		})

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
				height: 690,
				events : 
				[ 
					<%if (eventList != null) {%>
						<%for (PrjReportDto r : eventList) {%>
							{
							title : '<%=r.getReportName()%>',
							start : '<%=r.getStartDate()%>',
							end : '<%=r.getEndDate()%>',
							color : '#2D82D7'
							},
						<%}
					}%>
				]
			});
			calendar.render();
	
		});
	</script>

	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>

	<!-- FullCalendar -->
	<link rel="stylesheet" href="${root}/resources/plugins/fullcalendar/main.css">

</body>
</html>