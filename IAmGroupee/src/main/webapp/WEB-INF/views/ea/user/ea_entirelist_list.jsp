<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>전자결재 > 전체문서조회 (리스트)</title>
  <!-- Favicon -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/svg/looo.png" type="image/x-icon">
  <!-- Custom styles -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.min.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ea/user/ea_entirelist.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
  <%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

  <div class="ea_wrapper">
    <div class="ea_entirelist_wrapper">
      <div class="ea_entirelist_title">
        <span>전체문서조회 (리스트)</span>
      </div>
      <div class="ea_entirelist_list_contents">
        <form action="${root}/ea/entirelistByFilter" method="POST" id="searchForm">
          <div style="width: 25%; float: right; margin: 15px; 
          border: 1px solid gainsboro; border-radius: 5px;" class="input-group input-group-sm">
            <input type="text" class="form-control" placeholder="문서 번호/제목을 입력해주세요.">
            <span class="input-group-append">
              <button type="submit" style="background: rgb(107, 177, 238); color: #fff;  
              border: 1px;" type="button" class="btn btn-info btn-flat">
                <i class="fa fa-search"></i>
              </button>
            </span>
          </div>
        </form>
        <!-- 제목 누르면 그냥 문서번호만 보내서 처리 -->
        <table>
          <thead>
            <tr>
              <th>문서 번호</th>
              <th>
                <span>양식 ▾</span>
                <ul>
                  <% int i = 1; %>
                  <c:forEach items="${formList}" var="fl">
                    <li>
                      <form action="${root}/ea/entirelistByFilter" method="POST" name="entirelistByFilterF<%=i%>">
                        <a href="javascript:entirelistByFilterF<%=i%>.submit()">${fl.formTitle}</a>
                        <input type="hidden" name="formNo" value="${fl.formNo}">
                      </form>
                    </li>
                    <% i++; %>
                  </c:forEach>
                </ul>
              </th>
            <th>문서 제목</th>
            <th>
              <span>상신 날짜 ▾</span>
              <ul>
                <li>
                  <form action="${root}/ea/entirelistByFilter" method="POST" name="entirelistByFilterM1">
                    <a href="javascript:entirelistByFilterM1.submit()">빠른순</a>
                    <input type="hidden" name="make" value="old">
                  </form>
                </li>
                <li>
                  <form action="${root}/ea/entirelistByFilter" method="POST" name="entirelistByFilterM2">
                    <a href="javascript:entirelistByFilterM2.submit()">늦은순</a>
                    <input type="hidden" name="make" value="new">
                  </form>
                </li>
              </ul>
            </th>
            <th>
              <span>마감 날짜 ▾</span>
              <ul>
                <li>
                  <form action="${root}/ea/entirelistByFilter" method="POST" name="entirelistByFilterC1">
                    <a href="javascript:entirelistByFilterC1.submit()">빠른순</a>
                    <input type="hidden" name="close" value="old">
                  </form>
                </li>
                <li>
                  <form action="${root}/ea/entirelistByFilter" method="POST" name="entirelistByFilterC2">
                    <a href="javascript:entirelistByFilterC2.submit()">늦은순</a>
                    <input type="hidden" name="close" value="new">
                  </form>
                </li>
              </ul>
            </th>
            <th>
              <span>부서 ▾</span>
              <ul>
                <% i = 1; %>
                <c:forEach items="${departmentList}" var="dl">
                  <li>
                    <form action="${root}/ea/entirelistByFilter" method="POST" name="entirelistByFilterD<%=i%>">
                      <a href="javascript:entirelistByFilterD<%=i%>.submit()">${dl.departmentName}</a>
                      <input type="hidden" name="departmentName" value="${dl.departmentName}">
                    </form>
                  </li>
                  <% i++; %>
                </c:forEach>
              </ul>
            </th>
          </tr>
        </thead>
        <tbody>
            <!-- for-each -->
            <form action="${root}/ea/entirelist/detail" method="POST" name="requestForm">
              <c:forEach items="${entireList}" var="el">
                <tr id="listContents">
                  <td>${el.docNo}</td>
                  <td>${el.formTitle}</td>
                  <td><a href="javascript:requestForm.submit()" class="ea_title">${el.docTitle}</a></td>
                  <td>${el.simpleMakeDate}</td>
                  <td>${el.simpleCloseDate}</td>
                  <td>${el.departmentName}</td>
                </tr>
              </c:forEach>
            </form>
          </tbody>
          </table>
        
        
        
        <div id="pagingBtn">
          <!-- 페이지 start -->
          <c:if test="${page ne null}">
            <ul>
              <c:if test="${page.startPage != 1}">
                <li><a href="${page.startPage - 1}">◁</a></li>
              </c:if>
              
              <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
                <c:if test="${page.currentPage != i and i <= page.lastPage}">
                  <li><a href="${root}/ea/entirelist/${i}">${i}</a></li>
                </c:if>
                <c:if test="${page.currentPage == i and i <= page.lastPage}">
                  <li style="background: #4081e4; color: #fff;">${i}</li>
                </c:if>
              </c:forEach>
              
              <c:if test="${page.endPage < page.lastPage}">
                <li><a href="${page.endPage + 1}">▷</a></li>
              </c:if>
            </ul>
          </c:if>
          <!-- 페이지 end -->
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
  $('.ea_entirelist_list_contents > table > thead > tr > th > span').click(function() {
    $(this).siblings("ul").toggleClass('active');
  });

  // 상세페이지 이동시 문서번호, 결재절차 데이터 추가
  $('.ea_title').click(function() {
    let process = $(this).parent().siblings().eq(4).text();
    let docNo = $(this).parent().parent().children().eq(0).text();
    $('<input>', {
      type : "hidden",
      name: "process",
      value : process
    }).appendTo('form[name="requestForm"]');
    $('<input>', {
      type : "hidden",
      name: "docNo",
      value : docNo
    }).appendTo('form[name="requestForm"]');
  });

  // 문서번호/제목 검색
  $('#searchForm').submit(function() {
    let keyword = $('#searchForm input').val();
    $('<input>', {
      type : "hidden",
      name: "keyword",
      value : keyword
    }).appendTo(this);
  });


</script>
</body>
</html> 