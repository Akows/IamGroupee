<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>LeaveMain Page</title>
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${root}/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- SweetAlert2 -->
  <link rel="stylesheet" href="${root}/resources/plugins/sweetalert2/sweetalert2.min.css">
  <!-- Toastr -->
  <link rel="stylesheet" href="${root}/resources/plugins/toastr/toastr.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
  <!-- Favicon -->
  <link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">
  <!-- Custom styles -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
  integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <link rel="stylesheet" href="${root}/resources/css/style.min.css">

</head>

<body>

    <%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

    <!-- ! Main -->
    <main class="main users chart-page" id="skip-target">
     <div class="container">
       
        <div style="height: 40px; text-align: center;">
        	<h1 style="color: rgb(50, 48, 48); font-weight: 600;">2022-02-14</h1>
        </div>
        
        <br>
        
        <div class="row stat-cards">
          <div class="col-md-6 col-xl-6">
            <article class="stat-cards-item">
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">사원 연차 관리</p>
                  <pre>






                  </pre>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-xl-6">
            <article class="stat-cards-item">
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">휴가 발생 관리</p>
                  <pre>






                  </pre>
              </div>
            </article>
          </div>
        </div>
        <div>
        	<pre></pre>
        </div>
        <div class="row stat-cards">
          <div class="col-md-6 col-xl-6">
            <article class="stat-cards-item">
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">연차 및 휴가 정보 게시판 관리</p>
                  <pre>






                  </pre>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-xl-6">
            <article class="stat-cards-item">
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">연차 사용 촉구서 관리</p>
                  <pre>






                  </pre>
              </div>
            </article>
          </div>
        </div>
      </div>
    </main>

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
  </div>
</div>

<!-- Icons library -->
<script src="${root}/resources/plugins/feather.min.js"></script>

<!-- Custom scripts -->
<script src="${root}/resources/js/script.js"></script>
	<!-- jQuery -->
	<script src="${root}/resources/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="${root}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${root}/resources/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="${root}/resources/dist/js/demo.js"></script>
</body>

</html>