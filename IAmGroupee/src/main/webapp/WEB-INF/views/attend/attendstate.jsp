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

		<span style="width: 100px; height: 30px;">
			<input type="hidden" style="font-size: small; width: 150px" value="검색">	
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
		                    <th>수정요청</th>
		            	</tr>
		            </thead>
		       		<tbody>
		       			<c:forEach items="${WTInfo}" var="wtinf">
		       				
			            	<tr>
			            		<td>
				                    <label class="users-table__checkbox">
				                    	<input type="radio" name="modify_req_date" value="${wtinf.attend_date}" id="inputcheck">${wtinf.attend_date}
				                    </label>				                    			            		
			            		</td>
			            		<td>${wtinf.in_time}</td>
			            		<td>${wtinf.out_time}</td>		            		
			            		
			            		<c:choose>
			            			<c:when test="${wtinf.workcheck == '정상퇴근처리'}">
										<td>
											<div class="badge-active">
												${wtinf.workcheck}
											</div>									
										</td>
			            			</c:when>
			            			
			            			<c:when test="${wtinf.workcheck == '지각퇴근처리'}">
										<td>
											<div class="badge-pending">
												${wtinf.workcheck}
											</div>
										</td>
			            			</c:when>
			            			
			            			<c:otherwise>
			            				<td>근무정보없음</td>
			            			</c:otherwise>
			            		</c:choose>
			            		
			            		<td> 
			            			<input type="hidden" name="attend_mod_num" value="${modlist.attend_mod_num}">			         
			            			<button class="modreqBtn">요청</button>
			            		</td>	
			            				            		
			            	</tr>
			            				            	
		            	</c:forEach>
		            </tbody>
	            </table>
	            
				<br>
				
			    <div class="row stat-cards" style="justify-content: center">

			    	<div class="col-md-3 col-xl-3">
			            <article class="stat-cards-item" style="justify-content: center; background-color: white;">
			              <div class="stat-cards-info" style="background-color: #5AE0FF;"> 
						              
						    <c:choose>
						    	<c:when test="${page.startPage != 1}">

						    		<span style="width: 30px; height: 30px; background-color: rgb(14, 104, 225); color: white; ">
										<a class="form-btn primary-default-btn transparent-btn" href="${page.startPage - 1}">이전</a>
									</span>
						    	</c:when>
						    	
								<c:otherwise>
									<span style="width: 40px; height: 30px; background-color: rgb(14, 104, 225); color: rgb(14, 104, 225);">
										&nbsp&nbsp&nbsp&nbsp
									</span>
									<span style="width: 40px; height: 30px; background-color: rgb(14, 104, 225); color: rgb(14, 104, 225);">
										
									</span>
								</c:otherwise>
						    </c:choose>          
						              				                
							<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
								
								<c:if test="${page.currentPage != i and i <= page.lastPage}">
								
									<span style="width: 30px; height: 30px; background-color: rgb(14, 104, 225); color: white;">
										<a href="${i}">${i}</a>
									</span>
									
									<span style="width: 40px; height: 30px; background-color: rgb(14, 104, 225); color: rgb(14, 104, 225);">
										&nbsp&nbsp&nbsp&nbsp
									</span>
								
								</c:if>
								
								<c:if test="${page.currentPage == i and i <= page.lastPage}">
								
									<span style="width: 30px; height: 30px; background-color: rgb(14, 104, 225); color: black;">
										<a>${i}</a>
									</span>
									
									<span style="width: 40px; height: 30px; background-color: rgb(14, 104, 225); color: rgb(14, 104, 225);">
										&nbsp&nbsp&nbsp&nbsp
									</span>
									
								</c:if>
								
							</c:forEach>
							
						    <c:choose>
						    	<c:when test="${page.endPage < page.lastPage}">
						    		<span style="width: 30px; height: 30px; background-color: rgb(14, 104, 225); color: white;">
										<a href="${page.endPage + 1}">다음</a> 
									</span>
						    	</c:when>
						    </c:choose> 							

			              </div>
			            </article>
			    	</div>
			    	      
			    </div>				
							
				<br>

            </div>
          </div>
    </div>
        
    <hr>
    

    
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
	
	<!-- 수정요청 처리하는 스크립트 -->
	let modreqbtn = document.getElementsByClassName("modreqBtn");
	
	$(modreqbtn).each(function(idx, element)
	{
		element.addEventListener('click', modreqbtnclickEventHandler);
	
	});
	
	function modreqbtnclickEventHandler(e) 
	{		
		var url = "http://127.0.0.1:8989/iag/attend/attendModReqForm?attend_mod_num=";
		let no = e.currentTarget.previousSibling.previousSibling.value;
		url += no;
		
		var name = "수정요청페이지";
		var specs = "width=500, height=330, scrollbars=yes, menubar=no";

		window.open(url, name, specs);
    };
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

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
