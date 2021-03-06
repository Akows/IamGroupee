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
    <div class="ea_signuplist_wrapper">
      <div class="ea_signuplist_title">
        <span>기안문서조회 (리스트)</span>
      </div>
      <div class="ea_signuplist_list_contents">
        <button id="delBtn" onclick="del();">선택문서 삭제</button>
        <!-- 제목 누르면 그냥 문서번호만 보내서 처리 -->
        <table>
          <thead>
            <tr>
              <th><input type="checkbox"></th>
              <th>문서 번호</th>
              <th>
                <span>양식 ▾</span>
                <ul>
                  <% int i = 1; %>
                  <c:forEach items="${formList}" var="fl">
                    <li>
                      <form action="${root}/ea/signuplistByFilter" method="POST" name="signuplistByFilterF<%=i%>">
                        <a href="javascript:signuplistByFilterF<%=i%>.submit()">${fl.formTitle}</a>
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
                    <form action="${root}/ea/signuplistByFilter" method="POST" name="signuplistByFilterM1">
                      <a href="javascript:signuplistByFilterM1.submit()">빠른순</a>
                      <input type="hidden" name="make" value="old">
                    </form>
                  </li>
                  <li>
                    <form action="${root}/ea/signuplistByFilter" method="POST" name="signuplistByFilterM2">
                      <a href="javascript:signuplistByFilterM2.submit()">늦은순</a>
                      <input type="hidden" name="make" value="new">
                    </form>
                  </li>
                </ul>
              </th>
              <th>
                <span>마감 날짜 ▾</span>
                <ul>
                  <li>
                    <form action="${root}/ea/signuplistByFilter" method="POST" name="signuplistByFilterC1">
                      <a href="javascript:signuplistByFilterC1.submit()">빠른순</a>
                      <input type="hidden" name="close" value="old">
                    </form>
                  </li>
                  <li>
                    <form action="${root}/ea/signuplistByFilter" method="POST" name="signuplistByFilterC2">
                      <a href="javascript:signuplistByFilterC2.submit()">늦은순</a>
                      <input type="hidden" name="close" value="new">
                    </form>
                  </li>
                </ul>
              </th>
              <th>
                <span>진행 단계 ▾</span>
                <ul>
                  <li>
                    <form action="${root}/ea/signuplistByFilter" method="POST" name="signuplistByFilterP1">
                      <a href="javascript:signuplistByFilterP1.submit()">결재대기</a>
                      <input type="hidden" name="procSeq" value="1">
                    </form>
                  </li>
                  <li>
                    <form action="${root}/ea/signuplistByFilter" method="POST" name="signuplistByFilterP2">
                      <a href="javascript:signuplistByFilterP2.submit()">반려</a>
                      <input type="hidden" name="procSeq" value="2">
                    </form>
                  </li>
                  <li>
                    <form action="${root}/ea/signuplistByFilter" method="POST" name="signuplistByFilterP3">
                      <a href="javascript:signuplistByFilterP3.submit()">협의요청</a>
                      <input type="hidden" name="procSeq" value="3">
                    </form>
                  </li>
                </ul>
              </th>
            </tr>
          </thead>
          <tbody>
            <!-- for-each -->
            <form action="${root}/ea/signuplist/detail" method="POST" name="requestForm">
              <c:forEach items="${signupList}" var="sl">
                <tr id="listContents">
                  <td><input type="checkbox" class="checkbox-del" value="${sl.docNo}"></td>
                  <td>${sl.docNo}</td>
                  <td>${sl.formTitle}</td>
                  <td><a href="javascript:requestForm.submit()" class="ea_title">${sl.docTitle}</a></td>
                  <td>${sl.simpleMakeDate}</td>
                  <td>${sl.simpleCloseDate}</td>
                  
                  <c:forEach items="${processList}" var="pl" varStatus="vs">
                    <c:if test="${sl.docNo eq pl.docNo}">
                      <c:if test="${pl.procSeq eq 2}">
                      <td>반려</td>
                      </c:if>
                      <c:if test="${pl.procSeq eq 3}">
                      <td>협의요청</td>
                      </c:if>
                    </c:if>
                  </c:forEach>

                  <c:forEach items="${processList}" var="pl" varStatus="vs">
                    <c:if test="${sl.docNo eq pl.docNo}">
                      <!-- 그냥... 오버플로우 히든으로 가리자... -->
                      <c:if test="${pl.procSeq ne 2 || pl.procSeq ne 3}">
                        <td>결재대기</td>
                      </c:if>
                    </c:if>
                  </c:forEach>


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
                <li><a href="${root}/ea/signuplist/${i}">${i}</a></li>
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
  $('.ea_signuplist_list_contents > table > thead > tr > th > span').click(function() {
    $(this).siblings("ul").toggleClass('active');
  });

  // 상세페이지 이동시 문서번호, 결재절차 데이터 추가
  $('.ea_title').click(function() {
    let process = $(this).parent().siblings().eq(5).text();
    console.log(process);
    let docNo = $(this).parent().parent().children().eq(1).text();
    console.log(docNo);
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

  // 문서관리 체크 버튼
  // 상단 체크박스 클릭하면, 전체 체크박스 클릭되도록
  let topCheckBox = document.querySelector('thead input[type="checkbox"]');
  let delArr = document.getElementsByClassName('checkbox-del');
  
  topCheckBox.onchange = function(e) {
    if(this.checked) {
      // 상단 체크박스가 체크면 전부 다 체크
      // 모든 체크박스 다 가져오기, 그다음에 모든 체크박스 checkd값을 true로 바꿔주기
      // delArr 안의 요소 하나씩 꺼내와서 checked값을 true로 바꿔주기
      for(let i = 0; i < delArr.length; ++i) {
        delArr[i].checked = true;
      }
    } else {
      // 아니면 체크 해제
      for(let i = 0; i < delArr.length; ++i) {
        delArr[i].checked = false;
      }
    }
  };

  // 삭제하기 버튼 눌렀을 때
  function del() {
    if(confirm('선택하신 문서를 삭제하시겠습니까?')) {
      // 삭제할 번호 가져오기
      // 가져온 번호들을 하나의 문자열로 합치기
      let result = "";
      let delArr = document.getElementsByClassName('checkbox-del');
      
      for(let i = 0; i < delArr.length; ++i) {
        let t = delArr[i];
        if(t.checked) {
          result += t.value + ',';
        }
      }
      // 삭제 요청 보내기 (삭제할 번호 전달해주면서)
      $.ajax({
        url : "${root}/admin/ea/delete",
        data : {"str" : result},
        type : "post",
        success : function(data) {
          for(let i = 0; i < delArr.length; ++i) {
            let t = delArr[i];
            if(t.checked) {
              t.parentElement.parentElement.remove();
            }
          }
          alert('선택하신 문서가 삭제되었습니다!');
        },
        error : function(e) {
          alert(e);
        }
      });
      return true;
    } else {
      return false;
    }
    // 새로고침
    // window.location.reload();
  }

</script>
</body>
</html> 