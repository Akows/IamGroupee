<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IAMGROUPE-임직원 관리</title>
<link rel="stylesheet" href="${root}/resources/css/ps/userlist.css">
</head>
<body>
<%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

    <!-- ! Main -->
    <main class="main users chart-page" id="skip-target">
     <div class="container">
     	<br>
       <h1>임직원 관리</h1>
       <hr>
       <br>
       <br>
       <div class="row">
        <div class="col-12">
            <div class="card">
            <form action="${root}/admin/ps/userlist" method = "get">
              <div class="card-header">
                <a href="${root}/admin/ps/userenroll" class="userAddLink">사용자 추가 +</a>
 				
                <div class="card-tools">
                  <div class="input-group" style="width: 250px;">
                 
                    <input type="text" name="search" class="form-control float-right" placeholder="사번/이름/전화번호">

                    <div class="input-group-append">
                      <button type="submit" class="btn btn-default">
                        <i class="fas fa-search"></i>
                      </button>
                    </div>
                   
                  </div>
                </div>
                 
              </div>
              </form>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap">
                  <thead>
                    <tr>
                      	<th>사번</th>
       					<th>이름</th>
       					<th>전화번호</th>
       					<th>조직</th>
       					<th>직위</th>
       					<th>직무</th>
       					<th>입사일</th>
       					<th>상태</th>
                    </tr>
                  </thead>
                  <tbody>
                  	<c:forEach items="${userList}" var="user">
                  		<tr>
                      		<td>${user.userNo}</td>
                      		<td>${user.name}</td>
                      		<td>${user.phone}</td>
                      		<c:if test="${empty user.departmentName}">
                      			<td></td>
                      		</c:if>
                      		<c:if test="${not empty user.departmentName}">
                      			<td>${user.departmentName}</td>
                      		</c:if>
                      		<c:if test="${empty user.positionName}">
                      			<td></td>
                      		</c:if>
                      		<c:if test="${not empty user.positionName}">
                      			<td>${user.positionName}</td>
                      		</c:if>
                      		<c:if test="${empty user.jobName}">
                      			<td></td>
                      		</c:if>
                      		<c:if test="${not empty user.jobName}">
                      			<td>${user.jobName}</td>
                      		</c:if>
                      		<td>${user.enrollDateToString()}</td>
                      		<c:if test="${user.activityYn eq 'Y'}">
                      			<td>활성화</td>
                      		</c:if>
                      		<c:if test="${user.activityYn eq 'N'}">
                      			<td>비활성화</td>
                      		</c:if>
                    	</tr>
                  	</c:forEach>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
             <div class="card-footer clearfix">
                <ul class="pagination pagination-sm m-0 center">
                	<c:if test="${empty pv.search}">
                		<c:if test="${pv.startPage != 1}">
							<li class="page-item"><a class="page-link" href="${root}/admin/ps/userlist/${page.startPage-1}">&laquo;</a></li>
						</c:if>
						<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
							<c:if test="${pv.currentPage != i and i <= pv.lastPage}"><li class="page-item"><a class="page-link" href="${root}/admin/ps/userlist/${i}">${i}</a></li></c:if>
							<c:if test="${pv.currentPage == i and i <= pv.lastPage}"><li class="page-item"><a class="page-link">${i}</a></li></c:if>
						</c:forEach>
						<c:if test="${pv.endPage < pv.lastPage}">
							<li class="page-item"><a class="page-link" href="${root}/admin/ps/userlist/${pv.endPage+1}">&raquo;</a></li>
						</c:if>
                	</c:if>
                	<c:if test="${not empty pv.search}">
                		<c:if test="${pv.startPage != 1}">
							<li class="page-item"><a class="page-link" href="${root}/admin/ps/userlist/${page.startPage-1}?search=${pv.search}">&laquo;</a></li>
						</c:if>
						<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
							<c:if test="${pv.currentPage != i and i <= pv.lastPage}"><li class="page-item"><a class="page-link" href="${root}/admin/ps/userlist/${i}?search=${pv.search}">${i}</a></li></c:if>
							<c:if test="${pv.currentPage == i and i <= pv.lastPage}"><li class="page-item"><a class="page-link">${i}</a></li></c:if>
						</c:forEach>
						<c:if test="${pv.endPage < pv.lastPage}">
							<li class="page-item"><a class="page-link" href="${root}/admin/ps/userlist/${pv.endPage+1}?search=${pv.search}">&raquo;</a></li>
						</c:if>
                	</c:if>
                </ul>
              </div>
            <!-- /.card -->
          </div>
       </div>
      </div>
    </main>

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>

	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
</body>
</html>