<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>전자결재 > 결재문서조회 (문서상세)</title>
  <!-- Favicon -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/svg/looo.png" type="image/x-icon">
  <!-- Custom styles -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.min.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ea/user/ea_apprlist.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
  <%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

  <div class="ea_wrapper">
    <div class="ea_apprlist_wrapper">
      <div class="ea_apprlist_title">
        <span>결재문서조회 (문서상세)</span>
      </div>
      <div class="ea_apprlist_detail_contents">
        <form action="process" method="POST" name="reuqestForm">
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
                    <td>${docInfo.docTitle}</td>
                </tr>
                <tr>
                    <th>상신 날짜</th>
                    <td>${docInfo.simpleMakeDate}</td>
                </tr>
                <tr>
                    <th>마감 날짜</th>
                    <td>${docInfo.simpleCloseDate}</td>
                </tr>
                <tr>
                    <th>보안 등급</th>
                    <td>${docInfo.docSlv}등급</td>
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
                    <input type="hidden" value="${pl.userNo}">
                    </c:forEach>
                </tr>
                <tr>
                    <td><span id="stamp1">상신</span></td>
                    <c:forEach items="${processList}" var="pl" begin="0" step="1" end="${processList[0].procCnt}" varStatus="vs">
                    <c:if test="${(pl.procSeq eq 0) && (loginUserNo eq pl.userNo)}">
                        <c:if test="${pl.procSep eq docInfo.docStage}">
                            <td>
                                <a id="processBtn" onclick="layer_open();">결재처리</a>
                            </td>
                        </c:if>
                        <c:if test="${pl.procSep ne docInfo.docStage}">
                        <td>
                            <span class="waitApprv">결재대기</span>
                        </td>
                        </c:if>
                    </c:if>
                    <c:if test="${(pl.procSeq eq 0) && (loginUserNo ne pl.userNo)}">
                        <td>
                            <span class="waitApprv">결재대기</span>
                        </td>                    
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
        <c:if test="${docInfo.lvCheck eq null}">
            <!-- 문서 중앙 문서 내용 -->
            <div id="docContents">
                <!-- 텍스트 에디터 저장된 html 코드 -->
                ${docInfo.docContent}
                <!-- 텍스트 에디터 저장된 html 코드 -->
            </div>
        </c:if>
        <!-- 연차기안일때 -->
        <c:if test="${docInfo.lvCheck eq 'A'}">
            <div id="docContentsLv">
                <table>
                    <tr>
                        <th>연차코드</th>
                        <td>${docInfo.lvCode}</td>
                    </tr>
                    <tr>
                        <th>사용날짜</th>
                        <td>${docInfo.simpleStartDate}</td>
                    </tr>
                    <tr>
                        <th>사유</th>
                        <td>${docInfo.alvReason}</td>
                    </tr>
                </table>
            </div>
        </c:if>
        <!-- 휴가기안일때 -->
        <c:if test="${docInfo.lvCheck eq 'B'}">
            <div id="docContentsLv">
                <table>
                    <tr>
                        <th>휴가코드</th>
                        <td>${docInfo.lvCode}</td>
                    </tr>
                    <tr>
                        <th>사용기간</th>
                        <td>${docInfo.simpleStartDate} - ${docInfo.simpleEndDate}</td>
                    </tr>
                    <tr>
                        <th>사유</th>
                        <td>${docInfo.lvReason}</td>
                    </tr>
                </table>
            </div>
        </c:if>
        <div>
            <c:forEach items="${processList}" var="pl">
            <c:if test="${(pl.procSeq eq 0) && (loginUserNo eq pl.userNo) && (pl.procSep eq docInfo.docStage)}">
                <a href="javascript:reuqestForm.submit()" onclick="return ea_appr_submit();">결재 진행</a>
            </c:if>
            </c:forEach>
            <a href="/iag/ea/apprlist">목록으로</a>
        </div>
      </div>
      <input type="hidden" name="docNo" value="${docInfo.docNo}">
      <input type="hidden" name="procNo" value="${docInfo.procNo}">
      <input type="hidden" name="userNo" value="${loginUserNo}">
      </form>
    </div>
  </div>

  <!-- layer -->
  <div id="layer">
    <div>결재처리 선택</div>
    <label><input type="radio" name="processType" value="1" onclick="reasonInActive();">승인</label>
    <label><input type="radio" name="processType" value="2" onclick="reasonActive();">반려</label>
    <label><input type="radio" name="processType" value="3" onclick="reasonActive();">협의요청</label>
    <!-- 전결 문서 아닐시 비활성화 -->
    <label><input type="radio" name="processType" value="4" onclick="reasonInActive();">전결</label>
    <textarea name="reason" id="reason" rows="10" placeholder="사유를 작성해주세요."></textarea>
    <div class="btn">
        <input type="button" value="확인" onclick="ea_process_select();">
        <input type="button" value="취소" onclick="layer_close();">
    </div>
  </div>
  <div id="layer_bg"></div>

  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
<!-- Icons library -->
<script src="${pageContext.request.contextPath}/resources/plugins/feather.min.js"></script>

<!-- Custom scripts -->
<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>

<script>
    function layer_open() {
      document.getElementById('layer').style.display = 'block';
      document.getElementById('layer_bg').style.display = 'block';
    }
    function layer_close() {
      document.getElementById('layer').style.display = 'none';
      document.getElementById('layer_bg').style.display = 'none';
    }
    function reasonActive() {
        $("#reason").addClass('active');
    }
    function reasonInActive() {
        $("#reason").removeClass('active');
    }
    function ea_appr_submit() {
        if(confirm('결재를 진행하시겠습니까?')) {
        return true;
        } else {
        return false;
        }
    }
    function ea_process_select() {
        // 체크된 결재 처리 사항과 사유의 value값 저장
        let pn = $("input:radio[name=processType]:checked").val();
        let pr = $("textarea[name=reason]").val();

        // 이미 추가됐을수도 있으니 input태그 지워줌
        $("form > input:last").remove();
        $("form > input:last").remove();

        // 결재 처리 value 넘길 input:hidden 태그 form안에 생성
        $("<input>", {
            type : "hidden",
            name : "procSeq",
            value : pn
        }).appendTo("form[name=reuqestForm]");
        $("<input>", {
            type : "hidden",
            name : "procRejected",
            value : pr
        }).appendTo("form[name=reuqestForm]");

        // 결재처리 버튼 지우고 처리 상태로 바꿔줌
        let processIn = $('#processBtn').parent();
        if(pn == 1) {
            $('<span>', {
                id : "stamp2"
            }).text('승인').appendTo(processIn);
        } else if(pn == 2) {
            $('<span>', {
                id : "stamp3"
            }).text('반려').appendTo(processIn);
        } else if(pn == 3) {
            $('<span>', {
                id : "stamp4"
            }).text('협요').appendTo(processIn);
        } else if(pn == 4) {
            $('<span>', {
                id : "stamp5"
            }).text('전결').appendTo(processIn);
            $('.waitApprv').text('');
            $('.waitApprv').css('border', 'none');
            $('.waitApprv').parent().html('🌏');
        }
        $("#stamp").css("display", "inline");
        $("a[onclick^=l]").remove();

        // 창 닫기
        document.getElementById('layer').style.display = 'none';
        document.getElementById('layer_bg').style.display = 'none';
    }
</script>
</body>
</html>