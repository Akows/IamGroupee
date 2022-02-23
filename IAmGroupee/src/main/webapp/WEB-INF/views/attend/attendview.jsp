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

<script>

</script>
<style>

</style>

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
          <div class="col-md-12 col-xl-12">
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
                
                달력이 들어갈 위치
                
                
                <hr>
              </div>
            </article>
          </div>
        </div>
        

        <hr>

        
        <div class="row stat-cards">
          <div class="col-md-12 col-xl-12">
            <article class="stat-cards-item">
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">근무상황 수정요청</p>
                <p class="stat-cards-info__title">천재지변/긴급한 용무 등으로 정상출근 처리가 필요한 경우 요청</p>
                <p class="stat-cards-info__title">진단서 등 첨부파일이 존재할 경우 반드시 첨부할 것</p>
                <hr>
                
                <form action="attendmodify" method="post">
                
	                <input type="text" placeholder="내용작성하여 제출">
	                <br>
	                <br>
	                <input type="file">
	                
	                <hr>
	                
	                <input type="submit" class="form-btn primary-default-btn transparent-btn" style="font-size: larger;" value="수정요청">
	                
	                <button type="submit" class="form-btn primary-default-btn transparent-btn" style="font-size: larger;" value="수정요청"></button>
                
                </form>
                
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