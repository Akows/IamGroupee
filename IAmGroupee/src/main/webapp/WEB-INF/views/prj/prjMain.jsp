<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>prj_main</title>

	<!-- Theme style -->
	<link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
	<!-- Favicon -->
	<link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">
	<!-- adminLTE CDN -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.1/dist/css/adminlte.min.css">
	
</head>
<body>

	<%@ include file="/WEB-INF/views/common/headerSide.jsp" %>
	 
	<main class="container-fluid">
		<section class="content-header">
        		<div class="row">
					<div class="col-sm-6">
						<button class="btn-primary btn-lg" data-toggle="modal" data-target="#createPrj">
							프로젝트 생성
						</button>
					</div>
					
					<div class="modal fade" id="createPrj">
				        <div class="modal-dialog">
				          <div class="modal-content">
				            <div class="modal-header">
				              <h4 class="modal-title">새 프로젝트 생성</h4>
				            </div>
							
							<form accept="" method="post">
								<div class="modal-body">
									<div class="card-body">
										<div class="form-group">
											<label for="InputPrjName">프로젝트명</label>
											<input type="text" class="form-control" id="InputPrjName" placeholder="프로젝트 이름을 입력하세요.">
										</div>

										<div class="form-group">
											<label for="InputPrjManager">프로젝트 관리자</label>
											<input readonly class="form-control" id="InputPrjManager" value="${loginUser.name}">
										</div>

										<div class="form-group">
											<label for="participants">참여부서</label>
											<select class="form-control" id="participants">
											<option>회의실A</option>
											<option>회의실B</option>
											<option>회의실C</option>
											</select>
										</div>
										
										<!-- Date range -->
										<div class="form-group">
											<label for="reservation">프로젝트 기간:</label>
							
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text">
														<i class="far fa-calendar-alt"></i>
													</span>
												</div>
												<input type="text" class="form-control float-right" id="reservation">
											</div>
										</div>

										<!-- 권한 toggle -->
										<div class="form-group row">
											<hr>
											<div class="col-md-2"></div>
											<div class="custom-control custom-switch col-md-5">
												<input type="checkbox" class="custom-control-input" id="customSwitch1">
												<label class="custom-control-label" for="customSwitch1">공개</label>
											</div>
											<div class="custom-control custom-switch col-md-3">
											    <input type="checkbox" class="custom-control-input" id="customSwitch2">
												<label class="custom-control-label" for="customSwitch2">관리자승인</label>
											</div>
											<div class="col-md-2"></div>
										</div>

									</div> <!-- /.card-body -->
								</div>
								<div class="modal-footer justify-content-between">
									<input type="button" value="취소" class="btn btn-default" data-dismiss="modal">
									<input type="submit" value="생성" class="btn btn-primary">
								</div>
							</form>
				          </div> <!-- /.modal-content -->
				        </div> <!-- /.modal-dialog -->
				      </div> <!-- /.modal -->
					
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="http://127.0.0.1:8989/iag/main">Home</a></li>
							<li class="breadcrumb-item active">My Project</li>
						</ol>
					</div>
	       		</div> <!--/.row -->
	    </section>
		
		<section class="content-body">
			<div class="row">
				<div class="col-lg-7">
					<div class="card">
						<div class="card-header">
							<h3 class="card-title"> My Project List</h3>	
						</div>
						
						<div class="card-body">
							<div class="info-box mb-3 bg-lighst">
								<div class="info-box-content">IAMGROUPE</div>
							</div>
						</div> 
						<div class="card-body">
							<div class="info-box mb-3 bg-lighst">
								<div class="info-box-content">IAMGROUPE</div>
							</div>
						</div>
						<div class="card-body">
							<div class="info-box mb-3 bg-lighst">
								<div class="info-box-content">IAMGROUPE</div>
							</div>
						</div>
						<div class="card-body">
							<div class="info-box mb-3 bg-lighst">
								<div class="info-box-content">IAMGROUPE</div>
							</div>
						</div>
						<div class="card-body">
							<div class="info-box mb-3 bg-lighst">
								<div class="info-box-content">IAMGROUPE</div>
							</div>
						</div>
					</div> <!-- /.card -->
				</div>  <!-- /. left row -->
			
				<div class="col-lg-5">
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
				</div> <!-- /.col -->
			</div> <!-- /.row -->
		</section> <!-- /.content-body -->
	</main>    

	  
	
	<script>
	
	  document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');
	
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      plugins: [ 'interaction', 'dayGrid' ],
	      header: {
	        left: 'prev,next',
	        center: 'title',
	        right: 'dayGridMonth,dayGridWeek'
	      },
	      defaultDate: '2020-02-12',
	      navLinks: true, // can click day/week names to navigate views
	      editable: true,
	      eventLimit: true, // allow "more" link when too many events
	      events: [
	        {
	          title: 'All Day Event',
	          start: '2020-02-01'
	        },
	        {
	          title: 'Long Event',
	          start: '2020-02-07',
	          end: '2020-02-10'
	        },
	       {
	          title: 'Birthday Party',
	          start: '2020-02-13T07:00:00'
	        },
	        {
	          title: 'Click for Google',
	          url: 'http://google.com/',
	          start: '2020-02-28'
	        }
	      ]
	    });
	
	    calendar.render();
	  });
	  
	  
		$(function () {
			//Date range picker
			$('#reservation').daterangepicker()
		})  
	
	</script>

  
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
	<!-- fullCalendar -->
	<link href='${root}/resources/css/schedule/core_main.css' rel='stylesheet' />
	<link href='${root}/resources/css/schedule/daygrid_main.css' rel='stylesheet' />
	<script src='${root}/resources/js/schedule/core_main.js'></script>
	<script src='${root}/resources/js/schedule/interaction_main.js'></script>
	<script src='${root}/resources/js/schedule/daygrid_main.js'></script>
	
	<!-- InputMask -->
	<script src="${root}/resources/plugins/moment/moment.min.js"></script>
	<script src="${root}/resources/plugins/inputmask/jquery.inputmask.min.js"></script>
	<!-- date-range-picker -->
	<script src="${root}/resources/plugins/daterangepicker/daterangepicker.js"></script>
    <link rel="stylesheet" href="${root}/resources/plugins/daterangepicker/daterangepicker.css">
    
</body>
</html>