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
        <form action="" method="POST">
            <!-- category -->
            <div>
                <span>🗂&ensp;카테고리 :</span>
                <select name="category" id="">
                    <!-- db 카테고리 불러오기 -->
                    <option value="">카테고리1</option>
                    <option value="">카테고리2</option>
                    <option value="">카테고리3</option>
                </select>
            </div>
            <!-- form name -->
            <div>
                <span>💬&ensp;양식제목 :</span>
                <input type="text">
            </div>
            <!-- preserved years -->
            <div>
                <span>📆&ensp;보존연한 :</span>
                <select name="preservedYears" id="">
                    <option value="1">1년</option>
                    <option value="2">2년</option>
                    <option value="3">3년</option>
                    <option value="4">4년</option>
                    <option value="5">5년</option>
                </select>
            </div>
            <!-- form contents -->
            <div>
                <span>📝&ensp;양식내용 :</span>
                <textarea name="content" id="editor" placeholder="내용을 입력해주세요." required></textarea>
            </div>
            <!-- btn -->
            <div>
                <a href="">저장하기</a>
                <a href="">취소</a>
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

  </script>
</body>
</html>