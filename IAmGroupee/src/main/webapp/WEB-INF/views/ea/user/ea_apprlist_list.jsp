<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>전자결재 > 결재문서조회 (리스트)</title>
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
        <span>결재문서조회 (리스트)</span>
      </div>
      <div class="ea_apprlist_list_contents">
        <!-- 제목 누르면 그냥 문서번호만 보내서 처리 -->
        <form action="apprlist/detail" method="POST" name="reuqestForm">
        <table>
          <thead>
            <tr>
              <th>문서 번호</th>
              <th>
                양식<span> ▾</span>
                <ul>
                <% int i = 1; %>
                <c:forEach items="${formList}" var="fl">
                  <li>
                    <a href="#">${fl.formTitle}</a>
                    <input type="hidden" name="formNo" value="${fl.formNo}">
                    </form>
                  </li>
                <% i++; %>
                </c:forEach>
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
                결재 분류<span> ▾</span>
                <ul>
                  <li><a href="#">중간 결재</a></li>
                  <li><a href="#">최종 결재</a></li>
                </ul>
              </th>
            </tr>
          </thead>
          <tbody>
            <!-- 여기에 if문으로 내 결재순서인 게시글만 걸러서 보여주기  -->
            <!-- for-each -->
            <form action="${root}/ea/apprlist/detail" method="POST" name="requestForm">
              <c:forEach items="${apprList}" var="al">
                <tr id="listContents">
                  <td>${al.docNo}</td>
                  <td>${al.formTitle}</td>
                  <td><a href="javascript:requestForm.submit()" class="ea_title">${al.docTitle}</a></td>
                  <td>${al.simpleMakeDate}</td>
                  <td>${al.simpleCloseDate}</td>
                  
                
                </tr>
              </c:forEach>
            </form>
          </tbody>
          </table>
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
  $('.ea_apprlist_list_contents > form > table > thead > tr > th > span').click(function() {
    $(this).siblings("ul").toggleClass('active');
  });

  // 임시 페이지 접근 코드
  $('.ea_title').click(function() {
    let x = $(this).parent().siblings().eq(4).text();
    $(this).parent().siblings().eq(4).html(x + '<input type="hidden" name="process" value="">');
    $(this).parent().siblings().eq(4).children().val(x);
  });

</script>
</body>
</html> 