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
            <a href="/iag/chat/list" style="border-left: 1px solid rgb(9, 137, 241);"><i class="fab fa-rocketchat"></i>&nbsp;<span id="unread" style="font-size: 12px; color: navy; font-weight: 900;"></span></a>
        </div>
        <div id="boxTable">
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
        
        function chatBoxFunction() {
            let userNo = '<c:out value="${loginUser.userNo}"/>';

            $.ajax({
                type: "POST",
                url: "/iag/chat/chatBoxList",
                data: {
                    userNo: userNo
                },
                success: function(data) {
                    if(data == "") return;
                    $('#boxTable').html('');
                    let parsed = JSON.parse(data);
                    let result = parsed.result;
                    for(let i = 0; i < result.length; i++) {
                        if(result[i][0].value == userNo) {
                            result[i][0].value = result[i][1].value;
                        } else {
                            result[i][1].value = result[i][0].value;
                        }
                        addBox(result[i][0].value, result[i][1].value, result[i][2].value, result[i][3].value, result[i][4].value, result[i][5].value);
                    }
                }
            });
        }
        function addBox(lastId, toId, name, chatContent, chatTime, unread) {
            $('#boxTable').append('<ul onclick="location.href=\'/iag/chat/room?toId=' + encodeURIComponent(toId) + '\'">' +
            '<li style="font-weight:700; color:cornflowerblue;">' + name + '</li>' +
            '<li style="font-size:14px; overflow:hidden;">' + '&nbsp;' + 
            chatContent + '<span>' + unread + '</span>' + '</li>' +
            '<li style="text-align:right;">' + '<sub style="font-size:10px;">' + chatTime + '</sub>' + '</li>' +
            '</ul>' +
            '<hr>');
        }
        function getInfiniteBox() {
            setInterval(function() {
                chatBoxFunction();
            }, 3000);
        }

        $(document).ready(function() {
            getUnread();
            getInfiniteUnread();
            chatBoxFunction();
            getInfiniteBox();
        });

    </script>
</body>
</html>