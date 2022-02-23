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
            <li>
              <a>👩‍🌾&ensp;결재자 선택 <span id="modal1" onclick="layer1_open();">+</span></a>
              <!-- 결재자 선택창에서 선택완료시 인풋히든에 사원번호 밸류 집어넣음 -->
              <input type="text" name="approver1" id="approver1" value="" readonly required>
              <input type="hidden" name="">
              <!-- 결재자 선택창에서 선택완료시 인풋히든에 사원번호 밸류 집어넣음 -->
              <input type="text" name="approver2" id="approver2" value="" readonly required>
              <input type="hidden" name="">
              <label>&ensp;✿전결 가능 문서 체크&ensp;<input type="checkbox" name="arbit" value="checked"></label>
            </li>
            <li>
              <a>👨‍👩‍👧‍👦&ensp;참조자 선택 <span id="modal2" onclick="layer2_open();">+</span></a>
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
              <textarea name="content" id="editor" placeholder="내용을 입력해주세요." required>
              </textarea>
            </li>
          </ul>
          <input type="submit" value="기안 신청">
          <input type="button" onclick="ea_signup_back();" value="돌아가기">
        </form>
        
      </div>
    </div>
  </div>
  
  <!-- layer -->
  <div id="layer1">
    <ul>
      <li>중간 결재자</li>
      <select name="" id="selected_approver1" size="13" style="width: 160px;">
        <!-- 음.. 부서와 그 부서의 사원 어떻게 불러올지 생각, 선택 완료시 value를 이름으로만 넘기면 기안 신청 제출시 식별이 어려우니 위에 input hidden 만들어서 사번도 같이 넘기기 -->
        <optgroup label="총무과">
          <option value="이종훈1">사장 이종훈</option>
          <option value="이종훈2">이종훈</option>
          <option value="이종훈3">이종훈</option>
        </optgroup>
        <optgroup label="인사과">
          <option value="이종훈4">이종훈</option>
          <option value="이종훈5">이종훈</option>
          <option value="이종훈6">이종훈</option>
        </optgroup>
        <optgroup label="회계과">
          <option value="이종훈7">이종훈</option>
          <option value="이종훈8">이종훈</option>
          <option value="이종훈9">이종훈</option>
        </optgroup>
      </select>
    </ul>
    <ul>
      <li>최종 결재자</li>
      <select name="" id="selected_approver2" size="13" style="width: 160px;">
        <optgroup label="총무과">
          <option value="이종훈1">사장 이종훈</option>
          <option value="이종훈2">이종훈</option>
          <option value="이종훈3">이종훈</option>
        </optgroup>
        <optgroup label="인사과">
          <option value="이종훈4">이종훈</option>
          <option value="이종훈5">이종훈</option>
          <option value="이종훈6">이종훈</option>
        </optgroup>
        <optgroup label="회계과">
          <option value="이종훈7">이종훈</option>
          <option value="이종훈8">이종훈</option>
          <option value="이종훈9">이종훈</option>
        </optgroup>
    </ul>
    <input type="button" value="선택 완료" onclick="ea_approver_select();">
    <input type="button" value="취소" onclick="layer1_close();">

  </div>
  <div id="layer2">
    <ul>
      <li>참조자</li>
      <select name="" id="selected_refers" size="13" style="width: 250px;" multiple>
        <optgroup label="총무과">
          <option value="이종훈1">사장 이종훈</option>
          <option value="이종훈2">이종훈</option>
          <option value="이종훈3">이종훈</option>
        </optgroup>
        <optgroup label="인사과">
          <option value="이종훈4">이종훈</option>
          <option value="이종훈5">이종훈</option>
          <option value="이종훈6">이종훈</option>
        </optgroup>
        <optgroup label="회계과">
          <option value="이종훈7">이종훈</option>
          <option value="이종훈8">이종훈</option>
          <option value="이종훈9">이종훈</option>
        </optgroup>
      </select>
    </ul>
    <input type="button" value="선택 완료" onclick="ea_refers_select();">
    <input type="button" value="취소" onclick="layer2_close();">
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

    function ea_approver_select() {
      let a1 = document.getElementById('approver1');
      let sa1 = document.getElementById('selected_approver1');
      a1.value = sa1.value;
      let a2 = document.getElementById('approver2');
      let sa2 = document.getElementById('selected_approver2');
      a2.value = sa2.value;

      document.getElementById('layer1').style.display = 'none';
      document.getElementById('layer_bg').style.display = 'none';
    }

    function layer1_open() {
      document.getElementById('layer1').style.display = 'block';
      document.getElementById('layer_bg').style.display = 'block';
    }
    function layer1_close() {
      document.getElementById('layer1').style.display = 'none';
      document.getElementById('layer_bg').style.display = 'none';
    }

    function ea_refers_select() {
      let r = document.getElementById('refer1');
      let sr = document.getElementById('selected_refers');
      r.value = sr.value;

      document.getElementById('layer2').style.display = 'none';
      document.getElementById('layer_bg').style.display = 'none';
    }

    function layer2_open() {
      document.getElementById('layer2').style.display = 'block';
      document.getElementById('layer_bg').style.display = 'block';
    }
    function layer2_close() {
      document.getElementById('layer2').style.display = 'none';
      document.getElementById('layer_bg').style.display = 'none';
    }
  </script>
</body>
</html>