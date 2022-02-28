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
  
  <!-- text editor -->
  <script src="https://cdn.ckeditor.com/ckeditor5/32.0.0/classic/ckeditor.js"></script>
</head>

<body>
  <%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

  <div class="ea_wrapper">
    <div class="ea_signup_write_wrapper">
      <div class="ea_signup_write_title">
        <span>기안신청 (기안작성)</span>
      </div>
      <div class="ea_signup_write_contents">
        <form action="" method="POST" onsubmit="return ea_write_submit();">
          <ul>
            <li id="approverList">
              <a>👩‍🌾&ensp;결재자 선택 
                <span id="minusApprover">-</span>
                <span id="plusApprover">+</span>
                <span>( ☺︎ 박스 생성 순서대로 결재 순서가 정해집니다 ☻ )</span>
                <label>&ensp;✿전결 가능 문서 체크&ensp;<input type="checkbox" name="arbit" value="checked"></label>
              </a>
              <!-- 결재자 선택창에서 선택완료시 인풋히든에 사원번호 밸류 집어넣음 -->
              <input type="text" class="approver" name="approverName1" readonly required placeholder="결재자 선택">
              <input type="hidden" name="approverNo1">
            </li>
            <li id="referList">
              <a>👨‍👩‍👧‍👦&ensp;참조자 선택</a>
              <!-- 반복문 써서 참조자 5명까지 가능하게? -->
              <input type="text" name="refer1" id="refer1" value="" readonly>
              <!-- 참조자 선택창에서 선택완료시 인풋히든에 사원번호 밸류 집어넣음 -->
              <input type="hidden" name="">

            </li>
            <li>
              <a>🔐&ensp;보안등급 선택</a>
              <select name="securityLevel" id="securityLevel" required>
                <option selected>등급 선택</option>
                <option value="S">S등급</option>
                <option value="A">A등급</option>
                <option value="A">B등급</option>
                <option value="C">C등급</option>
              </select>
            </li>
            <li>
              <a>📆&ensp;마감 날짜 선택</a>
              <input type="date" name="deadlineDate" id="deadlineDate">
            </li>
            <li>
              <a>💬&ensp;기안서 제목</a>
              <input type="text" name="title" id="title" style="width: 30%;" placeholder="제목을 입력해주세요.">
            </li>
            <li>
              <a>📝&ensp;내용</a>
              <textarea name="content" id="editor" placeholder="내용을 입력해주세요." required>${formValue.formContent}</textarea>
            </li>
          </ul>
          <input type="submit" value="기안 신청">
          <input type="button" onclick="ea_signup_back();" value="돌아가기">
        </form>
        
      </div>
    </div>
  </div>
  
  <!-- layer -->
  <div id="layer1"> <!-- 결재자 -->

  </div>
  <div id="layer2"> <!-- 참고자 -->
    
  </div>

  <div id="layer_bg"></div>
  
  
  
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

    function ea_signup_back() {
      window.location.href = "signup";
    }

    function ea_write_submit() {
      if(confirm('작성하신 기안을 신청하시겠습니까?')) {
        return true;
      } else {
        return false;
      }
    }

    // 결재자 + , - 최대 5명 최소 1명
    // 결재자 +
    let plusApproverBtn = document.getElementById('plusApprover');
    plusApproverBtn.addEventListener('click', () => {
      let approverArr = document.getElementsByClassName('approver');
      if(approverArr.length < 5) {
        switch (approverArr.length) {
        case approverArr.length:
          let count = approverArr.length + 1;
          $('<input>', {
            type : "text",
            class : "approver",
            name : "approverName" + count,
            readonly : "true",
            required : "true",
            placeholder : "결재자 선택"
          }).appendTo('#approverList');
          $('<input>', {
            type : "hidden",
            name : "approverNo" + count
          }).appendTo('#approverList');
          break;
        default: break;
        };
      } else {
        alert('상위 결재자는 최대 5명까지 설정 가능합니다!');
      }
    });
    // 결재자 -
    let minusApproverBtn = document.getElementById('minusApprover');
    minusApproverBtn.addEventListener('click', () => {
      let approverArr = document.getElementsByClassName('approver');
      if(approverArr.length > 1) {
        switch (approverArr.length) {
        case approverArr.length:
          let count = approverArr.length - 1;
          approverArr[count].remove();
          break;
        default: break;
        };
      } else {
        alert('상위 결재자는 최소 1명 이상 필요합니다!');
      }
    });

  </script>
</body>
</html>