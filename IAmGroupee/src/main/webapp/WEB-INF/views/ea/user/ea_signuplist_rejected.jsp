<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>전자결재 > 기안문서조회 (반려문서 수정)</title>
  <!-- Favicon -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/svg/looo.png" type="image/x-icon">
  <!-- Custom styles -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.min.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ea/user/ea_signuplist.css">

  <!-- text editor -->
  <script src="https://cdn.ckeditor.com/ckeditor5/32.0.0/classic/ckeditor.js"></script>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
  <%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

  <div class="ea_wrapper">
    <div class="ea_signuplist_wrapper_rejected">
      <div class="ea_signuplist_title">
        <span>기안문서조회 (반려/협의요청 문서)</span>
      </div>
      <div class="ea_signuplist_rejected_contents">
        <form action="${root}/ea/reSignup" method="POST" name="reuqestForm">
            <!-- 문서 좌상단 문서 정보 -->
            <div>
                <table>
                    <tr>
                        <th>양식</th>
                        <td>${docInfo.formTitle}</td>
                    </tr>
                    <tr>
                        <th>문서 번호</th>
                        <td>${docInfo.docNo}</td>
                    </tr>
                    <tr>
                        <th>문서 제목</th>
                        <td>
                            <input class="form-control form-control-sm" type="text" name="docTitle" placeholder="문서 제목을 입력해주세요." value="${docInfo.docTitle}">
                        </td>
                    </tr>
                    <tr>
                        <th>상신 날짜</th>
                        <td>${docInfo.simpleMakeDate}</td>
                    </tr>
                    <tr>
                        <th>마감 날짜</th>
                        <td style="overflow: visible; display: flex; justify-content: center; border: none; border-right: 1px solid gainsboro;">
                            <div class="form-group" style="width:200px; margin:5px;">
                                <div class="input-group date" id="reservationdate" data-target-input="nearest">
                                    <input type="text" name="docClose" class="form-control datetimepicker-input" data-target="#reservationdate"/>
                                    <div class="input-group-append" data-target="#reservationdate" data-toggle="datetimepicker">
                                        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                    </div>
                                </div>
                            </div>	
                        </td>
                    </tr>
                    <tr>
                        <th>보안 등급</th>
                        <td>${docInfo.docSlv}등급</td>
                    </tr>
                    <tr>
                        <th>반려/협의요청 사유</th>
                        <td>${docInfo.procRejected}</td>
                    </tr>
                </table>
            </div>
            <!-- 문서 우상단 문서 결재자 -->
            <div>
                <table>
                    <tr>
                        <th>기안자</th>
                        <c:forEach items="${processList}" var="pl" begin="0" step="1" end="${processList[0].procCnt}" varStatus="vs">
                        <c:if test="${!vs.last}">
                        <th>${vs.count}차 결재자</th>
                           </c:if>
                           <c:if test="${vs.last}">
                        <th>최종 결재자</th>
                           </c:if>
                        </c:forEach>
                    </tr>
                    <tr>
                        <td>${docInfo.departmentName}</td>
                        <c:forEach items="${processList}" var="pl">
                        <td>${pl.departmentName}</td>
                        </c:forEach>
                    </tr>
                    <tr>
                        <td>${docInfo.positionName} ${docInfo.name}</td>
                        <c:forEach items="${processList}" var="pl">
                        <td>${pl.positionName} ${pl.name}</td>
                        </c:forEach>
                    </tr>
                    <tr>
                        <td><span id="stamp1">상신</span></td>
                        <c:forEach items="${processList}" var="pl" begin="0" step="1" end="${processList[0].procCnt}" varStatus="vs">
                        <c:if test="${pl.procSeq eq 0}">
                        <td><span class="waitApprv">결재대기</span></td>                    
                        </c:if>
                        <c:if test="${pl.procSeq eq 1}">
                        <td><span id="stamp2">승인</span></td>
                        </c:if>
                        <c:if test="${pl.procSeq eq 2}">
                        <td><span id="stamp3">반려</span></td>
                        </c:if>
                        <c:if test="${pl.procSeq eq 3}">
                        <td><span id="stamp4">협의</span></td>
                        </c:if>
                        </c:forEach>
                    </tr>
                </table>
            </div>
            <!-- 문서 중앙 문서 내용 -->
            <c:if test="${(docInfo.lvCheck ne 'A') && (docInfo.lvCheck ne 'B')}">
                <div>
                    <textarea name="docContent" id="editor" placeholder="내용을 입력해주세요." required>
                        ${docInfo.docContent}
                    </textarea>
                </div>
            </c:if>
            <!-- 연차기안일경우 -->
            <c:if test="${docInfo.lvCheck eq 'A'}">
                <div id="lvWrap">
              
                    <!-- 연차/휴가 구분 -->
                    <input type="hidden" name="lvCheck" value="A">
      
                    <!-- 연차종류 value="ALV_XX" 연차코드 -->
                    <p>🏖&ensp;연차 종류</p>
                    <select name="lvCode" onchange="halfBtn(this);">
                      <option value="ALV_01">일차</option>
                      <option value="ALV_02">반차</option>
                      <option value="ALV_03">반반차</option>
                    </select>
      
                    <!-- 반차 선택시 -->
                    <select name="halfLv">
                      <option value="morning">오전</option>
                      <option value="afternoon">오후</option>
                    </select>
      
                    <!-- 반반차 선택시 -->
                    <select name="halfNhalfLv">
                      <option value="morningB">오전 전</option>
                      <option value="morningA">오전 후</option>
                      <option value="afternoonB">오후 전</option>
                      <option value="afternoonA">오후 후</option>
                    </select>
      
                    <!-- 날짜 -->
                    <p>⏰&ensp;날짜 및 일시</p>
                    <div class="form-group" style="width:200px; margin:5px;">
                      <div class="input-group date" id="reservationdate1" data-target-input="nearest">
                          <input type="text" name="alvStart" class="form-control datetimepicker-input" data-target="#reservationdate1"/>
                          <div class="input-group-append" data-target="#reservationdate1" data-toggle="datetimepicker">
                              <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                          </div>
                      </div>
                    </div>	
      
                    <!-- 사유 -->
                    <p>😏&ensp;사유</p>
                    <textarea name="alvReason" cols="30" rows="3" placeholder="사유를 입력해주세요."></textarea>
      
      
                  </div>
            </c:if>
            <!-- 휴가기안일경우 -->
            <c:if test="${docInfo.lvCheck eq 'B'}">
                <div id="lvWrap">
              
                    <!-- 연차/휴가 구분 A:연차 B:휴가 -->
                    <input type="hidden" name="lvCheck" value="B">
      
                    <!-- 연차종류 value="ALV_XX" 연차코드 -->
                    <p>🏖&ensp;휴가 종류</p>
                    <select name="lvCode" onchange="halfBtn(this);">
                      <option value="LV_01">병가</option>
                      <option value="LV_02">경조사</option>
                      <option value="LV_03">여름휴가</option>
                      <option value="LV_04">출산전후휴가</option>
                      <option value="LV_05">육아휴가</option>
                      <option value="LV_06">예비군</option>
                    </select>
      
                    <!-- 반차 선택시 -->
                    <select name="halfLv">
                      <option value="morning">오전</option>
                      <option value="afternoon">오후</option>
                    </select>
      
                    <!-- 반반차 선택시 -->
                    <select name="halfNhalfLv">
                      <option value="morningB">오전 전</option>
                      <option value="morningA">오전 후</option>
                      <option value="afternoonB">오후 전</option>
                      <option value="afternoonA">오후 후</option>
                    </select>
      
                    <!-- 날짜 -->
                    <p>⏰&ensp;날짜 및 일시</p>
                    <div class="form-group" style="width:290px;">
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text">
                            <i class="far fa-calendar-alt"></i>
                          </span>
                        </div>
                        <input type="text" name="leavePeriod" class="form-control float-right" id="reservation">
                      </div>
                      <!-- /.input group -->
                    </div>
      
                    <!-- 사유 -->
                    <p>😏&ensp;사유</p>
                    <textarea name="lvReason" cols="30" rows="3" placeholder="사유를 입력해주세요."></textarea>
      
      
                  </div>
            </c:if>
            <div>
                <a href="javascript:reuqestForm.submit()"  onclick="return confirmCheck();">재기안 하기</a>
                <a href="/iag/ea/signuplist" onclick="return deleteSignupDoc();">삭제하기</a>
                <a href="/iag/ea/signuplist">목록으로</a>
                
                <input type="hidden" name="procNo" value="${docInfo.procNo}">
                <input type="hidden" name="docNo" value="${docInfo.docNo}">

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

<!-- InputMask -->
<script src="${root}/resources/plugins/moment/moment.min.js"></script>
<!-- date-range-picker -->
<script src="${root}/resources/plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="${root}/resources/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>

<link rel="stylesheet" href="${root}/resources/plugins/daterangepicker/daterangepicker.css">

<script>
    ClassicEditor
    .create( document.querySelector( '#editor' ) )
    .catch( error => {
      console.error( error );
    } );

    //Date picker
    $('#reservationdate').datetimepicker({
        format: 'L'
    });
    $('#reservationdate1').datetimepicker({
        format: 'L'
    });
    $('#reservation').daterangepicker();

    // 문서 삭제
    function deleteSignupDoc() {
        if(confirm('문서를 삭제하시겠습니까?')) {

            $.ajax({
                url : "${root}/ea/deleteSignupDoc",
                method : "GET",
                data : {
                    docNo : '<c:out value="${docInfo.docNo}"/>'
                },
                succcess : function(result) {
                    console.log(result);
                },
                error : function(e) {
                    console.log(e);
                }
            });

            return true;
        } else {
            return false;
        }
    }

    function confirmCheck() {
        if(confirm('기안서를 다시 제출하시겠습니까?')) {
            return true;
        } else {
            return false;
        }
    }

    // 연차관련
    // 반차/반반차 선택시 오전 오후 선택 태그 나오게
    function halfBtn(e) {
      let value = $(e).val();
      if(value === 'ALV_02') {
        $('select[name="halfNhalfLv"]').css('display', 'none');
        $('select[name="halfLv"]').css('display', 'inline-block');
      } else if(value === 'ALV_03') {
        $('select[name="halfLv"]').css('display', 'none');
        $('select[name="halfNhalfLv"]').css('display', 'inline-block');
      } else {
        $('select[name="halfLv"]').css('display', 'none');
        $('select[name="halfNhalfLv"]').css('display', 'none');
      }
    };
</script>
</body>
</html>