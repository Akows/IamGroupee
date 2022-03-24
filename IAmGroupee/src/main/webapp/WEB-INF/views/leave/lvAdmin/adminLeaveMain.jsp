<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.kh.iag.leave.entity.PageVo" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>LeaveMain Page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
<link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">
</head>

<body>

	<%@ include file="/WEB-INF/views/common/headerSide.jsp"%>

	<main class="main users chart-page" id="skip-target">
		<div class="container">

			<div style="height: 40px; text-align: center;">
				<h1 style="color: rgb(50, 48, 48); font-weight: 600;">${todayDate}</h1>
			</div>

			<br>

			<div class="row stat-cards" style="margin-bottom: 15px;">
				<div class="col-md-6 col-xl-4">
					<div class="card card-primary card-outline"
						style="width: 100%; height: 100%;">
						<div
							style="float: left; width: 30%; margin-left: 30px; margin-top: 20px;">
							<ion-icon size="large" name="duplicate-outline"></ion-icon>
						</div>
						<div
							style="float: left; width: 68%; margin-left: 30px; margin-top: 10px; margin-bottom: 13px;">
							<a href="${root}/admin/leave/lvModiAD">
								<p style="color: rgb(94, 94, 94); font-size: x-large; font-weight: bold;">휴가 발생 관리</p>
							</a>
						</div>
					</div>
				</div>

				<div class="col-md-6 col-xl-4">
					<div class="card card-primary card-outline"
						style="width: 100%; height: 100%;">
						<div
							style="float: left; width: 30%; margin-left: 30px; margin-top: 20px;">
							<ion-icon size="large" name="file-tray-full-outline"></ion-icon>
						</div>
						<div
							style="float: left; width: 68%; margin-left: 30px; margin-top: 10px; margin-bottom: 13px;">
							<a href="${root}/leave/lvInfo">
								<p style="color: rgb(94, 94, 94); font-size: x-large; font-weight: bold;">연차 및 휴가 정보 게시판 관리</p>
							</a>
						</div>
					</div>
				</div>

				<div class="col-md-6 col-xl-4">
					<div class="card card-primary card-outline"
						style="width: 100%; height: 100%;">
						<div
							style="float: left; width: 30%; margin-left: 30px; margin-top: 20px;">
							<ion-icon size="large" name="mail-unread-outline"></ion-icon>
						</div>
						<div
							style="float: left; width: 68%; margin-left: 30px; margin-top: 10px; margin-bottom: 13px;">
							<a href="${root}/leave/alvUrge">
								<p style="color: rgb(94, 94, 94); font-size: x-large; font-weight: bold;">
									연차 사용 촉구서 관리
								</p>
							</a>
						</div>
					</div>
				</div>

			</div>

			<div class="row stat-cards" style="margin-top: 30px;">
				<div class="col-md-6 col-xl-12">
					<article class="stat-cards-item">
						<div style="margin-bottom: 20px; width: 100%;">
							<ion-icon size="large" name="accessibility-outline"
								style="width: 5%; float: left;  text-align: right;"></ion-icon>
							<h3
								style="color: rgb(94, 94, 94); font-weight: 600; width: 55%; float: left; line-height: 35px;">사원
								연차 관리</h3>
							<div style="width: 40%; float: left;">
								<div style="width: 100%;">

									<div class="form-group">
										<form action="${root}/admin/leave/main" method="post"
											style="width: 80%; float: left; margin-left: 8px;">
											<select class="form-control" id="dept" name="dept"
												style="width: 23%; float: left; margin-right: 8px;">
												<option value="1">홍보팀</option>
												<option value="2">인사팀</option>
												<option value="3">총무팀</option>
												<option value="4">회계팀</option>
												<option value="5">영업팀</option>
												<option value="6">기획팀</option>
												<option selected>--부서별--</option>
											</select> <input type="text" name="searchByUserNo"
												style="float: left; width: 50%; margin-right: 4px;">
											<input type="submit" value="검색"
												style="float: left; background-color: rgb(14, 104, 225); font-weight: bold; color: white; width: 20%;">
										</form>
										<a href="${root}/admin/leave/main/1"><input type="button"
											value="전체보기"
											style="float: left; background-color: rgb(14, 104, 225); font-weight: bold; color: white; width: 16%; margin-left: -8px;"></a>
									</div>
								</div>
							</div>
						</div>


						<div class="stat-cards-info" style="width: 100%">
							<table class="table abc" style="width: 100%; text-align: center;">
								<thead>
									<tr">
										<th scope="col">이름</th>
										<th scope="col">부서명</th>
										<th scope="col">직급명</th>
										<th scope="col">발생 연차</th>
										<th scope="col">조정 연차</th>
										<th scope="col">총 연차</th>
										<th scope="col">사용 연차</th>
										<th scope="col">남은 연차</th>
										<th scope="col">연차 추가</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${allUserList}" var="allUserList">
										<tr>
											<td style="width: 13%">${allUserList.name}</td>
											<td style="width: 12%">${allUserList.departmentName}</td>
											<td style="width: 12%">${allUserList.positionName}</td>
											<td style="width: 11%">${allUserList.alvCount}</td>
											<td style="width: 11%">${allUserList.alvAddCount}</td>
											<td style="width: 11%">${allUserList.alvTotalCount}</td>
											<td style="width: 11%">${allUserList.alvUsedCount}</td>
											<td style="width: 11%">${allUserList.alvTotalCount - allUserList.alvUsedCount}</td>
											<td style="width: 8%;">
												<button class="btn btn-primary btn-sm"
													onClick="show_pop('${allUserList.userNo}');">추가</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- 모달창 -->
							<div class="modal" tabindex="-1" role="dialog">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">조정할 연차의 개수를 입력하세요</h5>
											<!-- <h2 class="userNo" name="userNo"></h2> -->
											<input type="hidden" class="userNo" name="userNo"></input>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close" onClick="close_pop();">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<input type="number" class="alvOccurCount"
												name="alvOccurCount"><br><br> <input type="text"
												class="alvOccurReason" name="alvOccurReason"
												placeholder="사유를 입력해주세요.">
										</div>
										<div class="modal-footer">
											<button type="submit" class="btn btn-primary addAlvDB">조정
												연차 추가</button>
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal" onClick="close_pop();">취소</button>
										</div>
									</div>
								</div>
							</div>
							<!-- 모달창End -->
						</div>
						
						<%
							PageVo pageVo = (PageVo)request.getAttribute("page");
							PageVo pageVo2 = (PageVo)request.getAttribute("page2");
							if(pageVo != null || pageVo2 != null) {
						%>
						<!-- 페이징 -->
						<div class="card-footer clearfix"
							style="width: 100%; margin: auto; text-align: center;">
							<nav aria-label="Page navigation example">
								<ul class="pagination pagination-m m-2"
									style="margin: auto; color: black; padding-left: 38%; padding-right: 40%;">
									<c:if test="${page.currentPage == 1}">
										<li class="page-item disabled"><a class="page-link">Previous</a>
										</li>&nbsp;
									</c:if>
									<c:if test="${page.currentPage != 1}">
										<li class="page-item"><a class="page-link"
											href="${root}/admin/leave/main/${page.currentPage - 1}">Previous</a>
										</li>&nbsp;
							    </c:if>

									<c:forEach var="i" begin="${page.startPage}"
										end="${page.endPage}">
										<c:if test="${page.currentPage != i and i <= page.lastPage}">
											<li class="page-item"><a class="page-link"
												href="${root}/admin/leave/main/${i}">${i}</a></li>&nbsp;
										</c:if>

										<c:if test="${page.currentPage == i and i <= page.lastPage}">
											<li class="page-item"><a class="page-link"
												href="${root}/admin/leave/main/${i}"> ${i}</a></li>&nbsp;
										</c:if>
									</c:forEach>

									<c:if test="${page.currentPage < page.lastPage}">
										<li class="page-item ">
											<a class="page-link" href="${root}/admin/leave/main/${page.currentPage + 1}" aria-label="Next">Next</a>
										</li>
									</c:if>

									<c:if test="${!(page.currentPage < page.lastPage) || page.currentPage == page.lastPage}">
										<li class="page-item disabled">
											<a class="page-link">Next</a>
										</li>
									</c:if>
								</ul>
							</nav>
						</div>
						
						<%
							}
						%>
					</article>
				</div>
			</div>
		</div>
	</main>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>


	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>

	<script type="text/javascript">
		//팝업 show 기능
		function show_pop(userNo) {
			$(".userNo").html(userNo);
			console.log(userNo);
		     $('.modal').show();
		};
		//팝업 Close 기능
		function close_pop() {
		     $('.modal').hide();
		};

	
	$(function() {
	    $('.addAlvDB').click(function() {
	            
	        var alvAddCount = $('.alvOccurCount').val();
	        var userNo = $('.userNo').text();      
	        var alvOccurReason = $('.alvOccurReason').val();    
	            
	        console.log(alvOccurReason);
	        
	        var request = $.ajax({
	            url: "${root}/admin/leave/alvAddUpdate",
	            method: "POST",
	            data: {alvAddCount, userNo, alvOccurReason},
	            dataType: "text" 
	        });
	             
	        request.done(function( data ) {
	            console.log(data);
  	            alert( "조정연차가 추가되었습니다.");
	            close_pop();
	            window.location.reload();
	        });
	 
	        request.fail(function() {
	            alert( "조정연차가 추가되지않았습니다.");
	        });
	 
	        request.always(function() {
	            console.log('완료');
	        });
	    });
	});

</script>
	<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>

</html>