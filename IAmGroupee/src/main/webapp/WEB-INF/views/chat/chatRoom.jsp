<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iamgroupe messenger</title>
</head>
<body>
    <!-- 채팅상대, 채팅목록, 채팅방 이동 버튼 -->
    <!-- 채팅 창 -->
    <div>
        <div id="chat">
            <div id="chatList" style="overflow-y: auto; width: auto; height: 600px;">
            
            </div>
            <div>
                <input style="height: 40px;" type="text" id="chatName" placeholder="이름" maxlength="8">
            </div>
            <div>
                <textarea style="height: 80px;" id="chatContent" placeholder="메시지를 입력하세요." maxlength="100"></textarea>
            </div>
            <div>
                <button type="button" onclick="submitFunction();">전송</button>
            </div>
        </div>
    </div>
</body>
</html>