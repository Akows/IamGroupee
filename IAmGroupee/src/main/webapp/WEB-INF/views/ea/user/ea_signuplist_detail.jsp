<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>전자결재 > 기안문서조회 (문서상세)</title>
  <!-- Favicon -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/svg/looo.png" type="image/x-icon">
  <!-- Custom styles -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.min.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ea/user/ea_signuplist.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
  <%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

  <div class="ea_wrapper">
    <div class="ea_signuplist_wrapper">
      <div class="ea_signuplist_title">
        <span>기안문서조회 (문서상세)</span>
      </div>
      <div class="ea_signuplist_detail_contents">
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
        <div id="docContents">
            <!-- 텍스트 에디터 저장된 html 코드 -->
            ${docInfo.docContent}
            <!-- 텍스트 에디터 저장된 html 코드 -->
        </div>
        <div>
            <a href="/iag/ea/signuplist">목록으로</a>
        </div>
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