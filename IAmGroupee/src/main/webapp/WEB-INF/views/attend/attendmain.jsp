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
		
		<form action="attendtempdateinsert" method="get">
			<button type="submit" value="임시데이터삽입">근태테이블생성</button>
		</form>

		<div class="row stat-cards">
		
		 <c:forEach items="${atWTInfo}" var="wtinfo">

			 <c:choose>
			 
			 	<c:when test="${empty wtinfo}">
			 	
			 		<div class="col-md-6 col-xl-3">
						<article class="stat-cards-item">
					    	<div class="stat-cards-icon primary">
					        	<i data-feather="bar-chart-2" aria-hidden="true"></i>
					        </div>
					        <div class="stat-cards-info">
						    	<table>
									<tr>
							        	<td>
								            <p class="stat-cards-info__num">춭퇴근 체크</p>
										    <p class="stat-cards-info__title">금일 출퇴근 상황</p>

													<p class="stat-cards-info__title"> 
														근태정보존재하지않음
													</p>

	
										    <p class="stat-cards-info__progress">
										    <span class="stat-cards-info__profit danger">
										    	<i data-feather="trending-down" aria-hidden="true"></i>근태정보없음
										    </span>
										    </p>
							            </td>
							            <td>
							            	<hr>
							            </td>
							            <td>
										    <form action="attendprocessin" method="post">
												<input type="submit" class="form-btn primary-default-btn transparent-btn" style="font-size: larger;" value="출근">
										    </form>
							            </td>
							        </tr>
								</table>
								
					            <hr>
					                
					        </div>
					    </article>
					</div>
					
			 	</c:when>
			 
			 	<c:when test="${wtinfo.workcheck == '퇴근'}">
			 	
			 		<div class="col-md-6 col-xl-3">
						<article class="stat-cards-item">
					    	<div class="stat-cards-icon primary">
					        	<i data-feather="bar-chart-2" aria-hidden="true"></i>
					        </div>
					        <div class="stat-cards-info">
						    	<table>
									<tr>
							        	<td>
								            <p class="stat-cards-info__num">춭퇴근 체크</p>
										    <p class="stat-cards-info__title">금일 출퇴근 상황</p>

													<p class="stat-cards-info__title"> 
														전일 퇴근시각 : ${wtinfo.attend_date}
													</p>

	
										    <p class="stat-cards-info__progress">
										    <span class="stat-cards-info__profit danger">
										    	<i data-feather="trending-down" aria-hidden="true"></i>출근하지 않음
										    </span>
										    </p>
							            </td>
							            <td>
							            	<hr>
							            </td>
							            <td>
										    <form action="attendprocessin" method="post">
												<input type="submit" class="form-btn primary-default-btn transparent-btn" style="font-size: larger;" value="출근">
										    </form>
							            </td>
							        </tr>
								</table>
								
					            <hr>
					                
					        </div>
					    </article>
					</div>
					
			 	</c:when>
			 	
			    <c:when test="${wtinfo.workcheck == '출근'}">
			 	
					<div class="col-md-6 col-xl-3">
						<article class="stat-cards-item">
					    	<div class="stat-cards-icon primary">
					        	<i data-feather="bar-chart-2" aria-hidden="true"></i>
					        </div>
					        <div class="stat-cards-info">
						    	<table>
									<tr>
							        	<td>
								            <p class="stat-cards-info__num">춭퇴근 체크</p>
										    <p class="stat-cards-info__title">금일 출퇴근 상황</p>
										    <p class="stat-cards-info__title">출근시간 : ${wtinfo.in_time}</p>
										    <p class="stat-cards-info__progress">
										    <span class="stat-cards-info__profit success">
										    <i data-feather="trending-up" aria-hidden="true"></i>현재 근무중
										    </span>
										    </p>
							            </td>
							            <td>
							            	<hr>
							            </td>
							            <td>
										    <form action="attendprocessout" method="post">
												<input type="submit" class="form-btn primary-default-btn transparent-btn" style="font-size: larger;" value="퇴근">
										    </form>
							            </td>
							        </tr>
								</table>
								
					            <hr>
					                
					        </div>
					    </article>
					</div>
					
			 	</c:when>
			 	
			 	<c:otherwise>
			 	
			 		<div class="col-md-6 col-xl-3">
						<article class="stat-cards-item">
					    	<div class="stat-cards-icon primary">
					        	<i data-feather="bar-chart-2" aria-hidden="true"></i>
					        </div>
					        <div class="stat-cards-info">
						    	<table>
									<tr>
							        	<td>
								            <p class="stat-cards-info__num">UI 출력 이상 발생</p>
										    <p class="stat-cards-info__title">View 출력에 이상이 발생함</p>
										    <p class="stat-cards-info__title">코드 확인바람</p>
										    <p class="stat-cards-info__progress">
										    <span class="stat-cards-info__profit success">
										    <i data-feather="trending-up" aria-hidden="true"></i>이상발생
										    </span>
										    </p>
							            </td>
							            <td>
							            	<hr>
							            </td>
							            <td>
											
							            </td>
							        </tr>
								</table>
								
					            <hr>
					                
					        </div>
					    </article>
					</div>
					
			 	</c:otherwise>
			 	
			 </c:choose>
		 
		</c:forEach>
		
		
		
		
		

          <c:forEach items="${atInfo}" var="atInf">
	          <c:choose>
		          
			          <c:when test="${atInf.attend_num eq 0}">
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
							  <input type="button" class="form-btn primary-default-btn transparent-btn" style="font-size: larger;" value="근태현황조회" onclick="location.href='#toattendstate'">
				              <a id="toattendstate" href="attend/attendstate"></a>
				            </article>
				          </div>	
			          </c:when>
			          
			          <c:when test="${atInf.attend_num ne 0}">
				          <div class="col-md-6 col-xl-3">
				            <article class="stat-cards-item">
				              <div class="stat-cards-icon warning">
				                <i data-feather="file" aria-hidden="true"></i>
				              </div>
				              <div class="stat-cards-info">
				                <p class="stat-cards-info__num">비정상 근무일수</p>
				                <p class="stat-cards-info__title">${atInf.attend_num}일</p>
				                <p class="stat-cards-info__progress">
				                  <span class="stat-cards-info__profit danger">
				                    <i data-feather="trending-down" aria-hidden="true"></i>이상있음
				                  </span>
				                </p>
				                <hr>
				              </div>
				              <input type="button" class="form-btn primary-default-btn transparent-btn" style="font-size: larger;" value="근태현황조회" onclick="location.href='#toattendstate'">
				              <a id="toattendstate" href="attend/attendstate"></a>
				            </article>
				          </div>
			          </c:when>
		          
		          </c:choose>
          </c:forEach>
          
          
          
          
          
          <c:forEach items="${atModInfo}" var="modInfo">
          
	          <c:choose>
	          
		          <c:when test="${modInfo.attend_mod_num eq 0}">
		          	<div class="col-md-6 col-xl-3">
			            <article class="stat-cards-item">
			              <div class="stat-cards-icon purple">
			                <i data-feather="file" aria-hidden="true"></i>
			              </div>
			              <div class="stat-cards-info">
			                <p class="stat-cards-info__num">근태수정요청</p>
			                <p class="stat-cards-info__title">승인되지 않은 수정요청</p>              
			                <p class="stat-cards-info__title">0건</p>
			                <p class="stat-cards-info__progress">
			                  <span class="stat-cards-info__profit success">
			                    <i data-feather="trending-up" aria-hidden="true"></i>이상없음
			                  </span>
			                </p>
			                <hr>
			              </div>
			            </article>
			          </div>	
		          </c:when>
		          
		          <c:when test="${modInfo.attend_mod_num ne 0}">
		          	<div class="col-md-6 col-xl-3">
			            <article class="stat-cards-item">
			              <div class="stat-cards-icon purple">
			                <i data-feather="file" aria-hidden="true"></i>
			              </div>
			              <div class="stat-cards-info">
			                <p class="stat-cards-info__num">근태수정요청</p>
			                <p class="stat-cards-info__title">승인되지 않은 수정요청</p>              
			                <p class="stat-cards-info__title">${modInfo.attend_mod_num}건</p>
			                <p class="stat-cards-info__progress">
			                  <span class="stat-cards-info__profit danger">
			                    <i data-feather="trending-down" aria-hidden="true"></i>요청심사중
			                  </span>
			                </p>
			                <hr>
			              </div>
			            </article>
			          </div>
		          </c:when>
	          
	          </c:choose>
          
		  </c:forEach>
          





        </div>
        
        <hr>
        <br>

        <c:forEach items="${atWTInfo}" var="wtInfo">
        
	        <div class="row stat-cards">
	        	<div class="col-md-9 col-xl-6">
					<article class="stat-cards-item">
				    	<div class="stat-cards-icon warning">
				        	<i data-feather="file" aria-hidden="true"></i>
				            </div>
				            	<div class="stat-cards-info">
					                <p class="stat-cards-info__num">이번달 근무상황</p>
					                <p class="stat-cards-info__title">총 근무시간 : ${wtInfo.total_work_time}</p>
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
			
		</c:forEach>
		
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