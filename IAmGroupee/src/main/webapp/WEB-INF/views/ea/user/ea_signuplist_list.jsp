<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>전자결재 > 기안문서조회 (리스트)</title>
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
    <div class="ea_signuplist_list_wrapper">
      <div class="ea_signuplist_list_title">
        <span>기안문서조회 (리스트)</span>
      </div>
      <div class="ea_signuplist_list_contents">
        <form>
          <input type="search" name="" id="" placeholder="문서 제목을 입력하세요.">
          <table>
            <thead>
              <tr>
                <th>문서 번호</th>
                <th>
                  양식<span> ▾</span>
                  <ul>
                    <li><a href="#">양식1</a></li>
                    <li><a href="#">양식2</a></li>
                    <li><a href="#">양식3</a></li>
                  </ul>
                </th>
                <th>문서 제목</th>
                <th>
                  상신 날짜<span> ▾</span>
                  <ul>
                    <li><a href="#">빠른순</a></li>
                    <li><a href="#">늦은순</a></li>
                  </ul>
                </th>
                <th>
                  마감 날짜<span> ▾</span>
                  <ul>
                    <li><a href="#">빠른순</a></li>
                    <li><a href="#">늦은순</a></li>
                  </ul>
                </th>
                <th>
                  진행 단계<span> ▾</span>
                  <ul>
                    <li><a href="#">1차 결재</a></li>
                    <li><a href="#">2차 결재</a></li>
                    <li><a href="#">결재 완료</a></li>
                  </ul>
                </th>
              </tr>
            </thead>
            <tbody>
              <!-- for-each -->
              <tr>
                <td>1</td>
                <td>비품구매서</td>
                <td>무슨무슨 비품 구매로 무슨무슨 비품구매 신청</td>
                <td>2022-01-01</td>
                <td>2022-01-07</td>
                <td>1차 결재</td>
              </tr>
              <tr>
                <td>2</td>
                <td>비품구매서</td>
                <td>무슨무슨 비품 구매로 무슨무슨 비품구매 신청</td>
                <td>2022-01-01</td>
                <td>2022-01-07</td>
                <td>1차 결재</td>
              </tr>
              <tr>
                <td>3</td>
                <td>비품구매서</td>
                <td>무슨무슨 비품 구매로 무슨무슨 비품구매 신청</td>
                <td>2022-01-01</td>
                <td>2022-01-07</td>
                <td>1차 결재</td>
              </tr>
              <tr>
                <td>4</td>
                <td>비품구매서</td>
                <td>무슨무슨 비품 구매로 무슨무슨 비품구매 신청</td>
                <td>2022-01-01</td>
                <td>2022-01-07</td>
                <td>1차 결재</td>
              </tr>
              <tr>
                <td>5</td>
                <td>비품구매서</td>
                <td>무슨무슨 비품 구매로 무슨무슨 비품구매 신청</td>
                <td>2022-01-01</td>
                <td>2022-01-07</td>
                <td>1차 결재</td>
              </tr>
              <tr>
                <td>6</td>
                <td>비품구매서</td>
                <td>무슨무슨 비품 구매로 무슨무슨 비품구매 신청</td>
                <td>2022-01-01</td>
                <td>2022-01-07</td>
                <td>1차 결재</td>
              </tr>
              <tr>
                <td>7</td>
                <td>비품구매서</td>
                <td>무슨무슨 비품 구매로 무슨무슨 비품구매 신청</td>
                <td>2022-01-01</td>
                <td>2022-01-07</td>
                <td>1차 결재</td>
              </tr>
              <tr>
                <td>8</td>
                <td>비품구매서</td>
                <td>무슨무슨 비품 구매로 무슨무슨 비품구매 신청</td>
                <td>2022-01-01</td>
                <td>2022-01-07</td>
                <td>1차 결재</td>
              </tr>
              <tr>
                <td>9</td>
                <td>비품구매서</td>
                <td>무슨무슨 비품 구매로 무슨무슨 비품구매 신청</td>
                <td>2022-01-01</td>
                <td>2022-01-07</td>
                <td>1차 결재</td>
              </tr>
              <tr>
                <td>10</td>
                <td>비품구매서</td>
                <td>무슨무슨 비품 구매로 무슨무슨 비품구매 신청</td>
                <td>2022-01-01</td>
                <td>2022-01-07</td>
                <td>1차 결재</td>
              </tr>
            </tbody>
          </table>
        </form>
        <div id="ea_paging">
          <ul>
            <li><a href="#"><</a></li>
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">99</a></li>
            <li><a href="#">></a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>

  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
<!-- Icons library -->
<script src="${pageContext.request.contextPath}/resources/plugins/feather.min.js"></script>

<!-- Custom scripts -->
<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>

<script>
  $(".ea_signuplist_list_contents > form > table > thead > tr > th > span").click(function() {
    $(this).siblings("ul").toggleClass('active');
  });
</script>
</body>
</html>