<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>첨부파일 상세보기</title>

  <!-- Favicon -->
  <link rel="shortcut icon" href="../resources/img/svg/looo.png" type="image/x-icon">
  <!-- Custom styles -->
  <link rel="stylesheet" href="../resources/css/style.min.css">

</head>
<body>

	<br>
	
	<h1>첨부파일 상세보기</h1>
	
	<hr>
	
	<br>
	
	<h3>사용자가 첨부한 파일 :</h3>
	
	<br>

	<div class="container">	
		<div class="row stat-cards">
			<div>
				<c:forEach items="${file}" var="f">
	
					<img alt="첨부파일이 없습니다." src="../resources/upload/files/${f.attach_file}">
					
				</c:forEach>
			</div>
		</div> 
	</div>
	
	<br>	
	<hr>
	<br>
	
	<div class="row stat-cards">		
		
	<c:forEach items="${file}" var="f">
	
		<form action="attachfiledownload/${f.attach_file}" method="get"> 
			<button class="dropdown-btn transparent-btn" type="submit">첨부파일 다운로드</button>
		</form>

	</c:forEach>

	</div>
	
		



</body>
</html>