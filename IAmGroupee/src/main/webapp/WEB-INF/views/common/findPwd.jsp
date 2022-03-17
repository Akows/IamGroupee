<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="${root}/resources/css/mypage/findPwd.css">
</head>
<body>
	<section>
			<span>비밀번호 찾기 </span> 
			<br> <br> 
			<form action="${root}/findpwd" method="post">
			<span> 
				<label for="userNo">사번 입력</label> <br>
                <input type="text" placeholder="사번 입력" name="userNo" required>
			</span>
			<br>
			<br><button type="submit">비밀번호 찾기</button>
			</form>
	</section>
</body>
</html>