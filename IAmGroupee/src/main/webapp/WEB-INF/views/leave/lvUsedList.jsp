<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.iag.leave.entity.LvUsedListDto"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>UsedLeaveList</title>
  
  <style type="text/css">
    #calendar .fc-day-sun {
    color: red;
	}
    #calendar .fc-day-sat {
    color: blue;
	}
  </style>
  
  <!-- Favicon -->
  <link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">
  <!-- Theme style -->
  <link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
  <link rel='stylesheet' href='${root}/resources/css/sch/main.css' />
  <!-- calendar -->
   <%--  <link href='${root}/resources/css/lv/main.min.css' rel='stylesheet' />
    <script src='${root}/resources/js/lv/main.min.js'></script>
    <script src='${root}/resources/js/lv/ko.js'></script> --%>
    
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css"/>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
</head>

<body>

    <%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

    <!-- ! Main -->
    <main class="main users chart-page" id="skip-target">
    
     <div class="container" style="margin-top: 20px; margin-left: 25px;">
      
        <div class="row stat-cards" style="height: 160%; width: 120%;">

				<div class="col-md-6 col-xl-5" style="margin-right: 20px; height: 100%">
					<div style="height: 50%; margin-bottom: 10px;">
						<div class="card-body" style="height: 100%; padding: 0px; margin: 0px;">
							<iframe src="${root}/leave/alvUsedListIf" scrolling="no" height="360px" width="100%"></iframe>
						</div>
					</div>

					<div style="height: 50%;">
						<div class="card-body" style="height: 100%; padding: 0px; margin: 0px;">
							<iframe src="${root}/leave/lvUsedListIf" height="360px" width="100%" scrolling="no"></iframe>
						</div>
					</div>
				</div>

				<div class="col-md-7 col-xl-6">
          		  <article class="stat-cards-item">
    			    <div id='calendar' style="width: 90%; margin: auto; text-align: center; margin-top: 10px;"></div>
		          </article>
          </div>
        </div>
        
      </div>
      
    </main>

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>

	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
    <script>
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
            googleCalendarApiKey: 'AIzaSyDYMx36O77hSRC2wnwmpzWJ6M2BJ_F8fek',
			headerToolbar : { // 헤더에 표시할 툴 바
				start : 'today',
				center : 'title',
				end : 'prev next'
			},
			titleFormat : function(date) {
				return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
			},
			//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
			selectable : true, // 달력 일자 드래그 설정가능
			droppable : true,
			editable : true,
            locale: 'ko',
            eventSources: [
		         {
		        	 googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
		         	 className: 'holiday',
         			 color : '#DD5246'
		         }],
		    events : [ 
    	    	<%List<LvUsedListDto> alvUsedList = (List<LvUsedListDto>)request.getAttribute("alvUsedList");%>
				<%List<LvUsedListDto> lvUsedList = (List<LvUsedListDto>)request.getAttribute("lvUsedList");%>
            	<%if (alvUsedList != null || lvUsedList != null) {%>
           			<%for (LvUsedListDto dto : alvUsedList) {%>
           				 {
            				title : '<%=dto.getLvName()%>',
                			start : '<%=dto.getLvStart()%>',
               				end : '<%=dto.getLvEnd()%>',
                			color : '#2D82D7'
             			 },
					<%}%>
	           		<%for (LvUsedListDto dtoo : lvUsedList) {%>
	           			 {
	            			title : '<%=dtoo.getLvName()%>',
	                		start : '<%=dtoo.getLvStart()%>',
	               			end : '<%=dtoo.getLvEnd()%>',
	                		color : '#898C8E'
	             		 },
					<%}
				  }%>
			]
        });
        calendar.render();
      });
     </script>

</body>

</html>