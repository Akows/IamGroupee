<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.iag.leave.entity.LvUsedListDto"%>
<%@page import="com.kh.iag.resv.entity.ResvDto"%>
<%@page import="com.kh.iag.sch.entity.SchDto"%>
<%@page import="com.kh.iag.user.entity.UserDto"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>I am groupe Dashboard</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap');
.container * {font-family: 'Noto Sans KR', sans-serif; /*font-family: 'Nanum Gothic', sans-serif;*/}
#calendar .fc-day-sun {color: red;}
#calendar .fc-day-sat {color: blue;}
#fc-dom-1{font-size: 1.5em;}
#calendar .fc-header-toolbar{margin-top: -15px !important;margin-bottom: 5px !important;padding: 5px;margin: 0;}
#calendar .fc-next-button, #calendar .fc-prev-button {width: 45px !important;height: 35px !important;}
#calendar .fc-today-button{width: 55px !important;height: 35px !important;}
.fc .fc-button {padding: 0px !important;}
.attendShortCut{width: 41%;float: left;padding: 20px;}
.test{margin-right: 21px;width: 57.5%;float: left;padding: 20px;}
.allCalendar{height: 550px !important;}
.announceBoard{padding: 0px !important;width: 99.5%;}
.first{height: 90% !important;}
.second{margin-top: -10px !important;}
.board{width: 100%;}
.more{width: 150px; padding-top: 15% !important;}
.card-title{font-weight: bolder !important; font-size: larger !important;}
#new{color: red; font-weight: bolder;}
/* ---------------------------------------------------------------------------------------------------------- */
#halfHorizon{width: 100%; height: 250px; margin-bottom: 30px;}
#halfHorizon > div:nth-child(1){width:57.5%; height:100%; float: left; border-radius: 10px;}
#halfHorizon > div:nth-child(2){width: 40.5%; height: 100%; background: #fff; float: right; border-radius: 10px;}
#mainProfile{width: 48%; height: 100%; background: #a1d7fc; float: left; border-radius: 10px;}
#mainAttend{width: 48%; height: 100%; background: cornflowerblue; float: right; border-radius: 10px;}
#mainProfile > div:nth-child(1){width: 100%; height: 40%; position: relative;}
#mainProfile > div:nth-child(1) > span{position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 60px; height: 60px; border: 2px solid rgb(31, 111, 230);}
#mainProfile > div:nth-child(2){width: 100%; height: 60%; padding: 10px; background: #fff; border: 1px solid gainsboro; border-bottom-right-radius: 10px; border-bottom-left-radius: 10px;}
#mainProfile > div:nth-child(2) > table{text-align: center; height: 100%; margin: auto; font-size: 14px; font-weight: 600; color: dimgray;}
#mainAttend > * {text-align: center;}
#mainAttend > div:nth-child(1){height: 20%; font-size: 21px; line-height: 2.5; font-weight: 700; color: #fff; text-shadow: 1px 1px 1px #262626;}
#mainAttend > div:nth-child(2){height: 60%; width: 95%; margin: auto; border-radius: 5px; background-color: #fff;}
#mainAttend > div:nth-child(2) > ul{height: 100%; width: 100%; text-align: left; font-size: 13px;}
#mainAttend > div:nth-child(2) > ul > li{height: 20%; padding: 5px; color: #666565;}
#mainAttend > div:nth-child(3){height: 20%; font-size: 20px; line-height: 2.5;}
#mainAttend > div:nth-child(3) > button{width: 150px; font-weight: 500; color: #fff; background: rgb(31, 111, 230); padding: 5px; border-radius: 5px;}
#mainAttend > div:nth-child(3) > button:hover{background: rgba(0, 0, 0, .4);}
#mainEA{width: 100%; height: 100%;}
#mainEA > div:nth-child(1){width: 100%; height: 40%; background: darkblue; border-top-right-radius: 10px; border-top-left-radius: 10px;}
#mainEA > div:nth-child(2){width: 100%; height: 60%; position: relative; border: 1px solid gainsboro; border-bottom-right-radius: 10px; border-bottom-left-radius: 10px;}
#mainEA > div:nth-child(2) a:hover{font-size: 22px; color: royalblue; text-shadow: 1px 1px 2px #262626;}
</style>
<link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
<link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css" />
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<script src="https://kit.fontawesome.com/77be500183.js" crossorigin="anonymous"></script>
</head>
<body>
	<%@ include file="common/headerSide.jsp"%>
	<main class="main users chart-page" id="skip-target">
		<div class="container">
			<div id="halfHorizon">
				<div>
					<div id="mainProfile">
						<div>
							<span class="sidebar-user-img">
								<picture><img src="${root}/resources/img/ps/profile/${loginUser.profile}" alt="User name"></picture>
							</span>
						</div>
						<div>
							<% UserDto loginUser = (UserDto) session.getAttribute("loginUser");
								String residentNo = loginUser.getResidentNo();
								String month = residentNo.substring(2, 4);
								String date = residentNo.substring(4, 6);
								String birthday = month + ". " + date;
							%>
							<table>
								<tr style="color: #262626;">
									<td colspan="2" style="font-size: 18px; font-weight: 900; 
									color: darkblue;
									text-shadow: 2px 2px 1px gainsboro;">${loginUser.name} ${loginUser.positionName}</td>
								</tr>
								<tr>
									<td><i class="fas fa-user-friends"></i></td>
									<td>${loginUser.departmentName}</td>
								</tr>
								<tr>
									<td><i class="fas fa-birthday-cake"></i></td>
									<td><%=birthday%></td>
								</tr>
								<tr>
									<td><i class="fas fa-mobile-alt"></i></td>
									<td>${loginUser.phone}</td>
								</tr>
								<tr>
									<td><i class="fas fa-envelope"></i> </td>
									<td>${loginUser.email}</td>
								</tr>
							</table>
						</div>
					</div>
					<div id="mainAttend">
						<div>
							<i class="fas fa-address-card"></i> 근태출퇴근
						</div>
						<div>
							<ul>
								<li><i class="far fa-check-circle"></i> 모든 사원은 출근 및 퇴근 처리를 반드시 잊지 말아주세요.</li>
								<li><i class="far fa-check-circle"></i> 출퇴근 미처리로 발생하는 모든 불이익은 당사자에게 있습니다.</li>
								<li><i class="far fa-check-circle"></i> 출퇴근 처리 실수, 오류시 근태수정요청이 가능합니다.</li>
								<li><i class="far fa-check-circle"></i> 근태 현황을 수시 체크하여 불이익이 없도록 주의 부탁드립니다.</li>
								<li><i class="far fa-check-circle"></i> 출퇴근 관련 문의는 인사팀으로 부탁드립니다.</li>
							</ul>
						</div>
						<div>
							<button onclick="location.href='${root}/attend/attendmain';">출퇴근처리</button>
						</div>
					</div>
				</div>

				<div>
					<div id="mainEA">
						<div>
							<div style="width: 40%; height: 100%; position: relative; float: left;">
								<span style="position: absolute; top: 50%; left: 50%; transform: translate(-50%,-50%); color: #fff; font-size: 21px; font-weight: 700; text-shadow: 1px 1px 1px #262626;">
									<i class="far fa-file-alt"></i> 결재현황
								</span>
							</div>
							<div style="width: 60%; height: 100%; position: relative; float: left;">
								<table style="width: 75%; text-align: center; position: absolute; top: 50%; left: 50%; transform: translate(-50%,-50%); color: #fff; font-size: 21px; font-weight: 700; text-shadow: 1px 1px 1px #262626;">
									<tr style="font-size: 17px;">
										<th>대기</th>
										<th>진행</th>
										<th>전체</th>
									</tr>
									<tr>
										<td>${countOfWait}</td>
										<td>${countOfProg}</td>
										<td>${countOfSignup}</td>
									</tr>
								</table>
							</div>
						</div>
						<div>
							<table style="width: 80%; height: 70%; text-align: center; position: absolute; top: 50%; left: 50%; transform: translate(-50%,-50%); font-size: 20px;">
								<tr>
									<th><a href="${root}/ea/signuplist">기안문서</a></th>
									<th><a href="${root}/ea/apprlist">결재문서</a></th>
									<th><a href="${root}/ea/reflist">참조문서</a></th>
									<th><a href="${root}/ea/entirelist">완료문서</a></th>
								</tr>
								<tr>
									<td>${countOfSignup}</td>
									<td>${countOfAppr}</td>
									<td>${countOfRefer}</td>
									<td>${countOfEntire}</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row stat-cards second">
				<div class="col-md-6 col-xl-7">
					<article class="stat-cards-item announceBoard">
						<div class="stat-cards-info board" style="width: 97%; margin: 15px auto;">
							<div class="card board">
				              <div class="card-header">
				                <h3 class="card-title">공지사항</h3>
				                <div class="card-tools">
				                  <div class="input-group input-group-sm float-right more">
				                      <a href="${root}/board/notice">더보기></a>
				                  </div>
				                </div>
				              </div>
				              <!-- /.card-header -->
				              <div class="card-body table-responsive p-0 board">
				                <table class="table table-hover text-nowrap">
				                  <thead>
				                    <tr>
				                      <th>제목</th>
				                      <th>작성자</th>
				                      <th>작성날짜</th>
				                    </tr>
				                  </thead>
				                  <tbody>
				                   <c:forEach items="${noticeBoardList}" var="nbl">
				                    <tr>
				                      <td><a href="${root}/board/noticeBoardDetail/${nbl.noticeNum}">${nbl.noticeTitle}</a></td>
				                      <td><a href="${root}/board/noticeBoardDetail/${nbl.noticeNum}">관리자</a></td>
				                      <td><a href="${root}/board/noticeBoardDetail/${nbl.noticeNum}">${nbl.noticeDate} &nbsp;&nbsp;<span id="new">New!</span></a></td>
				                    </tr>
				                   </c:forEach>
				                  </tbody>
				                </table>
				              </div>
				              <!-- /.card-body -->
				            </div>
				            <!-- /.card -->
						</div>
						
						<div class="stat-cards-info board" style="width: 97%; margin: 15px auto;">
							<div class="card board">
				              <div class="card-header">
				                <h3 class="card-title">자유게시판</h3>
				
				                <div class="card-tools">
				                  <div class="input-group input-group-sm float-right more">
				                      <a href="${root}/board/freeBoard">더보기></a>
				                  </div>
				                </div>
				              </div>
				              <!-- /.card-header -->
				              <div class="card-body table-responsive p-0 board">
				                <table class="table table-hover text-nowrap">
				                  <thead>
				                    <tr>
				                      <th>제목</th>
				                      <th>작성자</th>
				                      <th>작성날짜</th>
				                    </tr>
				                  </thead>
				                  <tbody>
				                   <c:forEach items="${freeBoardList}" var="fbl">
				                    <tr>
				                      <td><a href="${root}/board/freeBoardDetail/${fbl.boardFreeNum}">${fbl.freeTitle}</a></td>
				                      <td><a href="${root}/board/freeBoardDetail/${fbl.boardFreeNum}">익명</a></td>
				                      <td><a href="${root}/board/freeBoardDetail/${fbl.boardFreeNum}">${fbl.freeDate} &nbsp;&nbsp;<span id="new">New!</span></a></td>
				                    </tr>
				                   </c:forEach>
				                  </tbody>
				                </table>
				              </div>
				              <!-- /.card-body -->
				            </div>
				            <!-- /.card -->
						</div>
					</article>
				</div>
				
				<div class="col-md-6 col-xl-5">
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
                			color : '#F9C46B'
             			 },
					<%}%>
	           		<%for (LvUsedListDto dtoo : lvUsedList) {%>
	           			 {
	            			title : '<%=dtoo.getLvName()%>',
	                		start : '<%=dtoo.getLvStart()%>',
	               			end : '<%=dtoo.getLvEnd()%>',
	                		color : '#F9C46B'
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
				  <%List<SchDto> personalList = (List<SchDto>) request.getAttribute("personalList");%>
					<%List<SchDto> deptList = (List<SchDto>) request.getAttribute("deptList");%>
					<%List<SchDto> corpList = (List<SchDto>) request.getAttribute("corpList");%>
	            	<%if (personalList != null || deptList != null || corpList != null) {%>
	           			<%for (SchDto dto : personalList) {%>
	           				 {
	            				title : '<%=dto.getSchTitle()%>',
	                			start : '<%=dto.getSchStartStr()%>',
	               				end : '<%=dto.getSchEndStr()%>',
	                			color : '#DAD873'
	             			 },
						<%}%>
						<%for (SchDto dtoo : deptList) {%>
		      				 {
		            			title : '<%=dtoo.getSchTitle()%>',
		                		start : '<%=dtoo.getSchStartStr()%>',
		               			end : '<%=dtoo.getSchEndStr()%>',
		           				color : '#DAD873'
		        			 },
						<%}%>
		           		<%for (SchDto dtooo : corpList) {%>
	          				 {
		            			title : '<%=dtooo.getSchTitle()%>',
		                		start : '<%=dtooo.getSchStartStr()%>',
		               			end : '<%=dtooo.getSchEndStr()%>',
	               				color : '#DAD873'
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