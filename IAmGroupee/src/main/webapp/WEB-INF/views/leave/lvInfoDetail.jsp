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
            
	            	<div class="card card-primary card-outline" style="width: 100%; margin-top: 20px;">
	
			            <div class="card-body p-0">
			              <div class="mailbox-read-info" style="margin-left: 10px; margin-right: 10px;">
			                <h2 style="margin-bottom: 15px;" id="lvbTitle">${lvInfoDetail.lvbTitle}</h2>
			                <h6>${lvInfoDetail.lvbWriter}
			                  <span class="mailbox-read-time float-right" style="font-size: 16px;">${lvInfoDetail.lvbDate}</span></h6>
			              </div>
			              <div class="mailbox-read-message" style="text-align: center; width: 90%; margin: auto; margin-bottom: 10px;">
			                <p>
			                	${lvInfoDetail.lvbContent}
			                </p>
			              </div>
			            </div>
			        </div>
		            
		            <div style="height: 30px; width: 100%; margin-left: 90px;">
			           <div class="input-group-prepend" style="margin-left: 87%">
						  <form id="lvbModDel" method="post">
			                <input type="button" onclick="modLvb();" value="수정" style="background-color: rgb(14, 104, 225); font-weight: bold; color: white; margin-right: 10px; float: left;">
			                <input type="button" onclick="delLvb();" value="삭제" style="background-color: rgb(14, 104, 225); font-weight: bold; color: white; margin-right: 10px; float: left;">
			                <input type="button" value="목록" onclick="history.go(-1);" style="background-color: rgb(14, 104, 225); font-weight: bold; color: white; margin-right: 6px; float: left;">
						  </form>
			           </div>
			        </div>
             
            </article>
          </div>
        </div>
      </div>
    </main>

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    
    <script type="text/javascript">
		var modLvb = function(){
			var lvbTitle = document.getElementById("lvbTitle").innerHTML;
			var form =  $('#lvbModDel')[0]; 
			var obj;
		    obj = document.createElement('input');
		    obj.setAttribute('type', 'hidden');
		    obj.setAttribute('name', 'lvbTitle');
		    obj.setAttribute('value', lvbTitle);
			form.appendChild(obj);
			form.action="${root}/admin/leave/lvbModify";
			form.submit();
		};
		var delLvb = function(){
			var form2 =  $('#lvbModDel')[0];
			var obj2;
		    obj2 = document.createElement('input');
		    obj2.setAttribute('type', 'hidden');
		    obj2.setAttribute('name', 'lvbNo');
		    obj2.setAttribute('value', '${lvInfoDetail.lvbNo}');
			form2.appendChild(obj2);
			form2.action ="${root}/admin/leave/lvbDelete";
			form2.submit();
		};
    </script>

	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
</body>
</html>