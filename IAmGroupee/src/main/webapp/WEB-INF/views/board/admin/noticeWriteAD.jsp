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
  <link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
  <link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">
  <script type="text/javascript" src="${root}/resources/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
  <script type="text/javascript" src="${root}/resources/smarteditor2/js/jindo.min.js" charset="utf-8" ></script>
</head>

<body>

    <%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

    <main class="main users chart-page" id="skip-target">
      <div class="container">
       <div class="row stat-cards">
          <div class="col-md-6 col-xl-12" style="height: 90%;">
            <article class="stat-cards-item" style="margin-top: 4%">
            
            	<div class="card card-primary card-outline" style="width: 65%; margin-top: 20px; margin-bottom: 20px; margin: auto;">

				<form id="noticeWriteAD" method="post">
		            <div class="card-body p-0">
		              <div class="mailbox-read-info" style="margin-left: 10px; margin-right: 10px;">
		                <input type="text" placeholder="제목을 입력해주세요." id="noticeTitle" name="noticeTitle" style="border: 1px solid lightgray; width: 100%;">
		              </div>
		              <div class="mailbox-read-message" style="text-align: center; width: 90%; margin: auto; margin-bottom: 10px;">
						<textarea name="noticeContent" id="noticeContent" rows="10" cols="100" style="width:100%; height:412px; margin: auto;"></textarea>
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
			          <input type="hidden" name="noticeNum" value="${thisNoticeData.noticeNum}">
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
			elPlaceHolder: document.getElementById('noticeContent'),
			sSkinURI: "${root}/resources/smarteditor2/SmartEditor2Skin.html",
			fOnAppLoad: function () { 
		         var noticeTitle = '${thisNoticeData.noticeTitle}';               
		         var noticeContent = '${thisNoticeData.noticeContent}';  
		         document.getElementById("noticeTitle").value = noticeTitle;     
		         oEditors.getById["noticeContent"].exec("PASTE_HTML", [noticeContent]);
		     },
		     fCreator: "createSEditor2"
		 });
		var onWrite = function(){
			oEditors.getById["noticeContent"].exec("UPDATE_CONTENTS_FIELD", []);
			var noticeWriteAD = document.getElementById("noticeWriteAD");  
			noticeWriteAD.action ="noticeEnroll";              
			noticeWriteAD.submit();  
		};
		var onModify = function(){
			oEditors.getById["noticeContent"].exec("UPDATE_CONTENTS_FIELD", []);
			var noticeWriteAD = document.getElementById("noticeWriteAD");  
			noticeWriteAD.action ="noticeUpdate";              
			noticeWriteAD.submit();  
		};
		var pasteHTML = function(filename){
		    var sHTML = '<img src="${pageContext.request.contextPath}/resources/upload/leave'+filename+'">';
		    oEditors.getById["noticeContent"].exec("PASTE_HTML", [sHTML]);
		};
	</script>
	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
</body>

</html>