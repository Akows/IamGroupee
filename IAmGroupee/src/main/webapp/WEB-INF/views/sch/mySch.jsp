<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MySchedule Page</title>
  
  <c:set var="root" value="${pageContext.request.contextPath}"/>
  
  <!-- Favicon -->
  <link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">
  <!-- Custom styles -->
  <link rel="stylesheet" href="${root}/resources/css/style.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
  <!-- FullCalendar -->
  <link rel='stylesheet' href='${root}/resources/css/sch/fullcalendar.min.css' />
  <link rel='stylesheet' href='${root}/resources/css/sch/bootstrap.min.css' />
  <link rel='stylesheet' href='${root}/resources/css/sch/select2.min.css' />
  <link rel='stylesheet' href='${root}/resources/css/sch/bootstrap-datetimepicker.min.css' />
  
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  
  <link rel='stylesheet' href='${root}/resources/css/sch/main.css' />
</head>

<body>

    <%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

    <!-- ! Main -->
    <main class="main users chart-page" id="skip-target">
    
     <div class="container">
      
        <div class="row stat-cards">
        
          <!-- 일정 선택 div -->
          <div class="col-md-6 col-xl-2" style="height: 750px;">
            <article class="stat-cards-item">
             <div id="schdule-info" style="position: relative; bottom: 60px">
             		<p style="color: gray; font-weight: bold; font-size: large;">일정</p>
				<br><br>
					<div id="all-sch" style="position: relative; font-size:1.4em;  font-weight: bold;">
						<input type="radio" name="" id="" style="width: 15px; height: 15px; position: relative; left: 10px; top: 3px;"> 전체 일정
					</div>
				<br><br>
					<div id="my-sch" style="position: relative; font-size:1.4em; font-weight: bold;">
						<input type="radio" name="" id="" style="width: 15px; height: 15px; position: relative; left: 10px; top: 3px;"> 내가 등록한 일정
					</div>
				<br><br>
					<div id="detp-sch" style="position: relative; font-size:1.4em;  font-weight: bold;">
						<input type="radio" name="" id="" style="width: 15px; height: 15px; position: relative; left: 10px; top: 3px;"> 부서별 일정
					</div>
				<br><br>
				<hr style="width: 190px; left: 10px;">
				<br>
					<!-- 필터별 선택 -->
					<p style="color: gray; font-weight: bold; font-size: large;">구분</p>
				<br><br>
					<div class="input-group" style=" left: 10px;">
						<label for="calendar_view" style="font-size:1.4em;  font-weight: bold; right: 30px;">참석자</label>
                        <select class="filter" id="type_filter" multiple="multiple">
                            <option value="카테고리1">카테고리1</option>
                            <option value="카테고리2">카테고리2</option>
                            <option value="카테고리3">카테고리3</option>
                            <option value="카테고리4">카테고리4</option>
                        </select>
                    </div>
                 <br><br>
                 <div class="col-lg-6" style="">
                    <label for="calendar_view" style="font-size:1.4em;  font-weight: bold;">캘린더</label>
                    <div class="input-group" style="width: 100px;">
                        <label class="checkbox-inline" style="font-size:1.4em;  font-weight: bold;"><br>
                        <input class='filter' type="checkbox" value="정연" checked>기본 캘린더</label>
                        
                        <label class="checkbox-inline" style="font-size:1.4em;  font-weight: bold;"><br>
                        <input class='filter' type="checkbox" value="다현" checked>부서 캘린더</label>
                        
                        <label class="checkbox-inline" style="font-size:1.4em;  font-weight: bold;"><br>
                        <input class='filter' type="checkbox" value="사나" checked>전사 캘린더</label>
                    </div>
                </div>
             </div>
            </article>
          </div> <!-- /일정 선택 div -->
        
          <!-- Fullcalendar 페이지 -->
          <div class="col-md-7 col-xl-8" style="height: 750px">
            <article class="stat-cards-item">
		      
	          <iframe src="${root}/sch/schedule" height="100%" width="100%" scrolling="no"></iframe>
				    
            </article>
          </div><!-- /Fullcalendar 페이지 -->
          
        </div>
        
        <div class="row">
          
        
        </div>
        

      </div>
    </main>

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>

	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
	<!-- FullCalendar js -->
	<script src='${root}/resources/js/sch/jquery.min.js'></script>
	<script src='${root}/resources/js/sch/bootstrap.min.js'></script>
	<script src='${root}/resources/js/sch/moment.min.js'></script>
	<script src='${root}/resources/js/sch/fullcalendar.min.js'></script>
	<script src='${root}/resources/js/sch/ko.js'></script>
	<script src='${root}/resources/js/sch/select2.min.js'></script>
	<script src='${root}/resources/js/sch/bootstrap-datetimepicker.min.js'></script>
	
	<script src='${root}/resources/js/sch/main.js'></script>
	<script src='${root}/resources/js/sch/addEvent.js'></script>
	<script src='${root}/resources/js/sch/editEvent.js'></script>
	<script src='${root}/resources/js/sch/etcSetting.js'></script>
</body>

</html>