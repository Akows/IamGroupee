<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.iag.sch.entity.SchDto"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>UsedLeaveList</title>

<style type="text/css">
#calendar .fc-day-sun { color: red; }
#calendar .fc-day-sat { color: blue; }
</style> 
<link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">
<link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
<link rel='stylesheet' href='${root}/resources/css/sch/fullcalendar.min.css' />
<link rel='stylesheet' href='${root}/resources/css/sch/bootstrap.min.css' />
<link rel='stylesheet' href='${root}/resources/css/sch/select2.min.css' />
<link rel="stylesheet" 	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.1/dist/css/adminlte.min.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
</head>

<body>

	<%@ include file="/WEB-INF/views/common/headerSide.jsp"%>

	<main class="main users chart-page" id="skip-target">

		<div class="container" style="margin-top: 3.5%; margin-left: 5%;">
			<div class="row stat-cards">
				<div class="col-md-7 col-xl-6">
					<iframe src="${root}/sch/mySch2" scrolling="no" height="100%" width="100%"></iframe>
				</div>
				<div class="col-md-7 col-xl-6">
					<article class="stat-cards-item">
						<div id='calendar' style="width: 90%; margin: auto; text-align: center; margin-top: 10px;"></div>
						<input type="hidden" id="userNo" value="${userNo}">
					</article>
				</div>
			</div>
		
				<!-- 모달창 -->
				<div class="modal" tabindex="-1" role="dialog">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<input class="modal-title schTitle" type="text" name="schTitle">
								<input type="hidden" class="schNum" name="schNum"></input>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="close_modal();">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<table>
									<tr>
										<td>
											<label>스케쥴일자</label>
										</td>
										<td>
											<input type="text" class="schEnroll" name="schEnroll">
										</td>
									</tr>	
									<tr>
										<td>
											<label>세부사항</label>
										</td>
										<td>
											<textarea rows="4" cols="30" name="schContent" class="schContent"></textarea>
										</td>
									</tr>						
								</table>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary modSch" id="modSch">수정</button>
								<button type="submit" class="btn btn-primary delSch" id="delSch">삭제</button>
								<button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="close_modal();">닫기</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 모달창End -->	
		</div>
	</main>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>

	<script type="text/javascript">
	function show_modal(schNum, schTitle, schStart, schEnd, schContent) {
		var schEnroll = '';
		if (schEnd === 'Invalid date') {
			schEnroll = schStart;
		} else {
			schEnroll = schStart + '~' + schEnd;
		}
		$(".schNum").val(schNum);
		$(".schTitle").val(schTitle);
		$(".schEnroll").val(schEnroll);
		$(".schContent").text(schContent);
	    $('.modal').show();
	};
	function close_modal() {
	     $('.modal').hide();
	};

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth', 
            googleCalendarApiKey: 'AIzaSyDYMx36O77hSRC2wnwmpzWJ6M2BJ_F8fek',
			headerToolbar : { 
				start : 'today',
				center : 'title',
				end : 'prev next'
			},
			titleFormat : function(date) {
				return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
			},
			selectable : true,
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
    	    	<%List<SchDto> personalList = (List<SchDto>) request.getAttribute("personalList");%>
				<%List<SchDto> deptList = (List<SchDto>) request.getAttribute("deptList");%>
				<%List<SchDto> corpList = (List<SchDto>) request.getAttribute("corpList");%>
            	<%if (personalList != null || deptList != null || corpList != null) {%>
           			<%for (SchDto dto : personalList) {%>
           				 {
            				id : '<%=dto.getSchNum()%>',
           					title : '<%=dto.getSchTitle()%>',
                			start : '<%=dto.getSchStartStr()%>',
               				end : '<%=dto.getSchEndStr()%>',
               				extendedProps: {
               			        schContent: '<%=dto.getSchContent()%>'
               			      },
                			color : '#ACCC59'
             			 },
					<%}%>
					<%for (SchDto dtoo : deptList) {%>
	      				 {
	            			id : '<%=dtoo.getSchNum()%>',
	            			title : '<%=dtoo.getSchTitle()%>',
	                		start : '<%=dtoo.getSchStartStr()%>',
	               			end : '<%=dtoo.getSchEndStr()%>',
               				extendedProps: {
               					department: '<%=dtoo.getSchContent()%>'
               			      },
	           				color : '#4D3FCD'
	        			 },
					<%}%>
	           		<%for (SchDto dtooo : corpList) {%>
          				 {
             				id : '<%=dtooo.getSchNum()%>',
          					title : '<%=dtooo.getSchTitle()%>',
	                		start : '<%=dtooo.getSchStartStr()%>',
	               			end : '<%=dtooo.getSchEndStr()%>',
               				extendedProps: {
               					schContent: '<%=dtooo.getSchContent()%>'
               			      },
               				color : '#53D2CC'
            			 },
					<%}
				}%> 
			],
			eventClick: function(info,event,userNo,view) {
				var schNum = info.event.id;
				var schTitle = info.event.title;
				var schStart = moment(info.event.start).format('YYYY-MM-DD');
				var schEnd = moment(info.event.end).format('YYYY-MM-DD');
				var schContent = Object.values(info.event.extendedProps);
				
				show_modal(schNum, schTitle, schStart, schEnd, schContent);
			},
        });
        calendar.render();
      });
      // 일정 수정
      $(function() {
  	    $('.modSch').click(function() {
  	        var schNum = $('.schNum').val();
  	        var schTitle = $('.schTitle').val();      
  	        var schEnroll = $('.schEnroll').val();    
  	        var schContent = $('.schContent').val();    
  	            
  	        var request = $.ajax({
  	            url: "${root}/sch/modSch",
  	            method: "POST",
  	            data: {schNum, schTitle, schEnroll, schContent}, 
  	            dataType: "text" 
  	        });
  	             
  	        request.done(function( data ) {
  	            console.log(data);
  	            alert( "일정이 수정되었습니다.");
  	          	close_modal();
  	            window.location.reload();
  	        });
  	 
  	        request.fail(function() {
  	            alert( "일정이 수정되지않았습니다.");
  	        });
  	 
  	        request.always(function() {
  	            console.log('완료');
  	        });
  	    });
	});
  	  
      // 일정 삭제
  	  $(function() {
    	    $('.delSch').click(function() {
    	        var schNum = $('.schNum').val();  
    	            
    	        var request = $.ajax({
    	            url: "${root}/sch/delSch",
    	            method: "POST",
    	            data: {schNum},
    	            dataType: "text" 
    	        });
    	             
    	        request.done(function( data ) {
    	            console.log(data);
    	            alert( "일정이 삭제되었습니다.");
    	          	close_modal();
    	            window.location.reload();
    	        });

    	        request.fail(function() {
    	            alert( "일정이 삭제되지않았습니다.");
    	        });
    	 
    	        request.always(function() {
    	            console.log('완료');
    	        });
    	    });
	    });
     </script>

</body>

</html>