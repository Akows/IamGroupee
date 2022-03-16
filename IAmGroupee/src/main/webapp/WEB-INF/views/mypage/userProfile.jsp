<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>IAMGROUPE-사용자 등록</title>
<link rel="stylesheet" href="${root}/resources/css/mypage/userProfile.css">

</head>
<body>
<%@ include file="/WEB-INF/views/common/headerSide.jsp" %>
    <!-- ! Main -->
     <div class="container">
     	<br>
       <h1>Profile</h1>
       <hr>
       <br>
		<div class="row">
			<div class="col-lg-3"></div>
			<div class="col-lg-6">
			 <div class="card card-primary">
              <!-- /.card-header -->
              <div class="card-body">
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                        <label for="userNo">사원번호</label> <br>
                        <span class="textspan" id="userNo">${user.userNo}</span>
                      </div>
                      <div class="form-group">
                        <label for="userDeptName">부서</label> <br>
                        <span class="textspan" id="userDeptName">${user.departmentName}</span>
                      </div>
                      <div class="form-group">
                        <label for="posiName">직위</label> <br>
                        <span class="textspan" id="posiName">${user.positionName}</span>
                      </div>
                      <div class="form-group">
                        <label for="jobName">직무</label> <br>
                        <span class="textspan" id="jobName">${user.jobName}</span>
                      </div>
                    </div>
                    <div class="col-sm-6">
                  		<div class="box" style="background: #BDBDBD;">
    						<img class="profile" id="userImg" src="${root}/resources/img/ps/profile/${user.profile}">
						</div>
					</div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                        <label for="name">이름</label> <br>
                        <span class="textspan" id="name">${user.name}</span>
                      </div>          
                    </div>
                   	<div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                        <label for="phone">전화 번호</label> <br>
                        <span class="textspan" id="phone">${user.phone}</span>
                      </div>       
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                  		<div class="form-group">
                        <label for="email">이메일</label> <br>
                        <span class="textspan" id="email">${user.email}</span>
                      </div>
					</div>
					<div class="col-sm-6">
                  		<div class="form-group">
                        <label for="address">주소</label> <br>
                        <span class="textspan" id="address">${user.address}</span>
                      </div>
					</div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                      	<label for="enrollDate">입사일</label> <br>
                    	<span class="textspan" id="enrollDate">${user.enrollDateToString()}</span>
                    	</div>
                	</div>
                   </div>
                    
                  </div>
            </div>
              
            </div>
            <!-- /.card -->
			</div>
			<div class="col-lg-3"></div>
		</div>
    
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>

	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
</body>
</html>