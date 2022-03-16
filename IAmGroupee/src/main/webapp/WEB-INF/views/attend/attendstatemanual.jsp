<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>근태현황 조회페이지 - 설명서</title>
  
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

<main class="main users chart-page" id="skip-target">
	<div class="container">
		<div class="row stat-cards">
			<div class="col-lg-12">
	            <div class="users-table table-wrapper">
	

					<div class="row stat-cards">
				        	<div class="col-md-12 col-xl-6">
				            <article class="stat-cards-item">
				              <div class="stat-cards-info">
				                <p class="stat-cards-info__num">조회페이지 사용설명서</p>
				                <p class="stat-cards-info__title">조회페이지를 참고하는데 도움이 되는 설명들입니다.</p>
				                <p class="stat-cards-info__title">추가적인 문의사항은 인사팀에 연락해주세요.</p>
				                <hr>
				                
				                <p class="stat-cards-info__title">* 근무시간은 오전 9시 ~ 오후 6시입니다.</p>
				                <p class="stat-cards-info__title">* 9시 이후 줄근은 무조건 지각처리됩니다.</p>
				                <p class="stat-cards-info__title">* 부득이한 이유로 지각처리되었을 경우 수정요청을 보내주세요</p>		
				                <p class="stat-cards-info__title">* 오후 6시 이후 근무시간은 초과근무로 처리됩니다.</p>				                
				                <p class="stat-cards-info__title">* 휴일에는 모든 근무시간이 초과근무시간으로 처리됩니다.</p>				                
				                
				                <hr>
				                
				                <p class="stat-cards-info__title">* 정상근무여부 종류 설명</p>		
				                		                
				                <table>				               
				               		<thead>
				               			<tr>
					               			<th>출근시간</th>
						                    <th>퇴근시간</th>
						                    <th>일근무시간</th>
						                    <th>통상근무시간</th>
						                    <th>초과근무시간</th>
						                    <th>정상근무여부</th>
					                    </tr>
				               		</thead>
				               		
				               		<tbody>
						               	<tr>
											<td>
												<div class="badge-active" style="color: red">
													휴일근무
												</div>	
											<p class="stat-cards-info__title">* 휴일 근무</p>								
											</td>
					            
											<td>
												<div class="badge-active" style="color: black">
													정상근무퇴근
												</div>									
											</td>
		
											<td>
												<div class="badge-active" style="color: green">
													초과근무퇴근
												</div>									
											</td>
		
											<td>
												<div class="badge-pending" style="color: yellow">
													지각근무퇴근
												</div>
											</td>
		
											<td>
												<div class="badge-pending" style="color: green">
													초과지각근무퇴근
												</div>
											</td>
		
					            			<td>퇴근정보없음</td>
										</tr>
				               		</tbody>
				               		
				               		
				                
				                </table>
				                
				                
				                
				                
				                
				                

				              </div>
				            </article>
				        </div>       
				    </div>
					
	
	            </div>
	    	</div>
	    </div>
	</div>
</main>


<script type="text/javascript">

</script>

<!-- Custom scripts -->
<script src="${root}/resources/js/script.js"></script>

</body>
</html>