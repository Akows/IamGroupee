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
	<div class="lockscreen-wrapper">
		<div class="lockscreen-logo" style="font-size: 50px">
			<a href="${root}/main"><b>I am groupe</b></a> <br> <p style="text-align: center; font-size: 28px; margin-top: 24px;">해당 관리자만</p><p style="text-align: center; font-size: 28px; margin-top: 10px;">볼 수 있는 페이지입니다.</p>
		</div>
		<div class="help-block text-center" style="margin-top: 40px;">Enter your password to
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