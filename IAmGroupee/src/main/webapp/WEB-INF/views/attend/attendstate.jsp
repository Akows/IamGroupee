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
	
	<form action="attendmodify" method="post" enctype="multipart/form-data" onsubmit="return check()" name="modform">	

	<div class="row stat-cards">
		<div class="col-lg-12">
            <div class="users-table table-wrapper">

				<table class="posts-table">
		            <thead>
		            	<tr class="users-table-info">
		                	<th>
			                	<label class="users-table__checkbox ms-20">
			                    	<input type="checkbox" disabled="disabled"> 날짜
			                    </label>		                		
		                	</th>
		                    <th>출근시간</th>
		                    <th>퇴근시간</th>
		                    <th>정상근무여부</th>
		            	</tr>
		            </thead>
		       		<tbody>
		       			<c:forEach items="${WTInfo}" var="wtin">
		       				
			            	<tr>
			            		<td>
				                    <label class="users-table__checkbox">
				                    	<input type="checkbox" name="modify_req_date" value="${wtin.attend_date}" id="inputcheck">${wtin.attend_date}
				                    </label>				                    			            		
			            		</td>
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
	            
				<br>

				<c:if test="${page.startPage != 1}"> 
					<a href="${page.startPage - 1}">이전</a> 
				</c:if>
				
				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					
					<c:if test="${page.currentPage != i and i <= page.lastPage}">
						<a href="${i}">${i}</a> &nbsp
					</c:if>
					
					<c:if test="${page.currentPage == i and i <= page.lastPage}">
						${i} &nbsp
					</c:if>
					
				</c:forEach>
				
				<c:if test="${page.endPage < page.lastPage }"> 
					<a href="${page.endPage + 1}">다음</a> 
				</c:if>
           
			
            
            </div>
          </div>
    </div>
        
    <hr>
    
    <div class="row stat-cards">
    	<div class="col-md-12 col-xl-6">
            <article class="stat-cards-item">
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">근무상황 수정요청</p>
                <p class="stat-cards-info__title">천재지변/전산미숙/긴급업무처리 등의 이유로 정상출근 처리를 요청할 경우 사용</p>
                <p class="stat-cards-info__title">사유서 혹은 진단서 등의 추가 자료가 있으면 반드시 첨부해주세요</p>
                <p class="stat-cards-info__title">수정요청 시 상단 일일 근태조회 목록에서 수정을 요청할 대상을 체크한 뒤 내용작성하여 요청 바람</p>
                <hr>
                
                	<textarea name="mod_reason" placeholder="내용작성하여 제출" style="width: 400px; height: 200px; resize: none;" required></textarea>
                
	                <br>
	                
	                <input type="file" name="file" multiple="multiple" accept=".jpg,.png">
	                
	                <hr>
	                
	                <input type="submit" class="form-btn primary-default-btn transparent-btn" style="font-size: larger;" value="수정요청">
                
              </div>
            </article>
    	</div>       
    </div>
    
    </form>    

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

	<!-- 날짜 선택이 되어있지 않으면 경고문 출력과 submit를 막는 스크립트 -->
	function check()
	{
		if(document.modform.inputcheck.checked)
		{
			document.modform.submit();
		}
		else
		{
			alert('날짜를 선택해주세요.');
			
			return false;
		}
		  
	}

	<!-- 체크된 값을 가져와서 ajax로 controller로 넘기는 스크립트 -->
	<!-- 로직 변경으로 미사용 -->
	function getCheckboxValue(event)  
	{
		var value = '';
		
		if(event.target.checked)
		{
			value = event.target.value;
		}
		else
		{
			value = '';
		}
		
		var valueCut1 = value.substr(0, 4);
		var valueCut2 = value.substr(6, 2);
		var valueCut3 = value.substr(10, 2);
		
		var sumValue = valueCut1 + valueCut2 + valueCut3;
		var resultValue = String(sumValue);
		
		if(value = '')
		{
			console.log("값이 없으면 ajax로 가지않아요");
		}
		else
		{
			$.ajax
			({
		        url : "attendmodify",
		        type : 'POST',
		        data : {'zz' : resultValue},
		        dataType:'text',
		        success : function()
		        {
		            console.log("전달완료");
		        },
		        error : function()
		        {
		        	console.log("전달실패");
		        }
		    });			
		}
	}
	
	
	
	
	
	
	
	
	
	
	
</script>

<!-- Custom scripts -->
<script src="${root}/resources/js/script.js"></script>

</body>
</html>
