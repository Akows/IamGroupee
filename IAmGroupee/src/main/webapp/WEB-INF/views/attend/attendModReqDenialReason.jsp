<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려사유 기재</title>

<!-- Favicon -->
<link rel="shortcut icon" href="../resources/img/svg/looo.png" type="image/x-icon">
<!-- Custom styles -->
<link rel="stylesheet" href="../resources/css/style.min.css">

</head>
<body>
	<br>
	<br>
	
	<h1>반려처리 페이지</h1>
	
	<br>
	<hr>
	<br>
	
	<div class="col-md-12 col-xl-3">
		<article class="stat-cards-item">
			<div class="stat-cards-info">
				<form action="approvemanagenoneprocess" method="post">
					
					<p class="stat-cards-info__num">반려처리</p>
					<p class="stat-cards-info__title">반려사유 기재하여 처리할 것</p>
					
					<hr>
						
					<textarea name="mod_reason" placeholder="내용작성하여 제출" style="width: 400px; height: 200px; resize: none;" required></textarea>
						
					<hr>
						
					<input type="submit" class="form-btn primary-default-btn transparent-btn" style="font-size: larger;" value="반려처리">

				</form>	
			</div>
		</article>
	</div>
	
	<hr>

	
<!-- Custom scripts -->
<script src="${root}/resources/js/script.js"></script>

</body>
</html>