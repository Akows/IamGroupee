<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>첨부파일 상세보기</title>
</head>
<body>
	
	<h1>첨부파일</h1>

	<div class="container">	
		<div class="row stat-cards">
			<div class="users-table table-wrapper">
				<c:forEach items="${file}" var="f">
	
					<img alt="첨부파일이 없습니다." src="../resources/upload/files/${f.attach_file}">
					
				</c:forEach>
			</div>
		</div> 
	</div>
	
	<hr>
	
	<c:forEach items="${file}" var="f">
	
		<form action="attachfiledownload/${f.attach_file}" method="get"> 
			<button class="dropdown-btn transparent-btn" type="submit">첨부파일 다운로드</button>
		</form>

	</c:forEach>


</body>
</html>