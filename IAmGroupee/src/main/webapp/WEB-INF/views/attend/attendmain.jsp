<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<% int a = 1; %>

<main class="main users chart-page" id="skip-target">
	<div class="container">
	       
		<hr> 
		    
		<div style="height: 40px; text-align: left;">
			<h1>근태관리 메인페이지</h1> <br> 오늘 날짜 <h4 style="color: rgb(50, 48, 48); font-weight: 600;" id="currentDate"></h4>
		</div>

		<br>
		<br>
		<hr>
		
		<!-- ===================================================================================================== -->
		<!-- 근태 테이블 임시 칼럼 생성 -->
		<div style="width: 150px; height: 30px;">
			<form action="attendtempdateinsert" method="get" name="tempinsertForm" onsubmit="return insertTempTable()">
				<input type="submit" class="form-btn primary-default-btn transparent-btn" style="font-size: small;" value="근태테이블생성" id="tempinsertBtn"/> <!-- onclick="insertTempTable(); this.onclick=''"; -->
			</form>
		</div>
		
		<br>

		<!-- ===================================================================================================== -->
		<!-- ===================================================================================================== -->
		<!-- ===================================================================================================== -->
		<!-- 사용자 정보 UI -->
		<div class="row stat-cards">
		
		<c:forEach items="${atInfo2}" var="atin" begin="0" end="0">
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
						<button class="form-btn primary-default-btn transparent-btn" type="button" onclick="location.href='${root}/my/modiuser';"> 마이페이지 </button>
					</div>
				</article>
			</div>
		</c:forEach>
		
		<!-- 출퇴근 처리 UI -->
		<c:forEach items="${atWTInfo}" var="wtinfo">
			<c:choose>			 
			 	<c:when test="${wtinfo.workcheck == '근무정보없음'}">
					<div class="col-md-6 col-xl-3">
						<article class="stat-cards-item">
					      <div class="stat-cards-icon primary">
					        <i data-feather="feather" aria-hidden="true"></i>
					      </div>
					      <div class="stat-cards-info">
						  	<p class="stat-cards-info__num">춭퇴근 체크</p>
							<p class="stat-cards-info__title">금일 출퇴근 상황</p>
							<p class="stat-cards-info__title"> 
								출근정보없음
							</p>
							<p class="stat-cards-info__progress">
								<span class="stat-cards-info__profit danger">
									<i data-feather="trending-down" aria-hidden="true"></i>출근하지 않음
								</span>
							</p>
					        <hr>
					        <form action="attendprocessin" method="post">
						  		<input type="submit" class="form-btn primary-default-btn transparent-btn" style="font-size: larger;" value="출근">
						  	</form>
					      </div>					      
					    </article>
					</div>
			 	</c:when>

			    <c:when test="${wtinfo.workcheck == '정상출근처리'}">
			 		<div class="col-md-6 col-xl-3">
						<article class="stat-cards-item">
					      <div class="stat-cards-icon success">
					        <i data-feather="feather" aria-hidden="true"></i>
					      </div>
					      <div class="stat-cards-info">
							  <p class="stat-cards-info__num">춭퇴근 체크</p>
							  <p class="stat-cards-info__title">금일 출퇴근 상황</p>
							  <p class="stat-cards-info__title">
							  	출근시간 : ${wtinfo.in_time}
							  </p>							
							  <p class="stat-cards-info__progress">
								  <span class="stat-cards-info__profit success">
								  	<i data-feather="trending-up" aria-hidden="true"></i>현재 근무중
								  </span>
							  </p>
							  <hr>
							  <form action="attendprocessout" method="post">
							  	<input type="submit" class="form-btn primary-default-btn transparent-btn" style="font-size: larger;" value="퇴근">
						      </form>
					      </div>
					    </article>
					</div>
			 	</c:when>
			 	
			    <c:when test="${wtinfo.workcheck == '지각출근처리'}">
			 		<div class="col-md-6 col-xl-3">
						<article class="stat-cards-item">
					      <div class="stat-cards-icon success">
					        <i data-feather="feather" aria-hidden="true"></i>
					      </div>
					      <div class="stat-cards-info">
							  <p class="stat-cards-info__num">춭퇴근 체크</p>
							  <p class="stat-cards-info__title">금일 출퇴근 상황</p>
							  <p class="stat-cards-info__title">
							  	출근시간 : ${wtinfo.in_time}
							  </p>
							  <p class="stat-cards-info__title"> <a style="color: red;">출근 시간 경과하여 지각 처리되었습니다.</a> </p>
							  <p class="stat-cards-info__progress">
								  <span class="stat-cards-info__profit danger">
								  	<i data-feather="trending-up" aria-hidden="true"></i>현재 근무중
								  </span>								
							  </p>							  						  
							  <hr>
							  <form action="attendprocessout" method="post">
							  	<input type="submit" class="form-btn primary-default-btn transparent-btn" style="font-size: larger;" value="퇴근">
						      </form>
					      </div>
					    </article>
					</div>
			 	</c:when>			 	
			 	
			 	<c:when test="${wtinfo.workcheck == '정상출근(재)'}">
			 		<div class="col-md-6 col-xl-3">
						<article class="stat-cards-item">
					      <div class="stat-cards-icon warning">
					        <i data-feather="feather" aria-hidden="true"></i>
					      </div>
					      <div class="stat-cards-info">
							  <p class="stat-cards-info__num">춭퇴근 체크</p>
							  <p class="stat-cards-info__title">금일 출퇴근 상황</p>
							  <p class="stat-cards-info__title">
							  	출근시간 : ${wtinfo.in_time}
							  </p>
							  <p class="stat-cards-info__progress">
								  <span class="stat-cards-info__profit danger">
								  	<i data-feather="trending-down" aria-hidden="true"></i>재출근 처리됨
								  </span>
							  </p>
							  <hr>
							  <form action="attendprocessreout" method="post">
							  	<input type="submit" class="form-btn primary-default-btn transparent-btn" style="font-size: larger;" value="퇴근">
							  </form>
					      </div>
					    </article>
					</div>
			 	</c:when>
			 	
			 	<c:when test="${wtinfo.workcheck == '정상출근(재)(초과)'}">
			 		<div class="col-md-6 col-xl-3">
						<article class="stat-cards-item">
					      <div class="stat-cards-icon warning">
					        <i data-feather="feather" aria-hidden="true"></i>
					      </div>
					      <div class="stat-cards-info">
							  <p class="stat-cards-info__num">춭퇴근 체크</p>
							  <p class="stat-cards-info__title">금일 출퇴근 상황</p>
							  <p class="stat-cards-info__title">
							  	출근시간 : ${wtinfo.in_time}
							  </p>
							  <p class="stat-cards-info__progress">
								  <span class="stat-cards-info__profit danger">
								  	<i data-feather="trending-down" aria-hidden="true"></i>재출근 처리됨
								  </span>
							  </p>
							  <hr>
							  <form action="attendprocessreout" method="post">
							  	<input type="submit" class="form-btn primary-default-btn transparent-btn" style="font-size: larger;" value="퇴근">
							  </form>
					      </div>
					    </article>
					</div>
			 	</c:when>
			 	
			 	<c:when test="${wtinfo.workcheck == '지각출근(재)'}">
			 		<div class="col-md-6 col-xl-3">
						<article class="stat-cards-item">
					      <div class="stat-cards-icon warning">
					        <i data-feather="feather" aria-hidden="true"></i>
					      </div>
					      <div class="stat-cards-info">
							  <p class="stat-cards-info__num">춭퇴근 체크</p>
							  <p class="stat-cards-info__title">금일 출퇴근 상황</p>
							  <p class="stat-cards-info__title">
							  	출근시간 : ${wtinfo.in_time}
							  </p>
							  <p class="stat-cards-info__title"> <a style="color: red;">지각 처리되었습니다.</a> </p>
							  <p class="stat-cards-info__progress">
								  <span class="stat-cards-info__profit danger">
								  	<i data-feather="trending-down" aria-hidden="true"></i>재출근 처리됨
								  </span>
							  </p>
							  <hr>
							  <form action="attendprocessreout" method="post">
							  	<input type="submit" class="form-btn primary-default-btn transparent-btn" style="font-size: larger;" value="퇴근">
							  </form>
					      </div>
					    </article>
					</div>
			 	</c:when>
			 	
			 	<c:when test="${wtinfo.workcheck == '지각출근(재)(초과)'}">
			 		<div class="col-md-6 col-xl-3">
						<article class="stat-cards-item">
					      <div class="stat-cards-icon warning">
					        <i data-feather="feather" aria-hidden="true"></i>
					      </div>
					      <div class="stat-cards-info">
							  <p class="stat-cards-info__num">춭퇴근 체크</p>
							  <p class="stat-cards-info__title">금일 출퇴근 상황</p>
							  <p class="stat-cards-info__title">
							  	출근시간 : ${wtinfo.in_time}
							  </p>
							  <p class="stat-cards-info__title"> <a style="color: red;">지각 처리되었습니다.</a> </p>
							  <p class="stat-cards-info__progress">
								  <span class="stat-cards-info__profit danger">
								  	<i data-feather="trending-down" aria-hidden="true"></i>재출근 처리됨
								  </span>
							  </p>
							  <hr>
							  <form action="attendprocessreout" method="post">
							  	<input type="submit" class="form-btn primary-default-btn transparent-btn" style="font-size: larger;" value="퇴근">
							  </form>
					      </div>
					    </article>
					</div>
			 	</c:when>				 	
			 	
			 	<c:when test="${wtinfo.workcheck == '정상퇴근'}">
			 		<div class="col-md-6 col-xl-3">
						<article class="stat-cards-item">
					      <div class="stat-cards-icon warning">
					        <i data-feather="feather" aria-hidden="true"></i>
					      </div>
					      <div class="stat-cards-info">
							  <p class="stat-cards-info__num">춭퇴근 체크</p>
							  <p class="stat-cards-info__title">금일 출퇴근 상황</p>
							  <p class="stat-cards-info__title">
							  	근무 종료
							  </p>
							  <p class="stat-cards-info__progress">
								  <span class="stat-cards-info__profit danger">
								  	<i data-feather="trending-down" aria-hidden="true"></i>퇴근 처리됨
								  </span>
							  </p>
							  <hr>
							  <form action="attendprocessrein" method="post">
							  	<input type="submit" class="form-btn primary-default-btn transparent-btn" style="font-size: larger;" value="재출근">
							  </form>
					      </div>
					    </article>
					</div>
			 	</c:when>
			 	
			 	<c:when test="${wtinfo.workcheck == '초과근무퇴근'}">
			 		<div class="col-md-6 col-xl-3">
						<article class="stat-cards-item">
					      <div class="stat-cards-icon warning">
					        <i data-feather="feather" aria-hidden="true"></i>
					      </div>
					      <div class="stat-cards-info">
							  <p class="stat-cards-info__num">춭퇴근 체크</p>
							  <p class="stat-cards-info__title">금일 출퇴근 상황</p>
							  <p class="stat-cards-info__title">
							  	근무 종료
							  </p>
							  <p class="stat-cards-info__progress">
								  <span class="stat-cards-info__profit danger">
								  	<i data-feather="trending-down" aria-hidden="true"></i>퇴근 처리됨
								  </span>
							  </p>
							  <hr>
							  <form action="attendprocessrein" method="post">
							  	<input type="submit" class="form-btn primary-default-btn transparent-btn" style="font-size: larger;" value="재출근">
							  </form>
					      </div>
					    </article>
					</div>
			 	</c:when>
			 	
			 	<c:when test="${wtinfo.workcheck == '지각정상퇴근'}">
			 		<div class="col-md-6 col-xl-3">
						<article class="stat-cards-item">
					      <div class="stat-cards-icon warning">
					        <i data-feather="feather" aria-hidden="true"></i>
					      </div>
					      <div class="stat-cards-info">
							  <p class="stat-cards-info__num">춭퇴근 체크</p>
							  <p class="stat-cards-info__title">금일 출퇴근 상황</p>
							  <p class="stat-cards-info__title">
							  	근무 종료
							  </p>
							  <p class="stat-cards-info__title"> <a style="color: red;">지각 처리되었습니다.</a> </p>
							  <p class="stat-cards-info__progress">
								  <span class="stat-cards-info__profit danger">
								  	<i data-feather="trending-down" aria-hidden="true"></i>퇴근 처리됨
								  </span>
							  </p>
							  <hr>
							  <form action="attendprocessrein" method="post">
							  	<input type="submit" class="form-btn primary-default-btn transparent-btn" style="font-size: larger;" value="재출근">
							  </form>
					      </div>
					    </article>
					</div>
			 	</c:when>	
			 	
			 	<c:when test="${wtinfo.workcheck == '지각초과근무퇴근'}">
			 		<div class="col-md-6 col-xl-3">
						<article class="stat-cards-item">
					      <div class="stat-cards-icon warning">
					        <i data-feather="feather" aria-hidden="true"></i>
					      </div>
					      <div class="stat-cards-info">
							  <p class="stat-cards-info__num">춭퇴근 체크</p>
							  <p class="stat-cards-info__title">금일 출퇴근 상황</p>
							  <p class="stat-cards-info__title">
							  	근무 종료
							  </p>
							  <p class="stat-cards-info__title"> <a style="color: red;">지각 처리되었습니다.</a> </p>
							  <p class="stat-cards-info__progress">
								  <span class="stat-cards-info__profit danger">
								  	<i data-feather="trending-down" aria-hidden="true"></i>퇴근 처리됨
								  </span>
							  </p>
							  <hr>
							  <form action="attendprocessrein" method="post">
							  	<input type="submit" class="form-btn primary-default-btn transparent-btn" style="font-size: larger;" value="재출근">
							  </form>
					      </div>
					    </article>
					</div>
			 	</c:when>		 	
			 				 	
			 	<c:otherwise>
					<div class="col-md-6 col-xl-3">
						<article class="stat-cards-item">
					      <div class="stat-cards-icon purple">
					        <i data-feather="feather" aria-hidden="true"></i>
					      </div>
					      <div class="stat-cards-info">
							  <p class="stat-cards-info__num">UI 출력 오류</p>
							  <p class="stat-cards-info__title">에러 발생</p>
							  <p class="stat-cards-info__title">View 데이터 조회에 이상 발생</p>
							  <p class="stat-cards-info__progress">
								  <span class="stat-cards-info__profit success">
								  	<i data-feather="trending-up" aria-hidden="true"></i>관리자 확인 요망
								  </span>
							  </p>
					      </div>
					    </article>
					</div>
			 	</c:otherwise>			 
			 </c:choose>
		</c:forEach>
		
		<!-- ===================================================================================================== -->
		<!-- ===================================================================================================== -->
		<!-- ===================================================================================================== -->
		
		<!-- 비정상 근무일 조회 UI -->
        <c:forEach items="${atInfo}" var="atInf">
	    	<c:choose>		       
				<c:when test="${atInf.attend_num eq 0}">
					<div class="col-md-6 col-xl-3">
				    	<article class="stat-cards-item">
				        	<div class="stat-cards-icon success">
				            	<i data-feather="bar-chart-2" aria-hidden="true"></i>
				            </div>
				            <div class="stat-cards-info">
				                <p class="stat-cards-info__num">근태현황</p>
				                <p class="stat-cards-info__title">비정상 근무일수</p>    
				                <p class="stat-cards-info__title">0일</p>
				                <p class="stat-cards-info__progress">
				                  <span class="stat-cards-info__profit success">
				                    <i data-feather="trending-up" aria-hidden="true"></i>이상없음
				                  </span>
				                </p>
				                <hr>
				                <form action="attendstate" method="get">
					            	<button type="submit" class="form-btn primary-default-btn transparent-btn" style="font-size: larger;">확인하기</button>
					            </form>
				            </div>
				    	</article>
					</div>	
				</c:when>
			          
				<c:when test="${atInf.attend_num ne 0}">
					<div class="col-md-6 col-xl-3">
				    	<article class="stat-cards-item">
				        	<div class="stat-cards-icon warning">
				            	<i data-feather="bar-chart-2" aria-hidden="true"></i>
				            </div>
				            <div class="stat-cards-info">
				                <p class="stat-cards-info__num">근태현황</p>
				                <p class="stat-cards-info__title">비정상 근무일수</p>     
				                <p class="stat-cards-info__title">${atInf.attend_num}일</p>
				                <p class="stat-cards-info__progress">
				                  <span class="stat-cards-info__profit danger">
				                    <i data-feather="trending-down" aria-hidden="true"></i>이상있음
				                  </span>
				                </p>
				                <hr>
				                <form action="attendstate" method="get">
					            	<button type="submit" class="form-btn primary-default-btn transparent-btn" style="font-size: larger;">확인하기</button>
					            </form>				                
				            </div>
				    	</article>
					</div>
				</c:when>
			</c:choose>
        </c:forEach>
          
        <!-- ===================================================================================================== -->
		<!-- ===================================================================================================== -->
		<!-- ===================================================================================================== -->
		
		<!-- 근태수정요청 조회 UI -->
        <c:forEach items="${atModInfo}" var="modInfo">      
	          <c:choose>
	          
		          <c:when test="${modInfo.attend_mod_num eq 0}">
		          	<div class="col-md-6 col-xl-3">
			            <article class="stat-cards-item">
			              <div class="stat-cards-icon success">
			                <i data-feather="file" aria-hidden="true"></i>
			              </div>
			              <div class="stat-cards-info">
			                <p class="stat-cards-info__num">근태수정요청</p>
			                <p class="stat-cards-info__title">미승인 요청</p>              
			                <p class="stat-cards-info__title">0건</p>
			                <p class="stat-cards-info__progress">
			                  <span class="stat-cards-info__profit success">
			                    <i data-feather="trending-up" aria-hidden="true"></i>요청없음
			                  </span>
			                </p>
			                <hr>
			              	<form action="attendmodview" method="get">
				          		<button type="submit" class="form-btn primary-default-btn transparent-btn" style="font-size: larger;">확인하기</button>
				          	</form>
			              </div>
			            </article>
			          </div>	
		          </c:when>
		          
		          <c:when test="${modInfo.attend_mod_num ne 0}">
		          	<div class="col-md-6 col-xl-3">
			        	<article class="stat-cards-item">
			              <div class="stat-cards-icon warning">
			                <i data-feather="file" aria-hidden="true"></i>
			              </div>
			              <div class="stat-cards-info">
			                <p class="stat-cards-info__num">근태수정요청</p>
			                <p class="stat-cards-info__title">미승인 요청</p>              
			                <p class="stat-cards-info__title">${modInfo.attend_mod_num}건</p>
			                <p class="stat-cards-info__progress">
			                  <span class="stat-cards-info__profit danger">
			                    <i data-feather="trending-down" aria-hidden="true"></i>요청심사중
			                  </span>
			                </p>
			                <hr>
			              	<form action="attendmodview" method="get">
				          		<button type="submit" class="form-btn primary-default-btn transparent-btn" style="font-size: larger;">확인하기</button>
				          	</form>			                
			              </div>
			            </article>
			        </div>
		          </c:when>
	          
	    	</c:choose>      
		</c:forEach>
          
        </div>
        
        <hr>
        <br>
        
        <!-- ===================================================================================================== -->
		<!-- ===================================================================================================== -->
		<!-- ===================================================================================================== -->
		
		<!-- 근로시간 조회 UI -->
        <c:forEach items="${atWTInfo2}" var="wtInfo2" begin="0" end="0">        
        	<c:choose>
       
        		<c:when test="${wtInfo2.total_work_time le 208}">
	        		<div class="row stat-cards">
			        	<div class="col-md-9 col-xl-6">
							<article class="stat-cards-item">
						    	<div class="stat-cards-icon success">
						        	<i data-feather="bar-chart-2" aria-hidden="true"></i>
						        </div>
						        <div class="stat-cards-info">
							    	<p class="stat-cards-info__num">이번달 근무상황</p>
							        <p class="stat-cards-info__title">근무시간 총합산: <b>${wtInfo2.total_work_time}시간</b></p>
							        <p class="stat-cards-info__title">통상근무시간 합산 : <b>${wtInfo2.normal_work_time}시간</b></p>
							        <p class="stat-cards-info__title">초과근무시간 합산 : <b>${wtInfo2.overtime_work_time}시간</b></p>
							        <p class="stat-cards-info__progress">
							        <span class="stat-cards-info__profit success">
							        	<i data-feather="trending-up" aria-hidden="true"></i>잔여근무시간 있음
							        </span>
							        	<fmt:formatNumber value="${208 - wtInfo2.total_work_time}" pattern=".00"/>시간 남음
							        </p>
							        <hr>
							        열심히 근무중입니다.
						    	</div>
							</article>
			        	</div>
					</div> 
        		</c:when>

				<c:otherwise>
	        		<div class="row stat-cards">
			        	<div class="col-md-9 col-xl-6">
							<article class="stat-cards-item">
						    	<div class="stat-cards-icon success">
						        	<i data-feather="bar-chart-2" aria-hidden="true"></i>
						        </div>
						        <div class="stat-cards-info">
							    	<p class="stat-cards-info__num">이번달 근무상황</p>
							        <p class="stat-cards-info__title">총 근무시간 : 데이터 없음</p>
							        <p class="stat-cards-info__progress">
							        <span class="stat-cards-info__profit danger">
							        	<i data-feather="trending-down" aria-hidden="true"></i>잔여근무시간 정보 없음
							        </span>
							             0시간 00분
							        </p>
							        <hr>
							        근무 시간 데이터가 존재하지 않습니다.
						    	</div>
							</article>
			        	</div>
					</div>     				
				</c:otherwise>
        		
        	</c:choose>
		</c:forEach>
		
	</div>
	
	<input type="hidden" value="0" id="cnt">
	
</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script type="text/javascript">


	let today = new Date();
	let year = today.getFullYear(); 
	let month = today.getMonth() + 1
	let day = today.getDate();

	document.getElementById("currentDate").innerHTML = year + '-' + (("00"+month.toString()).slice(-2)) + '-' + (("00"+day.toString()).slice(-2));
	document.getElementById("currentDate2").innerHTML = year + '-' + (("00"+month.toString()).slice(-2)) + '-' + (("00"+day.toString()).slice(-2));
	
	<!-- 근태 테이블 임시 칼럼 생성 기능을 1번만 작동하도록 하는 스크립트 (미사용) -->
	function insertTempTable()
	{		
		let cnt = $("#cnt").val();
				
		if(cnt > 0)
		{
			alert("이미 삽입이 완료되어있습니다.");
			return false;
		}
		else
		{
			alert("데이터 삽입이 완료되었습니다.");
			$("#cnt").val(1);
			return true;
		}
	}
	
<!--	
	
	if(resultValue == 'null')
	{
		insertTempDataform.submit();
		
		resultValue = 'notnull';
		
		$.ajax
		({
	        url : "attendtempdateinsertcheck",
	        type : 'GET',
	        data : {'result' : resultValue},
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
	else
	{
		
	}	
	
	-->

	
	
	
	
	
</script>

	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
</body>

</html>