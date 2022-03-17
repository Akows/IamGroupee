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
			<br>
			<br>
			<span>${msg}</span> <br>
			<button type="button" onClick="window.close()">확인</button>

	</section>
</body>
</html>