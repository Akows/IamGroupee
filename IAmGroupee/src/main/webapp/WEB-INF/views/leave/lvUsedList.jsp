<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>LvUsedList</title>
  
  <!-- Favicon -->
  <link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">
  <!-- Custom styles -->
  <link rel="stylesheet" href="${root}/resources/css/style.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
  <!-- FullCalendar -->
  <link href='${root}/resources/css/sch/core_main.css' rel='stylesheet' />
  <link href='${root}/resources/css/sch/daygrid_main.css' rel='stylesheet' />
  <script src='${root}/resources/js/sch/core_main.js'></script>
  <script src='${root}/resources/js/sch/interaction_main.js'></script>
  <script src='${root}/resources/js/sch/daygrid_main.js'></script>
  <script src='${root}/resources/js/sch/ko.js'></script>
  
  <script>

	  document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');
	
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      plugins: [ 'interaction', 'dayGrid' ],
	      header: {
	        left: 'prevYear,prev,next,nextYear today',
	        center: 'title',
	        right: 'dayGridMonth,dayGridWeek,dayGridDay'
	      },
	      locale: 'ko',
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
	          groupId: 999,
	          title: 'Repeating Event',
	          start: '2020-02-09T16:00:00'
	        },
	        {
	          groupId: 999,
	          title: 'Repeating Event',
	          start: '2020-02-16T16:00:00'
	        },
	        {
	          title: 'Conference',
	          start: '2020-02-11',
	          end: '2020-02-13'
	        },
	        {
	          title: 'Meeting',
	          start: '2020-02-12T10:30:00',
	          end: '2020-02-12T12:30:00'
	        },
	        {
	          title: 'Lunch',
	          start: '2020-02-12T12:00:00'
	        },
	        {
	          title: 'Meeting',
	          start: '2020-02-12T14:30:00'
	        },
	        {
	          title: 'Happy Hour',
	          start: '2020-02-12T17:30:00'
	        },
	        {
	          title: 'Dinner',
	          start: '2020-02-12T20:00:00'
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
  <style>
	
	  body {
	    margin: 40px 10px;
	    padding: 0;
	    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	    font-size: 14px;
	  }
	
	  #calendar {
	    max-width: 900px;
	    margin: 0 auto;
	  }
	
	</style>
</head>

<body>

    <%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

    <!-- ! Main -->
    <main class="main users chart-page" id="skip-target">
    
     <div class="container">
      
        <div class="row stat-cards">
        
          <div class="col-md-6 col-xl-4">
            <article class="stat-cards-item">
              <div class="stat-cards-info">
                <p class="stat-cards-info__num"></p>
                  <table>
                  	<thead>
                  		<tr>연차</tr><br>
                  		<tr>휴가</tr><br>
                  	</thead>
                  </table>
              </div>
            </article>
          </div>
          
          
          
          <div class="col-md-6 col-xl-8">
            <article class="stat-cards-item">
              <div class="stat-cards-info">
                <p class="stat-cards-info__num"></p>
                <pre>

					<div id='calendar'></div>

                </pre>
              </div>
            </article>
          </div>
          
        </div>
        
        <div class="row">
        
        </div>
        
      </div>
      
    </main>

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>

	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
</body>
</html>