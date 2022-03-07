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
                        <td><input type="text" name="docTitle" value="${docInfo.docTitle}"></td>
                    </tr>
                    <tr>
                        <th>상신 날짜</th>
                        <td>${docInfo.simpleMakeDate}</td>
                    </tr>
                    <tr>
                        <th>마감 날짜</th>
                        <td style="overflow: visible; display: flex; justify-content: center; border: none; border-right: 1px solid #262626;">
                            <div class="form-group" style="width:200px; margin:5px;">
                            <div class="input-group date" id="reservationdate" data-target-input="nearest">
                                <input type="text" name="docClose" class="form-control datetimepicker-input" data-target="#reservationdate"/>
                                <div class="input-group-append" data-target="#reservationdate" data-toggle="datetimepicker">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>
                            </div>
                        </div>	</td>
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
            <div>
                <textarea name="docContent" id="editor" placeholder="내용을 입력해주세요." required>
                    ${docInfo.docContent}
                </textarea>
            </div>
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
</script>
</body>
</html>