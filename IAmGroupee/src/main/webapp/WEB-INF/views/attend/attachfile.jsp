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

	<c:forEach items="${file}" var="file">

		<img alt="첨부파일이 없습니다." src="../resources/upload/files/${file.attach_file}">
		
	</c:forEach>

						

</body>
</html>