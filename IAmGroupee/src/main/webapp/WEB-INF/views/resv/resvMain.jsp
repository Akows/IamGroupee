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
	  
   	<main class="container">
		
	  <div class="row">
	    <!-- Content Header (Page header) -->
	    <section class="content-header">
	      <div class="container-fluid">
	        <div class="row mb-2">
	          <div class="col-sm-6">
	            <h1>내 예약</h1>
	          </div>
	          <div class="col-sm-6">
	            <ol class="breadcrumb float-sm-right">
	              <li class="breadcrumb-item"><a href="http://127.0.0.1:8989/iag/main">Home</a></li>
	              <li class="breadcrumb-item active">My Resevations</li>
	            </ol>
	          </div>
	        </div>
	      </div><!-- /.container-fluid -->
	    </section>
	
	    <!-- Main content -->
	    <section class="content">
	      <div class="container-fluid">
	        <div class="row">
				<div class="col-md-4">
					<div class="card">
					  <div class="card-header">
						<h3 class="card-title">Reservation</h3>
					  </div>

					<form>
					  <div class="card-body">
					  		<div class="form-group">
		                        <label>예약할 자산</label>
		                        <select class="form-control">
		                          <option>회의실A</option>
		                          <option>회의실B</option>
		                          <option>회의실C</option>
		                        </select>
		                      </div>
					  		
						  <div class="form-group">
		                    <label for="exampleInputEmail1">예약자</label>
		                    <input readonly class="form-control" id="" value="${loginUser.name}">
		                  </div>
					  
						<!-- Date and time range -->
						<div class="form-group">
						  <label>Date and time range:</label>
		
						  <div class="input-group">
							<div class="input-group-prepend">
							  <span class="input-group-text"><i class="far fa-clock"></i></span>
							</div>
							<input type="text" class="form-control float-right" id="reservationtime">
						  </div>
						  <!-- /.input group -->
						</div>
						<!-- /.form group -->
		
						<!-- Date and time range -->
						<div class="form-group">
						  <label>Date range button:</label>
		
						  <div class="input-group">
							<button type="button" class="btn btn-default float-right" id="daterange-btn">
							  <i class="far fa-calendar-alt"></i> Date range picker
							  <i class="fas fa-caret-down"></i>
							</button>
						  </div>
						</div>
						<!-- /.form group -->
					  </div>
					</form>
					</div>
	            </div> <!-- /.col -->

	          <div class="col-md-8">
	            <div class="card card-primary">
	              <div class="card-body p-3">
	                <!-- THE CALENDAR -->
	              	<div id="calendar"></div>
	              </div>
	              <!-- /.card-body -->
	            </div>
	            <!-- /.card -->
	          </div>
	          <!-- /.col -->
	        </div>
	        <!-- /.row -->
	      </div><!-- /.container-fluid -->
	    </section>
	    <!-- /.content -->
	  </div>
	  <!-- /.content-wrapper -->

	</main>
	
	
	<script>
	
	  document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');
	
	    var calendar = new FullCalendar.Calendar(calendarEl, {
		      plugins: [ 'interaction', 'dayGrid' ],
		      header: {
	          left: 'prev,next, today',
	          center: 'title',
	          right: 'dayGridMonth,dayGridWeek,dayGridDay'
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
	
	 </script>
	 
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
	    //Date range as a button
	    $('#daterange-btn').daterangepicker(
	      {
	        ranges   : {
	          'Today'       : [moment(), moment()],
	          'Yesterday'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
	          'Last 7 Days' : [moment().subtract(6, 'days'), moment()],
	          'Last 30 Days': [moment().subtract(29, 'days'), moment()],
	          'This Month'  : [moment().startOf('month'), moment().endOf('month')],
	          'Last Month'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
	        },
	        startDate: moment().subtract(29, 'days'),
	        endDate  : moment()
	      },
	      function (start, end) {
	        $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
	      }
        )
	  })  
	</script>

	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
	<!-- fullCalendar 2.2.5 -->
	<link rel="stylesheet" href="${root}/resources/plugins/fullcalendar/main.css">
	<script src="${root}/resources/plugins/moment/moment.min.js"></script>
	<script src="${root}/resources/plugins/fullcalendar/main.js"></script>
  
  	<!-- Schedule -->
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