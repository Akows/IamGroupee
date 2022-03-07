<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>전자결재 > 기안신청(연차기안)</title>
  <!-- Favicon -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/svg/looo.png" type="image/x-icon">
  <!-- Custom styles -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.min.css">
  <!-- Theme style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/adminlte.css">
	<!-- adminLTE CDN -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.1/dist/css/adminlte.min.css">

  <!-- text editor -->
  <script src="https://cdn.ckeditor.com/ckeditor5/32.0.0/classic/ckeditor.js"></script>
  
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ea/user/ea_signup.css">
  <!-- daterange picker -->
  <link rel="stylesheet" href="${root}/resources/plugins/daterangepicker/daterangepicker.css">

</head>
<body>
  <%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

  <div class="ea_wrapper">
    <div class="ea_signup_write_wrapper">
      <div class="ea_signup_write_title">
        <span>기안신청 (연차기안)</span>
      </div>
      <div class="ea_signup_write_contents">
        <form action="" method="POST" onsubmit="return ea_write_submit();">
          <ul>
            <li id="approverList">
              <a>👩‍🌾&ensp;결재자 선택 
                <span id="minusApprover">-</span>
                <span id="plusApprover">+</span>
                <span>( ☺︎ 박스 생성 순서대로 결재 순서가 정해집니다 ☻ )</span>
              </a>
              <!-- 결재자 선택창에서 선택완료시 인풋히든에 사원번호 밸류 집어넣음 -->
              <input type="text" class="approver" name="approverName" readonly required placeholder="결재자 선택" onclick="openSelectingApproverLayer(this);">
              <input type="hidden" class="hiddenAppr" name="approverNo" required>
            </li>
            <li id="referList">
              <a>👨‍👩‍👧‍👦&ensp;참조자 선택</a>
              <!-- 참조자 선택창에서 선택완료시 인풋히든에 사원번호 밸류 집어넣음 -->
              <textarea name="refer" id="refer" cols="25" rows="3" readonly placeholder="참조자 선택" onclick="openSelectingReferLayer();"></textarea>

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
			        	<div class="form-group" style="width:200px; margin:5px;">
                    <div class="input-group date" id="reservationdate" data-target-input="nearest">
                        <input type="text" name="deadlineDate" class="form-control datetimepicker-input" data-target="#reservationdate"/>
                        <div class="input-group-append" data-target="#reservationdate" data-toggle="datetimepicker">
                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                        </div>
                    </div>
                </div>	
            </li>
            <li>
              <a>💬&ensp;기안서 제목</a>
              <input type="text" name="title" id="title" style="width: 30%;" placeholder="제목을 입력해주세요." required>
            </li>
            <hr>
            <div id="lvWrap">
              
              <!-- 연차/휴가 구분 -->
              <input type="hidden" name="lvCheck" value="A">

              <!-- 연차종류 value="ALV_XX" 연차코드 -->
              <p>연차 종류</p>
              <select name="lvCode">
                <option value="ALV_00">연차</option>
                <option value="ALV_01">일차</option>
                <option value="ALV_02">반차</option>
                <option value="ALV_03">반반차</option>
                <option value="ALV_04">월차</option>
                <option value="ALV_05">조정연차</option>
              </select>

              <!-- 반차 선택시 -->
              <select name="halfLv">
                <option value="">오전</option>
                <option value="">오후</option>
              </select>

              <!-- 반반차 선택시 -->
              <select name="halfNhalfLv">
                <option value="">오전 전</option>
                <option value="">오전 후</option>
                <option value="">오후 전</option>
                <option value="">오후 후</option>
              </select>

              <!-- 날짜 -->
              <p>날짜 및 일시</p>
              <div class="form-group" style="width:200px; margin:5px;">
                <div class="input-group date" id="reservationdate1" data-target-input="nearest">
                    <input type="text" name="deadlineDate" class="form-control datetimepicker-input" data-target="#reservationdate1"/>
                    <div class="input-group-append" data-target="#reservationdate1" data-toggle="datetimepicker">
                        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                    </div>
                </div>
              </div>	

              <!-- 사유 -->
              <p>사유</p>
              <textarea name="content" cols="30" rows="10" placeholder="사유를 입력해주세요.">
              </textarea>


            </div>

          </ul>
          <input type="submit" value="기안 신청">
          <input type="button" onclick="ea_signup_back();" value="돌아가기">
          
          <!-- hidden values -->
          <input type="hidden" name="formTitle" value="${formValue.formTitle}">
          <input type="hidden" name="formYears" value="${formValue.formYears}">
          <input type="hidden" name="categoryNo" value="${formValue.categoryNo}">
          <input type="hidden" name="categoryName" value="${formValue.categoryName}">
          <input type="hidden" name="userNo" value="${loginUser.userNo}">
        </form>
      </div>
    </div>
  </div>
  
  <!-- layer -->
  <div id="approverLayer"> <!-- 결재자 -->
    <div>
      결재자 선택
    </div>
    <div>
      <c:forEach items="${deptValues}" var="dv">
        <div class="deptName">
          <span>${dv.departmentName}</span>
        </div>
        <c:forEach items="${userValues}" var="uv">
          <c:if test="${dv.departmentNo eq uv.departmentNo}">
            <div>
              <label>
                <span>${uv.name} ${uv.positionName}</span>
                <input type="radio" name="selectAprrover" id="selectAprrover" class="selectAprrover" value="${uv.userNo}" onclick="selectedApprover(this);">
              </label>
            </div>
          </c:if>
        </c:forEach>      	
      </c:forEach>
    </div>
    <div>
      <a onclick="closeSelectingApproverLayer();">취소</a>
      <a onclick="deliverSelectedApprover();">선택</a>
    </div>
  </div>

  <div id="referLayer"> <!-- 참조자 -->
    <div>
      참조자 선택
    </div>
    <div>
      <c:forEach items="${deptValues}" var="dv">
        <div class="deptName">
          <span>${dv.departmentName}</span>
        </div>
        <c:forEach items="${userValues}" var="uv">
          <c:if test="${dv.departmentNo eq uv.departmentNo}">
            <div>
              <label>
                <span>${uv.name} ${uv.positionName}</span>
                <input type="checkbox" name="selectRefer" class="selectRefer" value="${uv.userNo}" onclick="selectedRefer(this);">
              </label>
            </div>
          </c:if>
        </c:forEach>      	
      </c:forEach>
    </div>
    <div>
      <a onclick="closeSelectingReferLayer();">취소</a>
      <a onclick="deliverSelectedRefer()">선택</a>
    </div>
  </div>

  <div id="layer_bg"></div>
  
  
  
  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
  <!-- Icons library -->
  <script src="${pageContext.request.contextPath}/resources/plugins/feather.min.js"></script>
  
  <!-- Custom scripts -->
  <script src="${pageContext.request.contextPath}/resources/js/script.js"></script>

  <!-- InputMask -->
  <script src="${root}/resources/plugins/moment/moment.min.js"></script>
  <!-- date-range-picker -->
  <script src="${root}/resources/plugins/daterangepicker/daterangepicker.js"></script>
  <!-- Tempusdominus Bootstrap 4 -->
  <script src="${root}/resources/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
  
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

    // 결재자 (+) , (-) 최대 5명 최소 1명
    // 결재자 (+)
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
            name : "approverName",
            readonly : "true",
            required : "true",
            placeholder : "결재자 선택",
            onclick : "openSelectingApproverLayer(this);",
            required : "required"
          }).appendTo('#approverList');
          $('<input>', {
            type : "hidden",
            class : "hiddenAppr",
            name : "approverNo",
            required : "required"
          }).appendTo('#approverList');
          break;
        default: break;
        };
      } else {
        alert('상위 결재자는 최대 5명까지 설정 가능합니다!');
      }
    });
    // 결재자 (-)
    let minusApproverBtn = document.getElementById('minusApprover');
    minusApproverBtn.addEventListener('click', () => {
      let approverArr = document.getElementsByClassName('approver');
      let hiddenArr = document.getElementsByClassName('hiddenAppr');
      if(approverArr.length > 1) {
        switch (approverArr.length) {
        case approverArr.length:
          let count = approverArr.length - 1;
          approverArr[count].remove();
          hiddenArr[count].remove();
          break;
        default: break;
        };
      } else {
        alert('상위 결재자는 최소 1명 이상 필요합니다!');
      }
    });

    // 결재자
    // 창 block / none
    function openSelectingApproverLayer(e) {
      $('.approver').removeAttr('selected');
      $(e).attr('selected', 'selected');
      $('#approverLayer').show();
      $('#layer_bg').show();
    };
    function closeSelectingApproverLayer() {
      $('#approverLayer').hide();
      $('#layer_bg').hide();
    };
    // 선택된 결재자 checked 속성
    function selectedApprover(e) {
      $('.selectAprrover').removeAttr('checked');
      $(e).attr('checked', 'checked');
    };

    function deliverSelectedApprover() {
      $('#approverLayer').hide();
      $('#layer_bg').hide();
      let userNo = $('#approverLayer input[checked="checked"]').val();
      let userName = $('#approverLayer input[checked="checked"]').siblings().text();
      $('input[selected="selected"]').next('input').val(userNo);
      $('input[selected="selected"]').val(userName);
    };

    // 참조자 
    // 창 block / none
    function openSelectingReferLayer() {
      $('#referLayer').show();
      $('#layer_bg').show();
    };
    function closeSelectingReferLayer() {
      $('#referLayer').hide();
      $('#layer_bg').hide();
    };
    // 선택된 참조자 checked 속성
    function selectedRefer(e) {
      $(e).toggleClass('checkedRefer');
      $(e).siblings('span').toggleClass('checkedReferName');
    };
    // 참조자 선택
    function deliverSelectedRefer() {
      $('#referLayer').hide();
      $('#layer_bg').hide();
      // 참조자 이름을 표시할 textarea
      let referTextarea = document.getElementById('refer');
      // 선택된 참조자의 사원번호를 저장
      let referArr = document.getElementsByClassName('checkedRefer');
      // 선택된 참조자의 이름을 저장
      let referNameArr = document.getElementsByClassName('checkedReferName');
      // 선택을 바꿀때마다 textarea 초기화
      referTextarea.innerHTML = "";
      // 선택을 바꿀때마다 input:hidden 초기화
      $('input[name^="referNo"]').remove();
      // 선택된 참조자들 숫자만큼 반복문 실행해서 textarea에 이름 표시, input:hidden 만들어서 참조자 사원번호 저장
      for(let i = 0; i < referArr.length; i++) {
        if(i < (referArr.length - 1)) {
          referTextarea.innerHTML += referNameArr[i].textContent + ", ";
          $('<input>', {
            type : "hidden",
            name : "referNo",
            value : referArr[i].value
          }).appendTo('#referList');
        } else {
          referTextarea.innerHTML += referNameArr[i].textContent;
          $('<input>', {
            type : "hidden",
            name : "referNo",
            value : referArr[i].value
          }).appendTo('#referList');
        };
      };
    };

	  // Date picker
    $('#reservationdate').datetimepicker({
        format: 'L'
    });
    $('#reservationdate1').datetimepicker({
        format: 'L'
    });

    // 연차관련
    $('option[value="ALV_02"]').click(function() {
      alert('클릭');
      $('select[name="halfLv"]').attr('display', 'block');
    });
  </script>
</body>
</html>