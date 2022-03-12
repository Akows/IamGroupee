<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>❤︎ iamgroupe messenger ❤︎</title>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chat/chat.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/77be500183.js" crossorigin="anonymous"></script>
</head>
<body>

    <div id="chatList">
        <div>
            <a href="/iag/chat/users" style="border-right: 1px solid rgb(9, 137, 241);"><i class="fas fa-user-friends"></i></a>
            <a href="/iag/chat/list" style="border-left: 1px solid rgb(9, 137, 241);"><i class="fab fa-rocketchat"></i></a>
        </div>
    </div>
</body>
</html>