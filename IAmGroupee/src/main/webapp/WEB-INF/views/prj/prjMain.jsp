<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>prj_main</title>

	<!-- Theme style -->
	<link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
	<!-- Favicon -->
	<link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">

	
</head>
<body>

	<%@ include file="/WEB-INF/views/common/headerSide.jsp" %>
	 
	<main class="main">
	<div class="container">
		
		<section class="content-header">
        		<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<button class="btn-primary btn-lg" data-toggle="modal" data-target="#createPrj">
								프로젝트 생성
							</button>
						</div>
						
						<!-- modal 시작! -->
						<div class="modal fade" id="createPrj">
							<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
								  <h4 class="modal-title">새 프로젝트 생성</h4>
								</div>
								
								<form action="" method="post">
									<div class="modal-body">
										<div class="card-body">
											<div class="form-group">
												<label for="InputPrjName" required>프로젝트명</label>
												<input type="text" class="form-control" id="InputPrjName" name = "prjName" placeholder="프로젝트 이름을 입력하세요.">
											</div>
	
											<div class="form-group">
												<label>프로젝트 관리자</label>
												<input readonly class="form-control" name="userNo" value="${loginUser.name}">
											</div>
											
											<!-- Date range -->
											<div class="form-group">
												<label for="reservation">프로젝트 기간</label>
								
												<div class="input-group">
													<div class="input-group-prepend">
														<span class="input-group-text"> 
															<i class="far fa-calendar-alt"></i>
														</span>
													</div>
													<input type="text" class="form-control float-right" id="reservation" name="period" required>
												</div>
											</div>
	
											<!-- 참여부서 -->
											<div class="form-group">
												<label>참여 부서</label>
												<div class="select2-blue">
													<select id="select2insidemodal" class="select2" name="departNo" multiple="multiple" data-placeholder="참여할 부서를 클릭해주세요." style="width: 100%;" required>
														<option value="1">홍보팀</option>
														<option value="2">인사팀</option>
														<option value="3">총무팀</option>
														<option value="4">회계팀</option>
														<option value="5">영업팀</option>
														<option value="6">기획팀</option>
													</select>
												</div>
											</div>
	
											<!-- 권한 toggle -->
											<br>
											<div class="form-group row">
												<div class="col-md-3"></div>
												<div class="custom-control custom-switch col-md-4">
													<input type="checkbox" name="openYn" class="custom-control-input" id="customSwitch1">
													<label class="custom-control-label" for="customSwitch1">공개</label>
												</div>
												<div class="custom-control custom-switch col-md-3">
													<input type="checkbox" name="activateYn" class="custom-control-input" id="customSwitch2">
													<label class="custom-control-label" for="customSwitch2">활성화</label>
												</div>
												<div class="col-md-2"></div>
											</div>
										</div>
									</div> <!-- /.modal-body -->
									<div class="modal-footer justify-content-between">
										<input type="button" value="취소" class="btn btn-default" data-dismiss="modal">
										<input type="submit" value="생성" class="btn btn-primary">
									</div>
								</form>
							</div> <!-- /.modal-content -->
							</div> <!-- /.modal-dialog -->
						</div>
						<!-- modal 끝! -->
						
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="http://127.0.0.1:8989/iag/main">Home</a></li>
								<li class="breadcrumb-item active">My Project</li>
							</ol>
						</div>
					</div> <!--/.row -->
	       		</div> <!--/.container-fluid -->
	    </section>
		
		<section class="content">
			<div class="container-fluid">
				<div class="row">

					<section class="col-lg-6 connectedSortable">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title"> My Project List</h3>
								<form action="simple-results.html">
									<div class="input-group">
										<input type="search" class="form-control form-control-lg" placeholder="Type your keywords here">
										<div class="input-group-append">
											<button type="submit" class="btn btn-lg btn-default">
												<i class="fa fa-search"></i>
											</button>
										</div>
									</div>
								</form>	
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
										<li class="page-item"><a class="page-link" href="${root}/prj/prjMain/${page.currentPage - 1}">&laquo;</a></li>
									</c:if>
									<c:if test="${page.currentPage == 1}">
										<li class="page-item disabled"><a class="page-link">&laquo;</a></li>&nbsp;
									</c:if>
									
									<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
										<c:if test="${page.currentPage != i and i <= page.lastPage}">
											<li class="page-item"><a class="page-link" href="${root}/prj/prjMain/${i}">${i}&nbsp;</a></li>
										</c:if>
										
										<c:if test="${page.currentPage == i and i <= page.lastPage}">
											<li class="page-item disabled"><a class="page-link">${i}&nbsp;</a></li>
										</c:if>
									</c:forEach>
									
									<c:if test="${page.currentPage < page.lastPage}"> 
										<li class="page-item"><a class="page-link" href="${root}/prj/prjMain/${page.currentPage + 1}">&raquo;</a></li>
									</c:if>
									<c:if test="${!(page.currentPage < page.lastPage) || page.currentPage == page.lastPage}">
										<li class="page-item disabled"><a class="page-link">&raquo;</a></li>
									</c:if>
								</ul>
								<!-- paging end -->
							</div>
						</div> <!-- /.card -->
					</section>  <!-- /. left row -->
				
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
						
						<!-- TO DO -->
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">To Do List</h3>
							</div>
							<div class="card-body">
								<ul class="todo-list" data-widget="todo-list">
									<li>
										<!-- checkbox -->
										<div  class="icheck-primary d-inline ml-2">
											<input type="checkbox" value="" name="todo1" id="todoCheck1">
											<label for="todoCheck1"></label>
										</div>
										<!-- todo text -->
										<span class="text">IAMGROUPE</span>
										<!-- Emphasis label -->
										<small class="badge badge-danger"><i class="far fa-clock"></i> 3 days</small>
									</li>
									<li>
										<!-- checkbox -->
										<div  class="icheck-primary d-inline ml-2">
											<input type="checkbox" value="" name="todo1" id="todoCheck1">
											<label for="todoCheck1"></label>
										</div>
										<!-- todo text -->
										<span class="text">IAMGROUPE</span>
										<!-- Emphasis label -->
										<small class="badge badge-danger"><i class="far fa-clock"></i> 3 days</small>
									</li>
									<li>
										<!-- checkbox -->
										<div  class="icheck-primary d-inline ml-2">
											<input type="checkbox" value="" name="todo1" id="todoCheck1">
											<label for="todoCheck1"></label>
										</div>
										<!-- todo text -->
										<span class="text">IAMGROUPE</span>
										<!-- Emphasis label -->
										<small class="badge badge-danger"><i class="far fa-clock"></i> 3 days</small>
									</li>
								</ul>
							</div>
						</div> <!-- /.card -->
					</section> <!-- /.col -->
					
				</div> <!-- /.row -->
			</div> <!-- /.container-fluid -->
		</section> <!-- /.content-body -->
	</div>
	</main>    


	<script>
		
		$(function () {
			
			//Initialize Select2 Elements
			$('.select2').select2()
			//모달 내부 셀렉트 오픈
			$("#select2insidemodal").select2({
				dropdownParent: $("#createPrj")
			});
			
			//Date range picker
			let today = new Date(); 
			$('#reservation').daterangepicker({
				minDate: new Date(today),           // 이전시간 예약 불가.
				locale: {
					"separator": "~",               // 시작일시와 종료일시 구분자
					"format": 'YYYY-MM-DD',         // 일시 노출 포맷
					"applyLabel": "확인",            // 확인 버튼 텍스트
					"cancelLabel": "취소",           // 취소 버튼 텍스트
					"daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
					"monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
				}
			})
	
		})

		document.addEventListener('DOMContentLoaded', function() {
		  var calendarEl = document.getElementById('calendar');
		  var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView: 'dayGridMonth'
		  });
		  calendar.render();
		});

	</script>


	<%@ include file="/WEB-INF/views/common/footer.jsp" %>

	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>

	<!-- date-range-picker -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	
	<!-- Select2 -->
	<script src="${root}/resources/plugins/select2/js/select2.full.min.js"></script>
	<link rel="stylesheet" href="${root}/resources/plugins/select2/css/select2.min.css">
	
	<!-- FullCalendar -->
	<link rel="stylesheet" href="${root}/resources/plugins/fullcalendar/main.css">
	<script src="${root}/resources/plugins/moment/moment.min.js"></script>
	<script src="${root}/resources/plugins/fullcalendar/main.js"></script>

	
</body>
</html>