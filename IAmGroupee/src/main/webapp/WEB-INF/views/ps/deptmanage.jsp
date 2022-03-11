<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IAMGROUPE-부서 관리</title>
<link rel="stylesheet" href="${root}/resources/css/ps/deptmanage.css">
</head>
<body>
<%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

    <div class="container">
    	<br>
    	<h1>부서 관리 페이지</h1>
    	<hr>
    	<br>
    	<div class="row">
    		<c:forEach items="${deptList}" var="dept">
    			${dept.departmentNo } ${dept.departmentName } ${dept.departmentLevel } ${dept.topDepartmentNo } <br>
    		</c:forEach>
    	</div>
    </div>

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>

	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
</body>
</html>