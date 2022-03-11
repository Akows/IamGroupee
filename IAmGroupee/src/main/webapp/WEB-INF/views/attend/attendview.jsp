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
			<c:forEach items="${ATInfo}" var="atin" begin="0" end="0">
	        	<div class="col-md-6 col-xl-3">
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
							<form action="attendstate" method="get">
								<button type="submit" class="form-btn primary-default-btn transparent-btn" style="font-size: larger;">출퇴근현황조회</button>
							</form>	
						</div>
					</article>
				</div>
			</c:forEach>
		</div>
		
		<div class="row stat-cards">

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

</script>





	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
</body>

</html>