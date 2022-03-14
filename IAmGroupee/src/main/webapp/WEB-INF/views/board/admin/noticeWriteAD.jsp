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
<title>LeaveInfoWrite</title>
  <!-- Theme style -->
  <link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
  <!-- Favicon -->
  <link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">
  <script type="text/javascript" src="${root}/resources/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
  <script type="text/javascript" src="${root}/resources/smarteditor2/js/jindo.min.js" charset="utf-8" ></script>
</head>

<body>

    <%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

    <!-- ! Main -->
    <main class="main users chart-page" id="skip-target">
      <div class="container">
       <div class="row stat-cards">
          <div class="col-md-6 col-xl-12" style="height: 90%;">
            <article class="stat-cards-item" style="margin-top: 4%">
            
            	<div class="card card-primary card-outline" style="width: 65%; margin-top: 20px; margin-bottom: 20px; margin: auto;">

				<form id="noticeWriteAD" method="post">
		            <div class="card-body p-0">
		              <div class="mailbox-read-info" style="margin-left: 10px; margin-right: 10px;">
		                <input type="text" placeholder="제목을 입력해주세요." id="lvbTitle" name="lvbTitle" style="border: 1px solid lightgray; width: 100%;">
		              </div>
		              <div class="mailbox-read-message" style="text-align: center; width: 90%; margin: auto; margin-bottom: 10px;">
						<textarea name="lvbContent" id="lvbContent" rows="10" cols="100" style="width:100%; height:412px; margin: auto;"></textarea>
		              </div>
		            </div>
				  <div class="card-footer clearfix" style="width: 100%; margin: auto;">
				  	  <div style="margin-left: 84%">
				  	  	 <c:if test="${modify != 'true'}">
			                <input type="button" onclick="onWrite()" value="등록" style="background-color: rgb(14, 104, 225); font-weight: bold; color: white; margin-right: 10px; float: left;">
			             </c:if>
			             <c:if test="${modify == 'true'}">
			                <input type="button" onclick="onModify()" value="수정" style="background-color: rgb(14, 104, 225); font-weight: bold; color: white; margin-right: 10px; float: left;">
						 </c:if>
			                <input type="button" onclick="history.go(-1);" value="취소" style="background-color: rgb(14, 104, 225); font-weight: bold; color: white; margin-right: 6px; float: left;">
			          </div>
			          <input type="hidden" name="lvbNo" value="${thisLvbData.lvbNo}">
                  </div>
                </form>
                
		        </div>             
            </article>
          </div>
        </div>
      </div>
    </main>

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>

	<script type="text/javascript">
		var oEditors = [];
			nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: document.getElementById('lvbContent'), // html editor가 들어갈 textarea id
			sSkinURI: "${root}/resources/smarteditor2/SmartEditor2Skin.html",  // html editor가 skin url
			fOnAppLoad: function () { 
		        //수정모드를 구현할 때 사용할 부분. 로딩이 끝난 후 값이 체워지게 하는 구현을 하면 된다.
		         var lvbTitle = '${thisLvbData.lvbTitle}';               
		         var lvbContent = '${thisLvbData.lvbContent}';         //db에서 불러온 값을 여기에서 체워넣으면 됨.
		         document.getElementById("lvbTitle").value = lvbTitle;     
		         oEditors.getById["lvbContent"].exec("PASTE_HTML", [lvbContent]); //로딩이 끝나면 contents를 txtContent에 넣음
		     },
		     fCreator: "createSEditor2"
		 });
		var onWrite = function(){
			oEditors.getById["lvbContent"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됨
			var noticeWriteAD = document.getElementById("noticeWriteAD");  
			noticeWriteAD.action ="lvbEnroll";              
			noticeWriteAD.submit();  
		};
		var onModify = function(){
			oEditors.getById["lvbContent"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됨
			var lvbWriteForm = document.getElementById("noticeWriteAD");  
			noticeWriteAD.action ="lvbUpdate";              
			noticeWriteAD.submit();  
		};
		var pasteHTML = function(filename){
		    var sHTML = '<img src="${pageContext.request.contextPath}/resources/upload/leave'+filename+'">';
		    oEditors.getById["lvbContent"].exec("PASTE_HTML", [sHTML]);
		};
	</script>
	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
</body>

</html>