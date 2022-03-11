<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>근태현황 조회페이지 - 일일출퇴근현황</title>
  
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
	       
		<hr>     
		<div style="height: 40px; text-align: left;">
			<h1>근태현황 조회페이지 (일일출퇴근현황)</h1> <br> 오늘 날짜 <h4 style="color: rgb(50, 48, 48); font-weight: 600;" id="currentDate"></h4>
		</div>
		<br>
		<br>
		<hr>
		
		<form action="attendstatesearch" method="post">
			<span>
				<input type="date" name="date"> 		  
				<input type="submit" class="form-btn primary-default-btn transparent-btn" style="font-size: larger; width: 150px" value="검색">	     					
			</span>                		       							       				
		</form>		
		

	<div class="row stat-cards">
		<div class="col-lg-12">
            <div class="users-table table-wrapper">

				<table class="posts-table">
		            <thead>
		            	<tr class="users-table-info">
		                	<th>날짜</th>
		                    <th>출근시간</th>
		                    <th>퇴근시간</th>
		                    <th>정상근무여부</th>
		            	</tr>
		            </thead>
		       		<tbody>
		       			<c:forEach items="${WTInfo}" var="wtin">
		       				
			            	<tr>
			            		<td>${wtin.attend_date}</td>
			            		<td>${wtin.in_time}</td>
			            		<td>${wtin.out_time}</td>		            		
			            		
			            		<c:choose>
			            			<c:when test="${wtin.workcheck == '정상퇴근처리'}">
										<td>
											<div class="badge-active">
												${wtin.workcheck}
											</div>									
										</td>
			            			</c:when>
			            			
			            			<c:when test="${wtin.workcheck == '지각퇴근처리'}">
										<td>
											<div class="badge-pending">
												${wtin.workcheck}
											</div>
										</td>
			            			</c:when>
			            			
			            			<c:otherwise>
			            				<td>근무정보없음</td>
			            			</c:otherwise>
			            		</c:choose>	
			            				            		
			            	</tr>
			            				            	
		            	</c:forEach>
		            </tbody>
	            </table>
			
            
            </div>
          </div>
    </div>
        
    <hr>
    
    <div class="row stat-cards">
    	<div class="col-md-12 col-xl-6">
            <article class="stat-cards-item">
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">근무상황 수정요청</p>
                <p class="stat-cards-info__title">천재지변/긴급한 용무 등으로 정상출근 처리가 필요한 경우 요청</p>
                <p class="stat-cards-info__title">사유서 혹은 진단서 등 관련 서류 양식에 맞추어 반드시 자료 첨부할 것!</p>
                <hr>
                
                <form action="attendmodify" method="post" enctype="multipart/form-data">
                	
                	<textarea name="mod_reason" placeholder="내용작성하여 제출" style="width: 400px; height: 200px; resize: none;" required></textarea>
                
	                <br>
	                
	                <input type="file" name="file" multiple="multiple" accept=".jpg,.png">
	                
	                <hr>
	                
	                <input type="submit" class="form-btn primary-default-btn transparent-btn" style="font-size: larger;" value="수정요청">
                
                </form>
                
              </div>
            </article>
    	</div>       
    </div>    

        
        
        
        
        
        
        
        
        
        
        
        
        
        
		
	</div>
</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script type="text/javascript">

	<!-- 오늘 날짜 계산하는 스크립트 -->
	let today = new Date();
	let year = today.getFullYear(); 
	let month = today.getMonth() + 1
	let day = today.getDate();
	
	document.getElementById("currentDate").innerHTML = year + '-' + (("00"+month.toString()).slice(-2)) + '-' + (("00"+day.toString()).slice(-2));

</script>

<!-- Custom scripts -->
<script src="${root}/resources/js/script.js"></script>

</body>
</html>
