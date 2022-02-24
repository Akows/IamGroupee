<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reserve_main</title>

	<!-- Theme style -->
	<link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
	<!-- Favicon -->
	<link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">
    <!-- adminLTE CDN -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.1/dist/css/adminlte.min.css">

</head>
<body>

	<%@ include file="/WEB-INF/views/common/headerSide.jsp" %>
	  
	<main class="main container">
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

	</script>

	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>

	<!-- FullCalendar js -->
	<script src='${root}/resources/js/sch/moment.min.js'></script>
	<script src='${root}/resources/js/sch/fullcalendar.min.js'></script>
	<script src='${root}/resources/js/sch/ko.js'></script>
	<script src='${root}/resources/js/resv/main.js'></script>
	
	<link rel='stylesheet' href='${root}/resources/css/sch/fullcalendar.min.css' />
	<link rel='stylesheet' href='${root}/resources/css/sch/main.css' />
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	
	<!-- InputMask -->
	<script src="${root}/resources/plugins/moment/moment.min.js"></script>
	<script src="${root}/resources/plugins/inputmask/jquery.inputmask.min.js"></script>
	<!-- date-range-picker -->
	<script src="${root}/resources/plugins/daterangepicker/daterangepicker.js"></script>
	<link rel="stylesheet" href="${root}/resources/plugins/daterangepicker/daterangepicker.css">



	

</body>
</html>