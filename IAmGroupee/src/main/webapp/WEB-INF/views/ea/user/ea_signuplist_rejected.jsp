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
        <span>기안문서조회 (반려문서 수정)</span>
      </div>
      <div class="ea_signuplist_rejected_contents">
        <form action="" method="POST" name="reuqestForm">
            <!-- 문서 좌상단 문서 정보 -->
            <div>
                <table>
                    <tr>
                        <th>문서 번호 : </th>
                        <td>1</td>
                    </tr>
                    <tr>
                        <th>문서 제목 : </th>
                        <td><input type="text" name="" id="" value="원래 제목" style="width: 300px;"></td>
                    </tr>
                    <tr>
                        <th>양식 : </th>
                        <td>비품구매서</td>
                    </tr>
                    <tr>
                        <th>상신 날짜 : </th>
                        <td>2022-02-22</td>
                    </tr>
                    <tr>
                        <th>마감 날짜 : </th>
                        <td><input type="date" name="" id=""></td>
                    </tr>
                    <tr>
                        <th>진행 단계 : </th>
                        <td colspan="2">반려(사유 : 너무 비싸잉~~~~~~~)</td>
                    </tr>
                    <tr>
                        <th>보안 등급 : </th>
                        <td>A</td>
                    </tr>
                </table>
            </div>
            <!-- 문서 우상단 문서 결재자 -->
            <div>
                <table>
                    <tr>
                        <th>기안자</th>
                        <th>중간 결재자</th>
                        <th>최종 결재자</th>
                    </tr>
                    <tr>
                        <td>알파포대</td>
                        <td>브라보포대</td>
                        <td>HQ</td>
                    </tr>
                    <tr>
                        <td>일병 이종훈</td>
                        <td>중사 이종훈</td>
                        <td>대위 이종훈</td>
                    </tr>
                    <tr>
                        <td>🐶</td>
                        <td>🐧</td>
                        <td>🦁</td>
                    </tr>
                </table>
            </div>
            <!-- 문서 중앙 문서 내용 -->
            <div>
                <textarea name="content" id="editor" placeholder="내용을 입력해주세요." required>
                </textarea>
            </div>
            <div>
                <a href="javascript:reuqestForm.submit()">재기안 하기</a>
                <a href="/iag/ea/signuplist">목록으로</a>
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
    ClassicEditor
    .create( document.querySelector( '#editor' ) )
    .catch( error => {
      console.error( error );
    } );
</script>
</body>
</html>