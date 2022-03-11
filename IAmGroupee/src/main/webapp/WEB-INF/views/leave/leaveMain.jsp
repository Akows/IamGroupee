<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>LeaveMain Page</title>
  <!-- Theme style -->
  <link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
  <!-- Favicon -->
  <link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">
  <!-- Toastr -->
  <link rel="stylesheet" href="${root}/resources/plugins/toastr/toastr.min.css">
</head>

<body>

    <%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

    <!-- ! Main -->
    <main class="main users chart-page" id="skip-target">
     <div class="container">
       
        <div style="height: 40px; text-align: center;">
        	<h1 style="color: rgb(50, 48, 48); font-weight: 600;" id="currentDate"></h1>
        </div>
        
        <br>

			<div class="row stat-cards">
				<div class="col-md-6 col-xl-12" style="width: 20%; height: 150px;">
					<article class="stat-cards-item" style="text-align: center; margin: auto;">
						<div style="width: 13%; height: 100%; float: left; line-height: 5.5em; font-weight: bolder; font-size: large;">
							<button type="button" class="btn btn-default toastsDefaultDefault" style="width: 100%;float: left; line-height: 5em; font-weight: bolder; font-size: large;">
								${loginUser.name}
							</button>
							<script type="text/javascript">
								$('.toastsDefaultDefault').click(function() {
									$(document).Toasts('create', {
										title : '연차 발생을 위한 정보',
										body : '1년이상근무여부/전년도근무일수(80이상여부)/저번달개근여부'
									})
								});
							</script>
						</div>
						<div class="border-right"
							style="width: 7%; height: 100%; float: left; text-align: left; font-weight: bold; font-size: medium;">
							<div style="margin-top: 25px; margin-left: 15px;">
								${loginUser.departmentName}<br>${loginUser.positionName}
							</div>
						</div>
						<div class="border-right"
							style="width: 13%; height: 100%; float: left; margin-left: 4px;">
							<span style="font-weight: bolder; line-height: 1.7em;"> 발생
								연차 </span> <br> <span
								style="font-size: xx-large; line-height: 2.5em;">
								${allUsedAlvList.alvCount} </span>
						</div>
						<div class="border-right"
							style="width: 13%; height: 100%; float: left; margin-left: 4px;">
							<span style="font-weight: bolder; line-height: 1.7em;"> 발생
								월차 </span> <br> <span
								style="font-size: xx-large; line-height: 2.5em;">
								${allUsedAlvList.mlvCount} </span>
						</div>
						<div class="border-right"
							style="width: 13%; height: 100%; float: left; margin-left: 4px;">
							<span style="font-weight: bolder; line-height: 1.7em;"> 조정
								연차 </span> <br> <span
								style="font-size: xx-large; line-height: 2.5em;">
								${allUsedAlvList.alvAddCount} </span>
						</div>
						<div class="border-right"
							style="width: 13%; height: 100%; float: left; margin-left: 4px;">
							<span style="font-weight: bolder; line-height: 1.7em;"> 총
								연차 </span> <br> <span
								style="font-size: xx-large; line-height: 2.5em;">
								${allUsedAlvList.alvTotalCount} </span>
						</div>
						<div class="border-right"
							style="width: 13%; height: 100%; float: left; margin-left: 4px;">
							<span style="font-weight: bolder; line-height: 1.7em;"> 사용
								연차 </span> <br> <span
								style="font-size: xx-large; line-height: 2.5em;">
								${allUsedAlvList.alvUsedCount} </span>
						</div>
						<div
							style="width: 13%; height: 100%; float: left; margin-left: 4px;">
							<span style="font-weight: bolder; line-height: 1.7em;"> 남은
								연차 </span> <br> <span
								style="font-size: xx-large; line-height: 2.5em;">
								${allUsedAlvList.alvTotalCount - allUsedAlvList.alvUsedCount} </span>
						</div>
					</article>
				</div>
			</div>

			<br>
       
        <div style="height: 40px; width: 100%;">
        	<div style="width: 25%; height: 100%; float: left;">
        		<p style=" color: rgb(94, 94, 94); font-weight: 600; font-size: large; margin-top: 10px; float: left;">${startDate}</p>
        		<p style=" color: rgb(94, 94, 94); font-weight: 600; font-size: large; margin-top: 10px; float: left;">&nbsp~&nbsp</p>
        		<p style=" color: rgb(94, 94, 94); font-weight: 600; font-size: large; margin-top: 10px; float: left;" id="currentDate2"></p>
			</div>
        	<div style="width: 45%; height: 100%; float: left;"></div>
        	<div style="width: 30%; height: 100%; float: left; text-align: right;">
        		<!-- 사용가능한 연차가 없을 시 알림창 띄우고 leaveMain으로 돌아오기 -->
        		<input type="button" onclick="location.href='${root}/ea/write_lvA'" value="연차 신청" style="background-color: rgb(14, 104, 225); margin-right: 6px; font-weight: bold; color: white;">
        		<input type="button" onclick="location.href='${root}/ea/write_lvB'" value="휴가 신청" style="background-color: rgb(14, 104, 225); font-weight: bold; color: white;">
        	</div>
        </div>
       
        <div style="height: 30px; width: 100%;">
        	<div style="width: 25%; height: 100%; float: left;">
        		<h3 style="color: rgb(94, 94, 94); font-weight: 600; font-size: larger; margin-top: 4px; margin-left: 3px">사용 내역</h3>
			</div>
        </div>
        
        <div class="row stat-cards" style="height: 30%;">
          <div class="col-md-6 col-xl-12">
            <article class="stat-cards-item">
            
              <div class="stat-cards-info" style="width: 100%">
                <table class="table" style="width: 100%">
				  <thead>
				    <tr>
				      <th scope="col">이름</th>
				      <th scope="col">부서명</th>
				      <th scope="col">휴가명</th>
				      <th scope="col">사용 기간</th>
				      <th scope="col">사용 연차</th>
				      <th scope="col">사유</th>
				    </tr>
				  </thead>
				  <tbody>
				  <c:forEach items="${allUsedList}" var="allUsedList">
				    <tr>
				      <td style="width: 15%">${allUsedList.name}</td>
				      <td style="width: 15%">${allUsedList.departmentName}</td>
				      <td style="width: 12%">${allUsedList.lvName}</td>
				      <td style="width: 25%">${allUsedList.during}</td>
				      <td style="width: 13%">${allUsedList.reduceAlv}</td>
				      <td style="width: 20%">${allUsedList.lvReason}</td>
				    </tr>
				  </c:forEach>
				  </tbody>
				</table>
              </div>
            </article>
          </div>
        </div>
        
        <br>
       
        <div style="height: 30px; width: 100%;">
        	<div style="width: 25%; height: 100%; float: left;">
        		<h3 style="color: rgb(94, 94, 94); font-weight: 600; font-size: larger; margin-top: 4px; margin-left: 3px">생성 내역</h3>
			</div>
        </div>
        
        <div class="row stat-cards" style="height: 30%;">
          <div class="col-md-6 col-xl-12">
            <article class="stat-cards-item">
            
                  
              <div class="stat-cards-info" style="width: 100%">
                <table class="table" style="width: 100%">
				  <thead>
				    <tr>
				      <th scope="col">발생명</th>
				      <th scope="col">등록일</th>
				      <th scope="col">발생일수</th>
				      <th scope="col">내용</th>
				    </tr>
				  </thead>
				  <tbody>
				  <c:forEach items="${lvHistoryList}" var="lvHistoryList">
				    <tr>
				      <td style="width: 15%">${lvHistoryList.lvName}</td>
				      <td style="width: 15%">${lvHistoryList.alvOccurDate}</td>
				      <td style="width: 10%">${lvHistoryList.alvOccurCount}</td>
				      <td style="width: 17%">${lvHistoryList.alvOccurReason}</td>
				    </tr>
				  </c:forEach>
				  </tbody>
				</table>
              </div>
              
            
            </article>
          </div>
        </div>
      </div>
    </main>

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script type="text/javascript">
	let today = new Date();
	let year = today.getFullYear(); 
	let month = today.getMonth() + 1
	let day = today.getDate();

	document.getElementById("currentDate").innerHTML = year + '-' + (("00"+month.toString()).slice(-2)) + '-' + (("00"+day.toString()).slice(-2));
	document.getElementById("currentDate2").innerHTML = year + '-' + (("00"+month.toString()).slice(-2)) + '-' + (("00"+day.toString()).slice(-2));
</script>

	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
</body>

</html>