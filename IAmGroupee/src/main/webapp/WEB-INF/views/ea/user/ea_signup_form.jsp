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

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ea/user/ea_signup.css">
</head>

<body>
  <%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

  <div class="ea_wrapper">
    <div class="ea_signup_formselect_wrapper">
      <div class="ea_signup_formselect_title">
        <span>기안신청 (양식선택)</span>
      </div>
      <div class="ea_signup_formselect_contents">
        <div>
          <div><span>🗂 카테고리</span></div>
          <select name="category" size="15">
            <!-- 반복문으로 카테고리테이블에서 카테고리 가져 오기 -->
            <option value="밸류가지고오기">카테고리 1</option>
            <option value="밸류가지고오기">카테고리 2</option>
            <option value="밸류가지고오기">카테고리 3</option>
            <option value="밸류가지고오기">카테고리 4</option>
            <option value="밸류가지고오기">카테고리 5</option>
            <option value="밸류가지고오기">카테고리 6</option>
          </select>
        </div>
        <div>
          <div><span>🧾 양식</span></div>
          <select name="form" size="15">
            <!-- 반복문으로 카테고리테이블에서 카테고리 가져 오기 -->
            <option value="밸류가지고오기">양식 1</option>
            <option value="밸류가지고오기">양식 2</option>
            <option value="밸류가지고오기">양식 3</option>
            <option value="밸류가지고오기">양식 4</option>
            <option value="밸류가지고오기">양식 5</option>
            <option value="밸류가지고오기">양식 6</option>
          </select>
        </div>
        <div>
          <div><span>🔍 양식 미리보기</span></div>
          <article>
            <!-- DB에 저장한 양식 하단에 불러오기 -->
            <h1>이종훈</h1>
            <table border="1">
              <tr>
                <td>이종훈이종훈이종훈이종훈이종훈이종훈이종훈이종훈이종훈이종훈이종훈</td>
                <td>이종훈</td>
                <td>이종훈</td>
              </tr>
              <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
              </tr>
              <tr>
                <td>가</td>
                <td>나</td>
                <td>다</td>
              </tr>
              <tr>
                <td>가</td>
                <td>나</td>
                <td>다</td>
              </tr>
              <tr>
                <td>가</td>
                <td>나</td>
                <td>다</td>
              </tr>
              <tr>
                <td>가</td>
                <td>나</td>
                <td>다</td>
              </tr>
              <tr>
                <td>가</td>
                <td>나</td>
                <td>다</td>
              </tr>
              <tr>
                <td>가</td>
                <td>나</td>
                <td>다</td>
              </tr>
              <tr>
                <td>가</td>
                <td>나</td>
                <td>다</td>
              </tr>
              <tr>
                <td>가</td>
                <td>나</td>
                <td>다</td>
              </tr>
              <tr>
                <td>가</td>
                <td>나</td>
                <td>다</td>
              </tr>
              <tr>
                <td>가</td>
                <td>나</td>
                <td>다</td>
              </tr>
              <tr>
                <td>가</td>
                <td>나</td>
                <td>다</td>
              </tr>
              <tr>
                <td>가</td>
                <td>나</td>
                <td>다</td>
              </tr>
            </table>
          </article>
        </div>
        <span id="arrow1">=></span>
        <span id="arrow2">=></span>
      </div>
      <div class="ea_signup_formselect_contents_btn">
        <form action="write" method="GET">
          <input type="hidden" name="" value="선택양식">
          <input type="submit" value="기안 작성하기">
        </form>
      </div>
    </div>
  </div>

  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
<!-- Icons library -->
<script src="${pageContext.request.contextPath}/resources/plugins/feather.min.js"></script>

<!-- Custom scripts -->
<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>
</body>
</html>