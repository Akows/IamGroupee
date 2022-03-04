<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<div class="col-md-3 connectedSortable">
						<div class="sticky-top mb-3">
						<div class="card">
							<div class="card-header">
							<h4 class="card-title">Draggable Events</h4>
							</div>
							<div class="card-body">
							<!-- the events -->
							<div id="external-events">
								<div class="external-event bg-success ui-draggable ui-draggable-handle" style="position: relative;">회의실A</div>
								<div class="external-event bg-warning ui-draggable ui-draggable-handle" style="position: relative;">회의실B</div>
								<div class="external-event bg-info ui-draggable ui-draggable-handle" style="position: relative;">회의실C</div>
								<div class="external-event bg-primary ui-draggable ui-draggable-handle" style="position: relative;">빔프로젝터A</div>
								<div class="external-event bg-danger ui-draggable ui-draggable-handle" style="position: relative;">노트북A</div>
								<div class="checkbox">
								<label for="drop-remove">
									<input type="checkbox" id="drop-remove">
									remove after drop
								</label>
								</div>
							</div>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
						<div class="card">
							<div class="card-header">
							<h3 class="card-title">Create Event</h3>
							</div>
							<div class="card-body">
							<div class="btn-group" style="width: 100%; margin-bottom: 10px;">
								<ul class="fc-color-picker" id="color-chooser">
								<li><a class="text-primary" href="#"><i class="fas fa-square"></i></a></li>
								<li><a class="text-warning" href="#"><i class="fas fa-square"></i></a></li>
								<li><a class="text-success" href="#"><i class="fas fa-square"></i></a></li>
								<li><a class="text-danger" href="#"><i class="fas fa-square"></i></a></li>
								<li><a class="text-muted" href="#"><i class="fas fa-square"></i></a></li>
								</ul>
							</div>
							<!-- /btn-group -->
							<div class="input-group">
								<input id="new-event" type="text" class="form-control" placeholder="Event Title">
			
								<div class="input-group-append">
								<button id="add-new-event" type="button" class="btn btn-primary">Add</button>
								</div>
								<!-- /btn-group -->
							</div>
							<!-- /input-group -->
							</div>
						</div>
						</div>
					</div><!-- /.col -->

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
			initialView: 'dayGridMonth'
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
</html>`