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
            [${userValue.departmentName}] ${userValue.name} ${userValue.positionName}
        </div>
        <!-- 채팅상대, 채팅목록, 채팅방 이동 버튼 -->
        <!-- 채팅 창 -->
        <div>
            <div id="chat">
                <div id="chatList" style="overflow-y: auto; width: auto; height: 285px;">
                </div>
                <div>
                    <textarea style="height: 40px;" id="chatContent" placeholder="메시지를 입력하세요." maxlength="100"></textarea>
                </div>
                <div>
                    <button type="button" onclick="submitFunction();">💌</button>
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
                        if(result[i][0].value == fromId) {
                            result[i][0].value = '나';
                        }
                        addChat(result[i][0].value, result[i][2].value, result[i][3].value);
                    }
                    lastId = Number(parsed.last);
                }
    
            });
        }
        function addChat(chatName, chatContent, chatTime) {
            let fromId = '<c:out value="${userValue.fromId}"/>';
            let toId = '<c:out value="${userValue.toId}"/>';

            if(chatName == toId) {
                $('#chatList').append(
                    '<table style="text-align:left; width:100%">' +
                    '<tr>' +
                    '<td style="padding:10px;">' +
                    '<span style="padding:8px; border-radius: 8px; background:darkgrey; color:#fff; font-size:14px;">' + chatContent + '</span>' +
                    '</td>' +
                    '</tr>' +
                    '<tr>' +
                    '<td><sup style="font-size:10px;">' + chatTime + '</sup></td>' +
                    '</tr>' +
                    '</table>');
            } else {
                $('#chatList').append(
                    '<table style="text-align:right; width:100%">' +
                    '<tr>' +
                    '<td style="padding:10px;">' +
                    '<span style="padding:8px; border-radius: 8px; background:rgb(223, 238, 252); color:#262626; font-size:14px;">' + chatContent + '</span>' +
                    '</td>' +
                    '</tr>' +
                    '<tr>' +
                    '<td><sup style="font-size:10px;">' + chatTime + '</sup></td>' +
                    '</tr>' +
                    '</table>');
            }
    
            $('#chatList').scrollTop($('#chatList')[0].scrollHeight);
        }
        function getInfiniteChat() {
            setInterval(function() {
                $('#chatList').children().remove();
                chatListFunction(lastId);
            }, 3000);
        }

        $(document).ready(function() {
            chatListFunction('ten');
            getInfiniteChat();
        });
    </script>
</body>
</html>