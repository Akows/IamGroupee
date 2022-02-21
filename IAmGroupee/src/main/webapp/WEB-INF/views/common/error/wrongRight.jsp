<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet" href="${root}/resources/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
<!-- Favicon -->
<link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">
</head>
<body class="hold-transition lockscreen">

    <%@ include file="/WEB-INF/views/common/headerSide.jsp" %>
	<h1>추후 작업 예정</h1>
	<!-- Automatic element centering -->
	<div class="lockscreen-wrapper">
		<div class="lockscreen-logo" style="font-size: 40px">
			<a href="${root}/main"><b>I am groupe</b></a> <br> <p style="text-align: center; font-size: 18px; margin-top: 14px;"><b>해당 관리자만</b> 볼 수 있는 페이지입니다.</p>
		</div>
		
		<!-- START LOCK SCREEN ITEM -->
		<div class="lockscreen-item" style="margin-top: 50px;">
			<!-- lockscreen image -->
			<div class="lockscreen-image">
				<img src="${root}/resources/img/svg/looo.png" alt="User Image">
			</div>
			<!-- /.lockscreen-image -->

			<!-- lockscreen credentials (contains the form) -->
			<form class="lockscreen-credentials">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="관리자이름 직급" >

					<div class="input-group-append">
						<button type="button" class="btn">
						</button>
					</div>
				</div>
			</form>
			<!-- /.lockscreen credentials -->

		</div>
		<!-- /.lockscreen-item -->
		<div class="help-block text-center" style="margin-top: 50px;">Enter your password to
			retrieve your session</div>
		<div class="text-center"style="margin-top: 10px;">
			<a href="login.html">Or sign in as a different user</a>
		</div>
		<div class="lockscreen-footer text-center"style="margin-top: 10px;">
			Copyright &copy; 2014-2022 <b><a href="https://adminlte.io"
				class="text-black">IAG.gw.io</a></b><br> All rights reserved
		</div>
	</div>
	<!-- /.center -->

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>

	<!-- jQuery -->
	<script src="${root}/resources/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="${root}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
</body>
</html>