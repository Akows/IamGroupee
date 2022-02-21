<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>근태관리 메인페이지</title>
  
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
			<h1>근태관리 메인페이지</h1> <br> 오늘 날짜 <h4 style="color: rgb(50, 48, 48); font-weight: 600;" id="currentDate"></h4>
		</div>
		<br>
		<br>
		<hr>

		<div class="row stat-cards">

		
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon primary">
                <i data-feather="bar-chart-2" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">춭퇴근 처리</p>
                <p class="stat-cards-info__title">금일 근무 상황</p>
                <p class="stat-cards-info__progress">
                  <span class="stat-cards-info__profit success">
                    <i data-feather="trending-up" aria-hidden="true"></i>출근
                  </span>
                  처리 완료됨.
                </p>
                <hr>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon warning">
                <i data-feather="file" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">비정상 근무일수</p>
                <p class="stat-cards-info__title">0일</p>
                <p class="stat-cards-info__progress">
                  <span class="stat-cards-info__profit success">
                    <i data-feather="trending-up" aria-hidden="true"></i>이상없음
                  </span>
                </p>
                <hr>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon purple">
                <i data-feather="file" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">근태수정요청</p>
                <p class="stat-cards-info__title">1건</p>
                <p class="stat-cards-info__progress">
                  <span class="stat-cards-info__profit danger">
                    <i data-feather="trending-down" aria-hidden="true"></i>미처리됨
                  </span>
                  심사중
                </p>
                <hr>
              </div>
            </article>
          </div>
          
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-icon purple">
                <i data-feather="file" aria-hidden="true"></i>
              </div>
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">근무경고현황</p>
                <p class="stat-cards-info__title">경고 3회</p>
                <p class="stat-cards-info__progress">
                  <span class="stat-cards-info__profit danger">
                    <i data-feather="trending-down" aria-hidden="true"></i>지각잦음
                  </span>
                  주의
                </p>
                <hr>
              </div>
            </article>
          </div>

        </div>

        <div class="row stat-cards">
        	<div class="col-md-9 col-xl-6">
				<article class="stat-cards-item">
			    	<div class="stat-cards-icon warning">
			        	<i data-feather="file" aria-hidden="true"></i>
			            </div>
			            	<div class="stat-cards-info">
				                <p class="stat-cards-info__num">이번달 근무상황</p>
				                <p class="stat-cards-info__title">총 근무시간 : 53시간 30분</p>
				                <p class="stat-cards-info__progress">
				                  <span class="stat-cards-info__profit success">
				                    <i data-feather="trending-up" aria-hidden="true"></i>근무 시간 초과됨
				                  </span>
				                  1시간 30분
				                </p>
				                <hr>
				                이 위치에 직선형 그래프 배치하면 좋을듯?
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