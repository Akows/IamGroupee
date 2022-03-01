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
        <form action="write" method="GET" onsubmit="return checkingSelectForm();">
          <div>
            <div><span>🗂 카테고리</span></div>
            <select name="categoryNo" size="15">
              <!-- 반복문으로 카테고리테이블에서 카테고리 가져 오기 -->
              <c:forEach items="${categoryValues}" var="cv">
                <option value="${cv.categoryNo}" onclick="return seletedCategory(this);">${cv.categoryName}</option>
              </c:forEach>
            </select>
          </div>
          <div>
            <div><span>🧾 양식</span></div>
            <select name="formNo" size="15">
              <!-- 반복문으로 카테고리테이블에서 카테고리 가져 오기 -->
              <c:forEach items="${formValues}" var="fv">
                <option class="${fv.categoryNo}" value="${fv.formNo}" onclick="selectedForm(this);" ondblclick="updateFormName();">${fv.formTitle}</option>
              </c:forEach>
            </select>
          </div>
          <div>
            <div><span>🔍 양식 미리보기</span></div>
            <article id="formContents">
              <!-- DB에 저장한 양식 하단에 불러오기 -->
              <c:forEach items="${formValues}" var="fv">
                <div id="${fv.formNo}">${fv.formContent}</div>
              </c:forEach>
            </article>
          </div>
          <span id="arrow1">=></span>
          <span id="arrow2">=></span>
          <div class="ea_signup_formselect_contents_btn">
              <input type="submit" value="기안 작성하기">
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
  // 양식 카테고리 클릭시(선택시) 카테고리에 포함된 양식 불러오기
  function seletedCategory(e) {
    $('select[name=categoryNo] > option').removeAttr('selected');
    $(e).attr('selected', 'selected');
    let cn = $(e).val();
    let arr = document.getElementsByClassName(cn);
    $('select[name=formNo] > option').removeClass('activeForm');
    for (let i = 0; i < arr.length; i++) {
      arr[i].classList.add('activeForm');
    }
  };

  // 양식 클릭시(선택시) 미리보기에 내용 출력
  function selectedForm(e) {
    $('select[name=formNo] > option').removeAttr('selected');
    $(e).attr('selected', 'selected');
    let fn = $(e).val();
    let value = document.getElementById(fn);
    $('#formContents > div').removeClass('activeContent');
    value.classList.add('activeContent');
  };


  // 양식 수정하기 버튼 클릭시 선택된거 없으면 제출 불가
  function checkingSelectForm() {
    if(undefined === $('select[name="formNo"] > option[selected="selected"]').val()) {
      alert('양식을 선택해주세요.');
      return false;
    } else {
      return true;
    }
  };
</script>
</body>
</html>