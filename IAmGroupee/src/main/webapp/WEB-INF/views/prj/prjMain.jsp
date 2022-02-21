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
	 
	<main class="container">
		<section class="content-header">
	      <div class="container-fluid">
	        <div class="row mb-2">
	          <div class="col-sm-6">
	            <h1>내 프로젝트</h1>
	          </div>
	          <div class="col-sm-6">
	            <ol class="breadcrumb float-sm-right">
	              <li class="breadcrumb-item"><a href="http://127.0.0.1:8989/iag/main">Home</a></li>
	              <li class="breadcrumb-item active">My Project</li>
	            </ol>
	          </div>
	        </div>
	      </div><!-- /.container-fluid -->
	    </section>
		
        <div class="row">
        	<section class="col-lg-7 connectedSortable">
            	<div class="card">
                	<div class="card-header">
                    	<h3 class="card-title">Project List</h3>	
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
			</section>
		
			<section class="col-lg-5 connectedSortable">
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
			</section>
		</div> <!-- /.row -->
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
	
</body>
</html>