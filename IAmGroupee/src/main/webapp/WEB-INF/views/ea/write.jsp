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
  <link rel="shortcut icon" href="../resources/img/svg/looo.png" type="image/x-icon">
  <!-- Custom styles -->
  <link rel="stylesheet" href="../resources/css/style.min.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ea/ea_signup.css">
  <script src="https://cdn.ckeditor.com/ckeditor5/32.0.0/classic/ckeditor.js"></script>
</head>

<body>
  <%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

  <div class="ea_wrapper">
    <div class="ea_signup_write_wrapper">
      <div class="ea_signup_write_title">
        <span>기안 작성</span>
      </div>
      <div class="ea_signup_write_contents">
        <form action="" method="POST">
          <ul>
            <li>
              <a>결재자 선택 <button id="modal1">+</button></a>
              <input type="text" name="approver1" id="approver1" value="" readonly required>
              <input type="text" name="approver2" id="approver2" value="" readonly required>
            </li>
            <li>
              <a>참조자 선택 <button id="modal2">+</button></a>
              <!-- 반복문 써서 참조자 5명까지 가능하게? -->
              <input type="text" name="refer1" id="refer1" value="" readonly>
            </li>
            <li>
              <a>보안등급 선택</a>
              <select name="securityLevel" id="securityLevel" required>
                <option selected>등급 선택</option>
                <option value="S">S등급</option>
                <option value="A">A등급</option>
                <option value="A">B등급</option>
                <option value="C">C등급</option>
              </select>
            </li>
            <li>
              <a>마감 날짜 선택</a>
              <input type="date" name="deadlineDate" id="deadlineDate">
            </li>
          </ul>

          <textarea name="content" id="editor" placeholder="내용을 입력해주세요." required>
          </textarea>
      
      
          
        </form>

      </div>
    </div>
  </div>

  <div id="layout1">

  </div>
  <div id="layout2">

  </div>

  

  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
<!-- Icons library -->
<script src="../resources/plugins/feather.min.js"></script>

<!-- Custom scripts -->
<script src="../resources/js/script.js"></script>

<script>
  ClassicEditor
      .create( document.querySelector( '#editor' ) )
      .catch( error => {
          console.error( error );
      } );
</script>
</body>
</html>