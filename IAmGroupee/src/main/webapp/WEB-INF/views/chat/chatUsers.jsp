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
    <div id="chatUsers">
        <div>
            <a href="/iag/chat/users" style="border-right: 1px solid rgb(9, 137, 241);"><i class="fas fa-user-friends"></i></a>
            <a href="/iag/chat/list" style="border-left: 1px solid rgb(9, 137, 241);"><i class="fab fa-rocketchat"></i>&nbsp;<span id="unread" style="font-size: 12px; color: navy; font-weight: 900;"></span></a>
        </div>
        <div>
        <c:forEach items="${deptValues}" var="dv">
            <div class="deptName">
            <pre>${dv.departmentName}</pre>
            </div>
            <c:forEach items="${userValues}" var="uv">
            <c:if test="${dv.departmentNo eq uv.departmentNo}">
                <div class="userName">
                <label>
                    <form action="/iag/chat/room" method="GET">
                        <span>${uv.name} ${uv.positionName}</span>

                        <input type="hidden" name="toId" value="${uv.userNo}">

                        <input type="submit" value="💙">
                    </form>
                </label>
                </div>
            </c:if>
            </c:forEach>      	
        </c:forEach>
        </div>
    </div>

    <script type="text/javascript">

        // 읽지 않은 채팅수 업데이트
        function getUnread() {
            let userNo = '<c:out value="${loginUser.userNo}"/>';

            $.ajax({
                type: "POST",
                url: "/iag/chat/unreadedChat",
                data: {
                    userNo: userNo
                },
                success: function(result) {
                    if(result >= 1) {
                        showUnread(result);
                    } else {
                        showUnread('');
                    }
                }
            });
        }
        function getInfiniteUnread() {
            setInterval(function() {
                getUnread();
            }, 1000);
        }
        function showUnread(result) {
            $('#unread').html(result);
        }

        $(document).ready(function() {
            getUnread();
            getInfiniteUnread();
        });

    </script>
</body>
</html>