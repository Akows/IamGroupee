<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IAMGROUPE-임직원 관리</title>
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
       		<div class="col-lg-2 col-5">
       			<button class="btn btn-block btn-outline-primary btn-flat">사용자 추가</button>
       		</div>
       		<div class="col-lg-7 col-1">
       		</div>
       		<div class="col-lg-3 col-6">
       			   <div class="form-group">
                            <div class="input-group input-group-lg">
                                <input type="search" class="form-control form-control-lg" placeholder="사번/이름으로 검색">
                                <div class="input-group-append">
                                    <button type="submit" class="btn btn-lg btn-default bg-primary">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
       		</div>
       </div>
       <div class="row">
       		<table class="table">
       			<thead class="thead-light">
       				<tr>
       					<th>사번</th>
       					<th>이름</th>
       					<th>전화번호</th>
       					<th>조직</th>
       					<th>직위</th>
       					<th>직무</th>
       					<th>상태</th>
       					<th>수정</th>
       				</tr>
       			</thead>
       			
       		</table>
       </div>

      </div>
    </main>

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>

	<!-- Custom scripts -->
</body>
</html>