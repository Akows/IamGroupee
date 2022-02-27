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

	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>

	<!-- InputMask -->
	<script src="${root}/resources/plugins/moment/moment.min.js"></script>
	<script src="${root}/resources/plugins/inputmask/jquery.inputmask.min.js"></script>
	<!-- date-range-picker -->
	<link rel="stylesheet" href="${root}/resources/plugins/daterangepicker/daterangepicker.css">
	<script src="${root}/resources/plugins/daterangepicker/daterangepicker.js"></script>
	<!-- fullCalendar 2.2.5 -->
	<link rel="stylesheet" href="${root}/resources/plugins/fullcalendar/main.css">
	<script src="${root}/resources/plugins/moment/moment.min.js"></script>
	<script src="${root}/resources/plugins/fullcalendar/main.js"></script>

  <script>
    $(function () {
  
      /* initialize the external events
       -----------------------------------------------------------------*/
      function ini_events(ele) {
        ele.each(function () {
  
          // create an Event Object (https://fullcalendar.io/docs/event-object)
          // it doesn't need to have a start or end
          var eventObject = {
            title: $.trim($(this).text()) // use the element's text as the event title
          }
  
          // store the Event Object in the DOM element so we can get to it later
          $(this).data('eventObject', eventObject)
  
          // make the event draggable using jQuery UI
          $(this).draggable({
            zIndex        : 1070,
            revert        : true, // will cause the event to go back to its
            revertDuration: 0  //  original position after the drag
          })
  
        })
      }
  
      ini_events($('#external-events div.external-event'))
  
      /* initialize the calendar
       -----------------------------------------------------------------*/
      //Date for the calendar events (dummy data)
      var date = new Date()
      var d    = date.getDate(),
          m    = date.getMonth(),
          y    = date.getFullYear()
  
      var Calendar = FullCalendar.Calendar;
      var Draggable = FullCalendar.Draggable;
  
      var containerEl = document.getElementById('external-events');
      var checkbox = document.getElementById('drop-remove');
      var calendarEl = document.getElementById('calendar');
  
      // initialize the external events
      // -----------------------------------------------------------------
  
      new Draggable(containerEl, {
        itemSelector: '.external-event',
        eventData: function(eventEl) {
          return {
            title: eventEl.innerText,
            backgroundColor: window.getComputedStyle( eventEl ,null).getPropertyValue('background-color'),
            borderColor: window.getComputedStyle( eventEl ,null).getPropertyValue('background-color'),
            textColor: window.getComputedStyle( eventEl ,null).getPropertyValue('color'),
          };
        }
      });
  
      var calendar = new Calendar(calendarEl, {
        headerToolbar: {
          left  : 'prev,next today',
          center: 'title',
          right : 'dayGridMonth,timeGridWeek,timeGridDay'
        },
        themeSystem: 'bootstrap',
        //Random default events
        events: [
          {
            title          : 'All Day Event',
            start          : new Date(y, m, 1),
            backgroundColor: '#f56954', //red
            borderColor    : '#f56954', //red
            allDay         : true
          },
          {
            title          : 'Long Event',
            start          : new Date(y, m, d - 5),
            end            : new Date(y, m, d - 2),
            backgroundColor: '#f39c12', //yellow
            borderColor    : '#f39c12' //yellow
          },
          {
            title          : 'Meeting',
            start          : new Date(y, m, d, 10, 30),
            allDay         : false,
            backgroundColor: '#0073b7', //Blue
            borderColor    : '#0073b7' //Blue
          },
          {
            title          : 'Lunch',
            start          : new Date(y, m, d, 12, 0),
            end            : new Date(y, m, d, 14, 0),
            allDay         : false,
            backgroundColor: '#00c0ef', //Info (aqua)
            borderColor    : '#00c0ef' //Info (aqua)
          },
          {
            title          : 'Birthday Party',
            start          : new Date(y, m, d + 1, 19, 0),
            end            : new Date(y, m, d + 1, 22, 30),
            allDay         : false,
            backgroundColor: '#00a65a', //Success (green)
            borderColor    : '#00a65a' //Success (green)
          },
          {
            title          : 'Click for Google',
            start          : new Date(y, m, 28),
            end            : new Date(y, m, 29),
            url            : 'https://www.google.com/',
            backgroundColor: '#3c8dbc', //Primary (light-blue)
            borderColor    : '#3c8dbc' //Primary (light-blue)
          }
        ],
        editable  : true,
        droppable : true, // this allows things to be dropped onto the calendar !!!
        drop      : function(info) {
          // is the "remove after drop" checkbox checked?
          if (checkbox.checked) {
            // if so, remove the element from the "Draggable Events" list
            info.draggedEl.parentNode.removeChild(info.draggedEl);
          }
        }
      });
  
      calendar.render();
      // $('#calendar').fullCalendar()
  
      /* ADDING EVENTS */
      var currColor = '#3c8dbc' //Red by default
      // Color chooser button
      $('#color-chooser > li > a').click(function (e) {
        e.preventDefault()
        // Save color
        currColor = $(this).css('color')
        // Add color effect to button
        $('#add-new-event').css({
          'background-color': currColor,
          'border-color'    : currColor
        })
      })
      $('#add-new-event').click(function (e) {
        e.preventDefault()
        // Get value and make sure it is not null
        var val = $('#new-event').val()
        if (val.length == 0) {
          return
        }
  
        // Create events
        var event = $('<div />')
        event.css({
          'background-color': currColor,
          'border-color'    : currColor,
          'color'           : '#fff'
        }).addClass('external-event')
        event.text(val)
        $('#external-events').prepend(event)
  
        // Add draggable funtionality
        ini_events(event)
  
        // Remove event from text input
        $('#new-event').val('')
      })

    })

    $(function () {
      //Date range picker with time picker
      $('#reservationtime').daterangepicker({
            timePicker: true,
            timePickerIncrement: 30,
            locale: {
              format: 'MM/DD/YYYY hh:mm A'
            }
          })
    }
  </script>

</body>
</html>