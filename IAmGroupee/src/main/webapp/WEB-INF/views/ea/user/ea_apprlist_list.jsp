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
            
            <!-- for-each -->
            <form action="${root}/ea/apprlist/detail" method="POST" name="requestForm">
              <c:forEach items="${apprList}" var="al">
	            
                <tr id="listContents">
                  <td>${al.docNo}</td>
                  <td>${al.formTitle}</td>
                  <td>
                    <a href="javascript:requestForm.submit()" class="ea_title">${al.docTitle}</a>
                  </td>
                  <td>${al.simpleMakeDate}</td>
                  <td>${al.simpleCloseDate}</td>
                 	
                  <c:forEach items="${processListForApprUser}" var="pl">
                  <c:if test="${(al.docNo eq pl.docNo) && (pl.procSep eq pl.procCnt)}">
                  <td>최종 결재</td>                  
                  </c:if>
                  </c:forEach>
                  <c:forEach items="${processListForApprUser}" var="pl">
                  <c:if test="${(al.docNo eq pl.docNo) && (pl.procSep eq 1)}">
                  <td>1차 결재</td>
                  </c:if>
                  <c:if test="${(al.docNo eq pl.docNo) && (pl.procSep eq 2)}">
                  <td>2차 결재</td>
                  </c:if>
                  <c:if test="${(al.docNo eq pl.docNo) && (pl.procSep eq 3)}">
                  <td>3차 결재</td>
                  </c:if>
                  <c:if test="${(al.docNo eq pl.docNo) && (pl.procSep eq 4)}">
                  <td>4차 결재</td>
                  </c:if>
                  </c:forEach>
                </tr>
                
              </c:forEach>
            </form>
          </tbody>
        </table>

        <div id="pagingBtn">
          <!-- 페이지 start -->
          <ul>
            <c:if test="${page.startPage != 1}">
              <li><a href="${page.startPage - 1}">◁</a></li>
            </c:if>
            
            <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
              <c:if test="${page.currentPage != i and i <= page.lastPage}">
                <li><a href="${root}/ea/apprlist/${i}">${i}</a></li>
              </c:if>
              <c:if test="${page.currentPage == i and i <= page.lastPage}">
                <li style="background: #4081e4; color: #fff;">${i}</li>
              </c:if>
            </c:forEach>
            
            <c:if test="${page.endPage < page.lastPage}">
              <li><a href="${page.endPage + 1}">▷</a></li>
            </c:if>
          </ul>
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
  $('.ea_apprlist_list_contents > table > thead > tr > th > span').click(function() {
    $(this).siblings("ul").toggleClass('active');
  });



  // 상세페이지 이동시 문서번호, 결재절차 데이터 추가
  $('.ea_title').click(function() {
    let docNo = $(this).parent().parent().children().eq(0).text();
    $('<input>', {
      type : "hidden",
      name: "docNo",
      value : docNo
    }).appendTo('form[name="requestForm"]');
  });

</script>
</body>
</html> 