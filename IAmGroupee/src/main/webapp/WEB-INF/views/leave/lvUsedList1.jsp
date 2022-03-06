<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.iag.leave.entity.LvUsedListDto"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Custom styles -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
  integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  
  <!-- Favicon -->
  <link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">
  <!-- Theme style -->
  <link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
</head>

<body>

	<div class="card card-primary card-outline card-tabs">
		<div class="card-body" style="height: 100%;">
			<div class="tab-content" id="custom-tabs-three-tabContent"
				style="height: 100%;">
				<div id="letter"
					style="margin-bottom: 15px; height: 10%; margin-top: -5px;">
					<h4 style="color: rgb(94, 94, 94); font-weight: 600;">연차 사용 대장</h4>
				</div>
				<div class="card" style="height: 90%;">
					<div class="card-body p-0" style="height: 85%;">
						<table class="table" style="text-align: center;">
							<thead>
								<tr>
									<th style="width: 20%">연차 종류</th>
									<th style="width: 35%">사용 날짜</th>
									<th style="width: 20%">사용 연차</th>
									<th style="width: 25%">세부 내용</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${alvUsedListIf}" var="alv">
									<tr>
										<td>${alv.lvName}</td>
										<td>${alv.during}</td>
										<td>${alv.reduceAlv}</td>
										<td>${alv.lvReason}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- 페이징 -->
					<div class="card-footer clearfix"
						style="width: 100%; margin: 0; text-align: center; height: 45px; padding: 0px;">
						<nav aria-label="Page navigation example"
							style="width: 100%; text-align: center; height: 100%;">
							<ul class="pagination pagination-m"
								style="margin-top: 3px; padding: 0px; color: black; padding-left: 30%; padding-right: 30%; height: 40px;">
								<c:if test="${page.currentPage == 1}">
									<li class="page-item disabled"><a class="page-link">Previous</a>
									</li>
								</c:if>
								<c:if test="${page.currentPage != 1}">
									<li class="page-item"><a class="page-link"
										href="${root}/leave/alvUsedListIf/${page.currentPage - 1}">Previous</a>
									</li>&nbsp;
							    </c:if>

								<c:forEach var="i" begin="${page.startPage}"
									end="${page.endPage}">
									<c:if test="${page.currentPage != i and i <= page.lastPage}">
										<li class="page-item"><a class="page-link"
											href="${root}/leave/alvUsedListIf/${i}"
											style="color: rgb(14, 104, 225);">${i}</a>&nbsp</li>
									</c:if>

									<c:if test="${page.currentPage == i and i <= page.lastPage}">
										<li class="page-item"><a class="page-link"
											href="${root}/leave/alvUsedListIf/${i}"
											style="color: rgb(14, 104, 225);"> ${i}</a>&nbsp</li>
									</c:if>
								</c:forEach>

								<c:if test="${page.currentPage < page.lastPage}">
									<li class="page-item ">
										<a class="page-link" href="${root}/leave/alvUsedListIf/${page.currentPage + 1}">Next</a>
									</li>
								</c:if>

								<c:if test="${page.currentPage > page.lastPage || page.currentPage == page.lastPage}">
									<li class="page-item disabled">
										<a class="page-link"">Next</a>
									</li>
								</c:if>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>	      
	 