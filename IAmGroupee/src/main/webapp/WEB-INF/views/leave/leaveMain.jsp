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
          <div class="col-md-6 col-xl-12">
            <article class="stat-cards-item">
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">사원 정보 / 연차 개수</p>
                
                  <pre>


                  </pre>
              </div>
            </article>
          </div>
        </div>
        
        <br>
       
        <div style="height: 40px; width: 100%;">
        	<div style="width: 25%; height: 100%; float: left;">
        		<h3 style="margin-left: 0; color: rgb(94, 94, 94); font-weight: 600; font-size: large; margin-top: 10px"> 0000-00-00 ~ 0000-00-00</h3>
			</div>
        	<div style="width: 45%; height: 100%; float: left;"></div>
        	<div style="width: 30%; height: 100%; float: left; text-align: right;">
        		<input type="button" value="연차 신청" style="background-color: rgb(0, 88, 232); margin-right: 6px; font-weight: bold; color: white;">
        		<input type="button" value="휴가 신청" style="background-color: rgb(0, 88, 232); font-weight: bold; color: white;">
        	</div>
        </div>
       
        <div style="height: 30px; width: 100%;">
        	<div style="width: 25%; height: 100%; float: left;">
        		<h3 style="color: rgb(94, 94, 94); font-weight: 600; font-size: larger; margin-top: 4px; margin-left: 3px">사용 내역</h3>
			</div>
        </div>
        
        <div class="row stat-cards">
          <div class="col-md-6 col-xl-12">
            <article class="stat-cards-item">
              <div class="stat-cards-info">
                <table class="table">
				  <thead>
				    <tr>
				      <th scope="col">#</th>
				      <th scope="col">First</th>
				      <th scope="col">Last</th>
				      <th scope="col">Handle</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row">1</th>
				      <td>Mark</td>
				      <td>Otto</td>
				      <td>@mdo</td>
				    </tr>
				    <tr>
				      <th scope="row">2</th>
				      <td>Jacob</td>
				      <td>Thornton</td>
				      <td>@fat</td>
				    </tr>
				    <tr>
				      <th scope="row">3</th>
				      <td colspan="2">Larry the Bird</td>
				      <td>@twitter</td>
				    </tr>
				  </tbody>
				</table>
              </div>
            </article>
          </div>
        </div>
        
        <br>
       
        <div style="height: 30px; width: 100%;">
        	<div style="width: 25%; height: 100%; float: left;">
        		<h3 style="color: rgb(94, 94, 94); font-weight: 600; font-size: larger; margin-top: 4px; margin-left: 3px">생성 내역</h3>
			</div>
        </div>
        
        <div class="row stat-cards">
          <div class="col-md-6 col-xl-12">
            <article class="stat-cards-item">
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">생성내역목록</p>
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