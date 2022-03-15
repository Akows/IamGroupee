<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>근태현황 조회페이지</title>
  
  <c:set var="root" value="${pageContext.request.contextPath}"/>
  
  <!-- Favicon -->
  <link rel="shortcut icon" href="../resources/img/svg/looo.png" type="image/x-icon">
  <!-- Custom styles -->
  <link rel="stylesheet" href="../resources/css/style.min.css">
  
  <!-- FullCalendar -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
  <script src="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.3.0/main.min.js"></script>

</head>
<body>

<!-- 메인 메뉴바(좌측 사이드) -->
<%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

<!-- ! Main -->
<main class="main users chart-page" id="skip-target">

	<div class="container">
	       
		<hr>     
		<div style="height: 40px; text-align: left;">
			<h1>근태현황 조회페이지</h1> <br> 오늘 날짜 <h4 style="color: rgb(50, 48, 48); font-weight: 600;" id="currentDate"></h4>
		</div>
		<br>
		<br>
		<hr>
		
		<div class="row stat-cards">
			<c:forEach items="${ATInfo}" var="atin" begin="0" end="0">
	        	<div class="col-md-12 col-xl-3">
					<article class="stat-cards-item">
						<div class="stat-cards-icon success">
							<i data-feather="file" aria-hidden="true"></i>
						</div>
							<div class="stat-cards-info">
							<p class="stat-cards-info__num">사용자정보</p>
							<p class="stat-cards-info__title">이름 : ${atin.user_name}</p>
							<p class="stat-cards-info__title">사번 : ${atin.user_no}</p>
							<p class="stat-cards-info__progress">
								<span class="stat-cards-info__profit success">
									<i data-feather="trending-up" aria-hidden="true"></i>좋은 하루 되세요
								</span>
							</p>
							<hr>

							<button class="form-btn primary-default-btn transparent-btn" type="button" onclick="location.href='${root}/my/modiuser';"> 마이페이지 </button>

						</div>
					</article>
				</div>
				
				<div class="col-md-12 col-xl-9">
	            	<article class="stat-cards-item">
		              	<div class="stat-cards-icon primary">
		                	<i data-feather="bar-chart-2" aria-hidden="true"></i>
		              	</div>
		              	<div class="stat-cards-info">
		                <p class="stat-cards-info__num">근무현황 캘린더</p>
		                <p class="stat-cards-info__progress">
		                  <span class="stat-cards-info__profit success">
		                    <i data-feather="trending-up" aria-hidden="true"></i>출근
		                  </span>
		                </p>
		                <hr>
		                
		    			<div id="calendar">달력</div>
		                
		                <hr>
		              	</div>
	           	 	</article>
          		</div>
				
			</c:forEach>
		</div>
		
		<div class="row stat-cards">
			<div class="col-md-12 col-xl-3">
					<article class="stat-cards-item">
						<div class="stat-cards-icon success">
							<i data-feather="bar-chart-2" aria-hidden="true"></i>
						</div>
						<div class="stat-cards-info">
							<p class="stat-cards-info__num">세부 메뉴</p>
							<p class="stat-cards-info__title">출퇴근현황 조회</p>
							<form action="attendstate" method="get">
								<button type="submit" class="form-btn primary-default-btn transparent-btn" style="font-size: larger;">출퇴근현황조회</button>
							</form>	
							
							<hr>
							
							<p class="stat-cards-info__title">기능 이름</p>
							<form action="" method="get">
								<button type="submit" class="form-btn primary-default-btn transparent-btn" style="font-size: larger;">버튼</button>
							</form>	
							
							<hr>
							
							<p class="stat-cards-info__title">기능 이름</p>
							<form action="" method="">
								<button type="submit" class="form-btn primary-default-btn transparent-btn" style="font-size: larger;">버튼</button>
							</form>	
							
							<hr>							
						</div>
				</article>
			</div>

          
        </div>

	</div>
</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script type="text/javascript">
	//현재 날짜 출력 스크립트
	let today = new Date();
	let year = today.getFullYear(); 
	let month = today.getMonth() + 1
	let day = today.getDate();

	document.getElementById("currentDate").innerHTML = year + '-' + (("00"+month.toString()).slice(-2)) + '-' + (("00"+day.toString()).slice(-2));
	document.getElementById("currentDate2").innerHTML = year + '-' + (("00"+month.toString()).slice(-2)) + '-' + (("00"+day.toString()).slice(-2));
	
	//캘린더 스크립트
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
		         events : 
						[
							
						]
						
					});
			calendar.render();
      });
	
</script>


	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
</body>

</html>