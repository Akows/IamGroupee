<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IAMGROUPE-인사 관리</title>
</head>
<body>
 	<%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

    <!-- ! Main -->
    <main class="main users chart-page" id="skip-target">
     <div class="container">
     	<br>
       <h1>인사 관리 메인페이지</h1>
       <hr>
       <br>
       <div class="row">
          <div class="col-lg-6 col-6">
            <!-- small card -->
            <div class="small-box bg-info">
              <div class="inner">
                <h3>임직원 관리</h3>

                <p>10명</p>
              </div>
              <div class="icon">
                <i class="fas fa-user-plus"></i>
              </div>
              <a href="${root}/admin/ps/userlist" class="small-box-footer">
                관리 페이지로 이동 <i class="fas fa-arrow-circle-right"></i>
              </a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-6 col-6">
            <!-- small card -->
            <div class="small-box bg-success">
              <div class="inner">
                <h3>부서 관리</h3>

                <p>7개 부서</p>
              </div>
              <div class="icon">
                <i class="fas fa-chart-pie"></i>
              </div>
              <a href="${root}/admin/ps/deptmanage" class="small-box-footer">
                관리 페이지로 이동 <i class="fas fa-arrow-circle-right"></i>
              </a>
            </div>
          </div>
           <!-- ./col -->
          <div class="col-lg-6 col-6">
            <!-- small card -->
            <div class="small-box bg-primary">
              <div class="inner">
                <h3>직무/직위 관리</h3>

                <p>3가지 직위</p>
              </div>
              <div class="icon">
                <i class="far fa-flag"></i>
              </div>
              <a href="${root}/admin/ps/jobposimanage" class="small-box-footer">
                관리 페이지로 이동 <i class="fas fa-arrow-circle-right"></i>
              </a>
            </div>
          </div>
          <!-- ./col -->
        </div>
      </div>
    </main>

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>

	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
</body>
</html>
