<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려사유 조회페이지</title>

  <!-- Favicon -->
  <link rel="shortcut icon" href="../resources/img/svg/looo.png" type="image/x-icon">
  <!-- Custom styles -->
  <link rel="stylesheet" href="../resources/css/style.min.css">


</head>
<body>
	
	<br>
	
	<h1>반려사유 조회</h1>
	
	<hr>

	<div class="container">	
		<div class="row stat-cards">
			<c:forEach items="${getRReason}" var="Rreason" begin="0" end="0">
	        <div class="col-md-6 col-xl-3">
				<article class="stat-cards-item">
					<div class="stat-cards-icon success">
						<i data-feather="file" aria-hidden="true"></i>
					</div>
						<div class="stat-cards-info">
						<p class="stat-cards-info__num"></p>
						<p class="stat-cards-info__title">신청자 : ${Rreason.user_name}</p>
						<p class="stat-cards-info__title">신청일 : ${Rreason.req_date}</p>
						<p class="stat-cards-info__title">수정요청일자 : ${Rreason.modify_req_date}</p>
						<p class="stat-cards-info__progress">
							<hr>
							<span class="stat-cards-info__profit danger">
								현재 상태 : ${Rreason.approve_state}
							</span>
							<hr>
						</p>
						<p class="stat-cards-info__title">반려사유 : <b>${Rreason.reject_reason}</b></p>
					</div>
				</article>
			</div>
		</c:forEach>
		</div> 
	</div>
	
	<hr>


</body>
</html>