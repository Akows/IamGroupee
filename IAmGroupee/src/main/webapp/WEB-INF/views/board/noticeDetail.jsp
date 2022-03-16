<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>LeaveInfo</title>
  <!-- Theme style -->
  <link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
  <!-- Favicon -->
  <link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">
</head>

<body>

    <%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

    <!-- ! Main -->
    <main class="main users chart-page" id="skip-target">
      <div class="container">
       <div class="row stat-cards">
          <div class="col-md-6 col-xl-12" style="height: 90%;">
            <article class="stat-cards-item">
            
	            	<div class="card card-primary card-outline" style="width: 90%; margin-top: 20px; margin: auto;">
	
			            <div class="card-body p-0">
			              <div class="mailbox-read-info" style="margin-left: 10px; margin-right: 10px;">
			                <h2 style="margin-bottom: 15px;" id="lvbTitle">${noticeBoardDetail.noticeTitle}
			                <span class="mailbox-read-time float-right" style="font-size: 16px;">조회수 ${noticeBoardDetail.noticeViewCount}</span></h2>
			                <h6>관리자
			                  <span class="mailbox-read-time float-right" style="font-size: 16px;">${noticeBoardDetail.noticeDate}</span></h6>
			              </div>
			              <div class="mailbox-read-message" style="text-align: center; width: 90%; margin: auto; margin-bottom: 10px;">
			                <p>
			                	${noticeBoardDetail.noticeContent}
			                </p>
			              </div>
			            </div>
			        </div>
					<%
					String boardRight = (String)session.getAttribute("boardRight");
						if(boardRight.equals("Y")){
					%>
		            <div style="height: 30px; width: 100%; margin-left: 90px;">
			           <div class="input-group-prepend" style="margin-left: 82%; margin-top: 10px;">
						  <form id="boardModDel" method="post">
			                <input type="button" onclick="modNotice();" value="수정" style="background-color: rgb(14, 104, 225); font-weight: bold; color: white; margin-right: 10px; float: left;">
			                <input type="button" onclick="delNotice();" value="삭제" style="background-color: rgb(14, 104, 225); font-weight: bold; color: white; margin-right: 10px; float: left;">
			                <input type="button" value="목록" onclick="goList();" style="background-color: rgb(14, 104, 225); font-weight: bold; color: white; margin-right: 6px; float: left;">
						  </form>
			           </div>
			        </div>
					<%
						} else {
					%>
		            <div style="height: 30px; width: 100%; margin-left: 90px;">
			           <div class="input-group-prepend" style="margin-left: 91%; margin-top: 10px;">
						  <form id="boardModDel" method="post">
			                <input type="button" value="목록" onclick="goList();" style="background-color: rgb(14, 104, 225); font-weight: bold; color: white; margin-right: 6px; float: left;">
						  </form>
			           </div>
			        </div>
					<%
						}
					%>
            </article>
          </div>
        </div>
      </div>
    </main>

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    
    <script type="text/javascript">
		var modNotice = function(){
			var form =  $('#boardModDel')[0]; 
			var obj;
		    obj = document.createElement('input');
		    obj.setAttribute('type', 'hidden');
		    obj.setAttribute('name', 'noticeNum');
		    obj.setAttribute('value', '${noticeBoardDetail.noticeNum}');
			form.appendChild(obj);
			form.action="${root}/admin/board/noticeModify";
			form.submit();
		};
		var delNotice = function(){
			var form2 =  $('#boardModDel')[0];
			var obj2;
		    obj2 = document.createElement('input');
		    obj2.setAttribute('type', 'hidden');
		    obj2.setAttribute('name', 'noticeNum');
		    obj2.setAttribute('value', '${noticeBoardDetail.noticeNum}');
			form2.appendChild(obj2);
			form2.action ="${root}/admin/board/noticeDelete";
			form2.submit();
		};
		var goList = function(){
			var form3 =  $('#boardModDel')[0];
			form3.action ="${root}/board/notice";
			form3.method = "get";
			form3.submit();
		};
    </script>

	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
</body>
</html>