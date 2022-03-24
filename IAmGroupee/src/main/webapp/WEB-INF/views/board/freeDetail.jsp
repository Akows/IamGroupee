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
<title>FreeBoard</title>
  <link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
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
			                <h2 style="margin-bottom: 15px;" id="lvbTitle">${freeBoardDetail.freeTitle}<span class="mailbox-read-time float-right" style="font-size: 16px;">조회수 ${freeBoardDetail.freeViewCount}</span></h2>
			                <h6>익명
			                  <span class="mailbox-read-time float-right" style="font-size: 16px;">${freeBoardDetail.freeDate}</span></h6>
			              </div>
			              <div class="mailbox-read-message" style="text-align: center; width: 90%; margin: auto; margin-bottom: 10px;">
			                <p>
			                	${freeBoardDetail.freeContent}
			                </p>
			              </div>
			            </div>
			        </div>
					<%
					String useNo = (String)session.getAttribute("useNo");
					String userNo = (String)session.getAttribute("userNo");
						if(useNo.equals(userNo)){
					%>
		            <div style="height: 30px; width: 100%; margin-left: 90px;">
			           <div class="input-group-prepend" style="margin-left: 82%; margin-top: 10px;">
						  <form id="freeModDel" method="post">
			                <input type="button" onclick="modFree();" value="수정" style="background-color: rgb(14, 104, 225); font-weight: bold; color: white; margin-right: 10px; float: left;">
			                <input type="button" onclick="delFree();" value="삭제" style="background-color: rgb(14, 104, 225); font-weight: bold; color: white; margin-right: 10px; float: left;">
			                <input type="button" value="목록" onclick="goList();" style="background-color: rgb(14, 104, 225); font-weight: bold; color: white; margin-right: 6px; float: left;">
						  </form>
			           </div>
			        </div>
					<%
						} else {
					%>
		            <div style="height: 30px; width: 100%; margin-left: 90px;">
			           <div class="input-group-prepend" style="margin-left: 91%; margin-top: 10px;">
						  <form id="freeModDel" method="post">
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
		var modFree = function(){
			var form =  $('#freeModDel')[0]; 
			var obj;
		    obj = document.createElement('input');
		    obj.setAttribute('type', 'hidden');
		    obj.setAttribute('name', 'boardFreeNum');
		    obj.setAttribute('value', '${freeBoardDetail.boardFreeNum}');
			form.appendChild(obj);
			form.action="${root}/board/freeModify";
			form.submit();
		};
		var delFree = function(){
			var form2 =  $('#freeModDel')[0];
			var obj2;
		    obj2 = document.createElement('input');
		    obj2.setAttribute('type', 'hidden');
		    obj2.setAttribute('name', 'boardFreeNum');
		    obj2.setAttribute('value', '${freeBoardDetail.boardFreeNum}');
			form2.appendChild(obj2);
			form2.action ="${root}/board/freeDelete";
			form2.submit();
		};
		var goList = function(){
			var form3 =  $('#freeModDel')[0];
			form3.action ="${root}/board/freeBoard";
			form3.method = "get";
			form3.submit();
		};
    </script>

	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
</body>
</html>