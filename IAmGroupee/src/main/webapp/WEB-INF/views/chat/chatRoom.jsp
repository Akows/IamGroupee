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
    <div id="chatRoom">
        
        <div>
            <a href="/iag/chat/users" style="border-right: 1px solid rgb(9, 137, 241);"><i class="fas fa-user-friends"></i></a>
            <a href="/iag/chat/list" style="border-left: 1px solid rgb(9, 137, 241);"><i class="fab fa-rocketchat"></i></a>
        </div>
        <div>
            '${userValue.name}'님과의 대화
        </div>
        <!-- 채팅상대, 채팅목록, 채팅방 이동 버튼 -->
        <!-- 채팅 창 -->
        <div>
            <div id="chat">
                <div id="chatList" style="overflow-y: auto; width: auto; height: 300px;">
                
                </div>
                <div>
                    <textarea style="height: 80px;" id="chatContent" placeholder="메시지를 입력하세요." maxlength="100"></textarea>
                </div>
                <div>
                    <button type="button" onclick="submitFunction();">전송</button>
                </div>
            </div>
        </div>

    </div>


    <script type="text/javascript">
        function submitFunction() {
            let fromId = '<c:out value="${userValue.fromId}"/>';
            let toId = '<c:out value="${userValue.toId}"/>';
            let chatContent = $("#chatContent").val();
            $.ajax({
                type: "POST",
                url: "/iag/chat/sendingChat", 
                data: {
                    fromId: fromId,
                    toId: toId,
                    chatContent: chatContent
                },
                success: function(result) {
                    if(result == 1) {
                        alert('메시지 전송 성공');
                    } else if(reuslt == 0) {
                        alert('메시지 전송 실패');
                    } else {
                        alert('띠용');
                    }
                },
                error: function(e) {
                    console.log(e);
                }
            });
            $('#chatContent').val('');
        }

        let lastId = 0;
        function chatListFunction(type) {
            let fromId = '<c:out value="${userValue.fromId}"/>';
            let toId = '<c:out value="${userValue.toId}"/>';
            $.ajax({
                type: "POST",
                url: "/iag/chat/callingChat",
                data: {
                    fromId: fromId,
                    toId: toId,
                    listType: type
                },
                success: function(data) {
                    if(data == "") return;
                    let parsed = JSON.parse(data);
                    let result = parsed.result;
                    for(let i = 0; i < result.length; i++) {
                        addChat(result[i][0].value, result[i][2].value, result[i][3].value);
                    }
                    lastId = Number(parsed.last);
                }

            });
        }
        function addChat(chatName, chatContent, chatTime) {
            $('#chatList').append('<table border=1>' +
                '<tr>' +
                '<td>' + chatName + '</td>' +
                '<td>' + chatContent + '</td>' +
                '<td>' + chatTime + '</td>' +
                '</tr>' +
                '</table>' +
                '<hr>');

            $('#chatList').scrollTop($('#chatList')[0].scrollHeight);
        }
        function getInfiniteChat() {
            setInterval(function() {
                chatListFunction(lastId);
            }, 3000);
        }

        


    </script>

    <script type="text/javascript">
        $(document).ready(function() {
            chatListFunction('ten');
            getInfiniteChat();
        });
    </script>
</body>
</html>