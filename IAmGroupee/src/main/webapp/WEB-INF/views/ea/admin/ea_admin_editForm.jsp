<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>전자결재 > 기안신청(양식선택)</title>
  <!-- Favicon -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/svg/looo.png" type="image/x-icon">
  <!-- Custom styles -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.min.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ea/admin/ea_settings.css">
  
  <!-- text editor -->
  <script src="https://cdn.ckeditor.com/ckeditor5/32.0.0/classic/ckeditor.js"></script>
</head>

<body>
  <%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

  <div class="ea_wrapper">
    <div class="ea_settings_editForm_wrapper">
      <div class="ea_settings_title">
        <ul>
            <li class="active">양식수정</li>
        </ul>
      </div>
      <div class="ea_settings_editForm_contents">
        <form action="" method="POST" name="reuqestForm">
            <!-- category -->
            <div>
                <span>🗂&ensp;카테고리 :</span>
                <select name="categoryNo">
                    <!-- db 카테고리 불러오기 -->
                    <c:forEach items="${categoryValues}" var="cv">
                    	<c:if test="${cv.categoryNo eq formValue.categoryNo}">
	                    	<option value="${cv.categoryNo}" selected="selected">${cv.categoryName}</option>                	
                    	</c:if>
                    	<c:if test="${cv.categoryNo ne formValue.categoryNo}">
	                    	<option value="${cv.categoryNo}">${cv.categoryName}</option>  
                    	</c:if>              	
                    </c:forEach>
                </select>
            </div>
            <!-- form name -->
            <div>
                <span>💬&ensp;양식이름 :</span>
                <input type="text" name="formTitle" value="${formValue.formTitle}" placeholder="변경하실 양식이름을 적어주세요.">
            </div>
            <!-- preserved years -->
            <div>
                <% int[] y = {1, 2, 3, 4, 5}; %>
                <span>📆&ensp;보존연한 :</span>
                <select name="formYears">
                <c:forEach items="<%=y%>" var="year">
                	<c:if test="${formValue.formYears eq year}">
	                    <option value="${year}" selected="selected">${year}년</option>           	
                	</c:if>                
                	<c:if test="${formValue.formYears ne year}">
	                    <option value="${year}">${year}년</option>    
                    </c:if>       	
                </c:forEach>
                </select>
            </div>
            <!-- form contents -->
            <div>
                <span>📝&ensp;양식내용 :</span>
                <textarea name="formContent" id="editor" placeholder="내용을 입력해주세요." required>${formValue.formContent}</textarea>
            </div>
            <!-- btn -->
            <div>
                <a href="javascript:reuqestForm.submit()" onclick="return confirmChange();">저장하기</a>
                <a href="/iag/admin/ea/main">취소</a>
            </div>
        </form>
      </div>
    </div>
  </div>

  
  
  
  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
  <!-- Icons library -->
  <script src="${pageContext.request.contextPath}/resources/plugins/feather.min.js"></script>
  
  <!-- Custom scripts -->
  <script src="${pageContext.request.contextPath}/resources/js/script.js"></script>
  
  <script>
    ClassicEditor
    .create( document.querySelector( '#editor' ) )
    .catch( error => {
      console.error( error );
    } );
    
    function confirmChange() {
    	if(confirm("수정 내용을 저장하시겠습니까?")) {
    		return true;
    	} else {
    		return false;
    	}
    };

  </script>
</body>
</html>