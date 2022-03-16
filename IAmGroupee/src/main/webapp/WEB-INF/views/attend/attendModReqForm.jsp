<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>근태상황 수정요청 양식</title>
  
  <c:set var="root" value="${pageContext.request.contextPath}"/>
  
  <!-- Favicon -->
  <link rel="shortcut icon" href="../resources/img/svg/looo.png" type="image/x-icon">
  <!-- Custom styles -->
  <link rel="stylesheet" href="../resources/css/style.min.css">

<script>

</script>
<style>

</style>

</head>
<body>

	<form action="attendmodify" method="post" enctype="multipart/form-data" onsubmit="return check()" name="modform">	
	
	    <div class="row stat-cards">
	    	<div class="col-md-12 col-xl-6">
	            <article class="stat-cards-item">
	              <div class="stat-cards-info">
	                <p class="stat-cards-info__num">근무상황 수정요청</p>
	                <p class="stat-cards-info__title">천재지변/전산미숙/긴급업무처리 등의 이유로 정상출근 처리를 요청할 경우 사용</p>
	                <p class="stat-cards-info__title">사유서 혹은 진단서 등의 추가 자료가 있으면 반드시 첨부해주세요</p>
	                <p class="stat-cards-info__title">수정요청 시 상단 일일 근태조회 목록에서 수정을 요청할 대상을 체크한 뒤 내용작성하여 요청 바람</p>
	                <p class="stat-cards-info__title">현재 JPG 형식의 파일만을 지원하고 있습니다.</p>
	                <hr>
	                
	                	<c:forEach items="${keyvalue}" var="key">
	                		 <input type="hidden" value="${key.attend_date}" name="modify_req_date">
	                	</c:forEach>
	                
	                	<textarea id="mod_reason" name="mod_reason" placeholder="내용작성하여 제출" style="width: 400px; height: 200px; resize: none;" required></textarea>
	                
		                <br>
		                
		                <input type="file" name="file" multiple="multiple" accept=".jpg">
		                
		                <hr>
		                
		                <input type="submit" class="form-btn primary-default-btn transparent-btn" style="font-size: larger;" value="수정요청">
	                
	              </div>
	            </article>
	    	</div>       
	    </div>
	
	</form> 
	
	
<script type="text/javascript">

	function submitForm(){
		
		const reason = $("#mod_reason").val();
		
		$.ajax
		({
			url : 'attendmodify',
			type : 'post',
			data : 
			{'mod_reason' : reason},
			{'file' : file}
			success : function(data)
			{
				alert("요청이 완료되었습니다.");
				opener.parent.location="attendstate";
				window.close();
			},
			error : function()
			{
				alert("ajax fail...");
			},
		});
	}

</script>
	
	
	
	
	
	
	

</body>
</html>