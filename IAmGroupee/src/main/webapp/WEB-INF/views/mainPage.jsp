<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.iag.leave.entity.LvUsedListDto"%>
<%@page import="com.kh.iag.resv.entity.ResvDto"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>I am groupe Dashboard</title>
<style type="text/css">
#calendar .fc-day-sun {color: red;}
#calendar .fc-day-sat {color: blue;}
#fc-dom-1{
    font-size: 1.5em;
}
#calendar .fc-header-toolbar{
margin-top: -15px !important;
margin-bottom: 5px !important;
padding: 5px;
margin: 0;
}
#calendar .fc-next-button, #calendar .fc-prev-button {
width: 45px !important;
height: 35px !important;
}
#calendar .fc-today-button{
width: 55px !important;
height: 35px !important;
}
.fc .fc-button {
padding: 0px !important;
}
.test, .attendShortCut{
width: 32.3%;
float: left;
padding: 20px;
}
.test{
margin-right: 20px;
}
.allCalendar{
height: 550px !important;
}
.announceBoard{
padding: 0px !important;
margin-right: 5px;
}
.first{
height: 90% !important;
}
.second{
margin-top: -10px !important;
}
</style>
<link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
<link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css" />
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
</head>
<body>
	<%@ include file="common/headerSide.jsp"%>
	<main class="main users chart-page" id="skip-target">
		<div class="container">
			<h2 class="main-title">Iag Groupware</h2>
			<div class="row stat-cards">
				<div class="col-md-6 col-xl-12">
				  <div class="first">
					<article class="stat-cards-item test">
						<div class="stat-cards-info">
							<p class="stat-cards-info__num">무엇을 넣어야할까</p>
							<pre>






                  
                           </pre>
						</div>
					</article>
					
					<article class="stat-cards-item test">
						<div class="stat-cards-info">
							<p class="stat-cards-info__num">무엇을 넣어야할까</p>
							<pre>






                  
                           </pre>
						</div>
					</article>

					<article class="stat-cards-item attendShortCut">
						<div class="stat-cards-info">
							<p class="stat-cards-info__num">출퇴근 숏컷</p>
							<pre>






                  
                           </pre>
						</div>
					</article>
				</div>
			  </div>	
			</div>	
			
			<div class="row stat-cards second">
				<div class="col-md-6 col-xl-8">
					<article class="stat-cards-item announceBoard">
						<div class="stat-cards-info">
							<p class="stat-cards-info__num">공지 게시판</p>
							<pre>






                  
                           </pre>
						</div>
					</article>
				</div>
				
				<div class="col-md-6 col-xl-4">
					<article class="stat-cards-item allCalendar" style="padding: 0px;">
						<div id='calendar' style="width: 90%; text-align: center; margin: auto;"></div>
					</article>
				</div>
			</div>

		</div>
	</main>
	<%@ include file="common/footer.jsp"%>
	<script src="${root}/resources/js/script.js"></script>
	<script>
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
        	height: '500px',
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
                			color : '#4D3FCD'
             			 },
					<%}%>
	           		<%for (LvUsedListDto dtoo : lvUsedList) {%>
	           			 {
	            			title : '<%=dtoo.getLvName()%>',
	                		start : '<%=dtoo.getLvStart()%>',
	               			end : '<%=dtoo.getLvEnd()%>',
	                		color : '#4D3FCD'
	             		 },
					<%}
				  }%>
    	    	<%List<ResvDto> myRoomResvList = (List<ResvDto>)request.getAttribute("myRoomResvList");%>
				<%List<ResvDto> myAssetResvList = (List<ResvDto>)request.getAttribute("myAssetResvList");%>
            	<%if (myRoomResvList != null) {%>
           			<%for (ResvDto resvDto : myRoomResvList) {%>
           				 {
            				title : '<%=resvDto.getRoomName()%>',
                			start : '<%=resvDto.getResvStart()%>',
               				end : '<%=resvDto.getResvEnd()%>',
                			color : '#917656'
             			 },
					<%}}else if(myAssetResvList != null) {%>
	           		<%for (ResvDto resvDto : myAssetResvList) {%>
	           			 {
	            			title : '<%=resvDto.getAssetName()%>',
	                		start : '<%=resvDto.getResvStart()%>',
	               			end : '<%=resvDto.getResvEnd()%>',
	                		color : '#917656'
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