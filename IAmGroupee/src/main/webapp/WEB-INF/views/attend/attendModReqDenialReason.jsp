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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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
						
					<textarea id="rejectReason" name="reject_reason" placeholder="내용작성하여 제출" style="width: 400px; height: 200px; resize: none;" required></textarea>
						
					<hr>
					
					<button onclick="myFunc();">반려처리</button>
					
				</form>	
				
				
				
			</div>
		</article>
	</div>
	
	<hr>

<script type="text/javascript">

function myFunc(){
	
	const reason = $("#rejectReason").val();
	
	$.ajax({
		url : 'approvemanagenoneprocess',
		type : 'post',
		data : {'reject_reason' : reason} ,
		success : function(data){
			alert("success~~~");
			opener.parent.location="attendmanage";
			window.close();
		},
		error : function(){
			alert("ajax fail...");
		},
	});
}

<!-- onsubmit="return submitcheckclickEventHandler();" -->
	
	function submitcheckclickEventHandler()
	{
		alert('처리가 완료되었습니다');
		window.close();
		
		return true;
	};

</script>
	
<!-- Custom scripts -->
<script src="${root}/resources/js/script.js"></script>

</body>
</html>