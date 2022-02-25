<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>전자결재 > 기본설정 / 양식관리</title>
  <!-- Favicon -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/svg/looo.png" type="image/x-icon">
  <!-- Custom styles -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.min.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ea/admin/ea_settings.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
  <%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

  <div class="ea_wrapper">
    <div class="ea_settings_wrapper">
      <div class="ea_settings_title">
        <ul>
            <li class="active"><a href="#">기본설정</a></li>
            <li><a href="#">양식관리</a></li>
            <li><a href="#">전체문서</a></li>
            <li><a href="#">삭제문서</a></li>
        </ul>
      </div>
      <div class="ea_settings_list_contents">
        <!---------------------- 기본설정 탭 ---------------------->
        <div>
          <form action="" method="">
            <table>
              <thead>
                <tr>
                  <th colspan="2">보안 등급별 열람 설정</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>S등급</td>
                  <td>기안 상에 설정한 관련자들만 문서 열람</td>
                </tr>
                <tr>
                  <td>A등급</td>
                  <td>최종 승인 후 직위 
                    <select name="gradeA" id="gradeA">
                      <!-- 직위 테이블에서 가져온 직위 데이터 넣기 -->
                      <!-- 직급은 변동이 가능하니.. default값이 있어야..? 그렇다면 직급 추가나 수정시에 문서열람등급 테이블도 디폴트 값으로 바꿔줘야 할 듯..? 테이블에 저장된 값이 처음에 체크된 상태로 -->
                      <c:forEach items="${positionValues}" var="pv">
	                      <option value="pv.positionLevel">${pv.positionLevel}등급(${pv.positionName})</option>
                      </c:forEach>
                    </select>
                    이상 기본 열람</td>
                  </tr>
                  <tr>
                    <td>B등급</td>
                    <td>최종 승인 후 직위 
                      <select name="gradeB" id="gradeB">
                        <!-- 직위 테이블에서 가져온 직위 데이터 넣기 -->
                        <!-- 직급은 변동이 가능하니.. default값이 있어야..? 그렇다면 직급 추가나 수정시에 문서열람등급 테이블도 디폴트 값으로 바꿔줘야 할 듯..? 테이블에 저장된 값이 처음에 체크된 상태로 -->
                        <c:forEach items="${positionValues}" var="pv">
	                      <option value="pv.positionLevel">${pv.positionLevel}등급(${pv.positionName})</option>
                        </c:forEach>
                      </select>
                      이상 기본 열람</td>
                    </tr>
                    <tr>
                      <td>C등급</td>
                      <td>모든 임직원 열람 가능</td>
                    </tr>
                    <tr>
                      <td colspan="2">💙 S등급과 C등급은 설정할 수 없습니다.</td>
                    </tr>
              </tbody>
            </table>
            <table>
              <thead>
                <tr>
                  <th colspan="2">문서 번호 포맷 설정</th>
                  <!-- 저장된 설정값들이 선택된 상태로 실행되도록 -->
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>연도 설정</td>
                  <td id="wrapY">
                    <select name="formatY" id="formatY" onchange="changeFormatY();">
                      <option value="1">YYMMDD</option>
                      <option value="2">YYMD</option>
                      <option value="3">YYYYMMDD</option>
                      <option value="4">YYYYMD</option>
                    </select>
                    <span>&emsp;&emsp;->&emsp;&emsp;ex)&emsp;</span>
                    <span id="valueY"></span>
                  </td>
                </tr>
                <tr>
                  <td>부서 설정</td>
                  <td id="wrapD">
                    <select name="formatD" id="formatD"  onchange="changeFormatD();">
                      <option value="1">부서 번호</option>
                      <option value="2">부서 이름</option>
                    </select>
                    <span>&emsp;&emsp;->&emsp;&emsp;ex)&emsp;</span>
                    <span id="valueD"></span>
                  </td>
                </tr>
                <tr>
                  <td>양식 설정</td>
                  <td id="wrapF">
                    <select name="formatF" id="formatF" onchange="changeFormatF();">
                      <option value="1">양식 번호</option>
                      <option value="2">양식 이름</option>
                    </select>
                    <span>&emsp;&emsp;->&emsp;&emsp;ex)&emsp;</span>
                    <span id="valueF"></span>
                  </td>
                </tr>
                <tr>
                  <td>포맷 확인</td>
                  <td id="wrapA">
                    <span></span>
                    <span></span>
                    <span></span>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">💙 문서 끝번호는 기안 작성시 자동 설정됩니다.</td>
                </tr>
              </tbody>
            </table>
            <input type="submit" value="설정 저장">
          </form>
        </div>


        <!---------------------- 양식관리 탭 ---------------------->
        <div>
          <form action="editform" method="GET">
            <!-- category -->
            <div>
              <div><span>🗂 카테고리</span></div>
              <select name="category" size="15">
                <option value="밸류가지고오기">카테고리 1</option>
                <option value="밸류가지고오기">카테고리 2</option>
                <option value="밸류가지고오기">카테고리 3</option>
                <option value="밸류가지고오기">카테고리 4</option>
                <option value="밸류가지고오기">카테고리 5</option>
                <option value="밸류가지고오기">카테고리 6</option>
              </select>
              <div>
                <span id="categoryM">-</span>
                <span id="categoryP">+</span>
              </div>
            </div>
            <!-- form -->
            <div>
              <div><span>🧾 양식</span></div>
              <select name="category" size="15">
                <option value="밸류가지고오기">양식 1</option>
                <option value="밸류가지고오기">양식 2</option>
                <option value="밸류가지고오기">양식 3</option>
                <option value="밸류가지고오기">양식 4</option>
                <option value="밸류가지고오기">양식 5</option>
                <option value="밸류가지고오기">양식 6</option>
              </select>
              <div>
                <span id="formM">-</span>
                <span id="formP">+</span>
              </div>
            </div>
            <!-- preview -->
            <div>
              <div><span>🔍 양식 미리보기</span></div>
              <article>
                <!-- DB에 저장한 양식 하단에 불러오기 -->
            <h1>이종훈</h1>
            <table border="1">
              <tr>
                <td>이종훈이종훈이종훈이종훈이종훈이종훈이종훈이종훈이종훈이종훈이종훈</td>
                <td>이종훈</td>
                <td>이종훈</td>
              </tr>
              <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
              </tr>
              <tr>
                <td>가</td>
                <td>나</td>
                <td>다</td>
              </tr>
              <tr>
                <td>가</td>
                <td>나</td>
                <td>다</td>
              </tr>
              <tr>
                <td>가</td>
                <td>나</td>
                <td>다</td>
              </tr>
              <tr>
                <td>가</td>
                <td>나</td>
                <td>다</td>
              </tr>
              <tr>
                <td>가</td>
                <td>나</td>
                <td>다</td>
              </tr>
              <tr>
                <td>가</td>
                <td>나</td>
                <td>다</td>
              </tr>
              <tr>
                <td>가</td>
                <td>나</td>
                <td>다</td>
              </tr>
              <tr>
                <td>가</td>
                <td>나</td>
                <td>다</td>
              </tr>
              <tr>
                <td>가</td>
                <td>나</td>
                <td>다</td>
              </tr>
              <tr>
                <td>가</td>
                <td>나</td>
                <td>다</td>
              </tr>
              <tr>
                <td>가</td>
                <td>나</td>
                <td>다</td>
              </tr>
              <tr>
                <td>가</td>
                <td>나</td>
                <td>다</td>
              </tr>
            </table>
              </article>
            </div>
            
            <span id="arrow1">=></span>
            <span id="arrow2">=></span>
            <input type="submit" value="양식 수정하기" id="editFormBtn">
          </form>
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
        // 기본설정 / 양식관리 탭
        let tabBtn = $(".ea_settings_title > ul > li");
        let tabCont = $(".ea_settings_list_contents > div");

        tabCont.hide().eq(0).show();

        tabBtn.click(function(e) {
            e.preventDefault();
            let target = $(this);
            let index = target.index();

            tabBtn.removeClass('active');
            target.addClass('active');
            tabCont.css('display', 'none');
            tabCont.eq(index).css('display', 'block');
        })

        // 문서 번호 포맷
        function changeFormatY() {
          let today = new Date();
          let year = (today.getYear()-100).toString();
          let year1 = today.getFullYear().toString();
          let month = (today.getMonth() + 1) > 9 ? (today.getMonth() + 1).toString() : "0" + (today.getMonth() + 1).toString();
          let month1 = (today.getMonth() + 1).toString();
          let date = (today.getDate() > 9) ? today.getDate().toString() : "0" + today.getDate().toString();
          let date1 = today.getDate().toString();
          const todayFormat1 = year + month + date;
          const todayFormat2 = year + month1 + date1;
          const todayFormat3 = year1 + month + date;
          const todayFormat4 = year1 + month1 + date1;

          let y = $('#formatY').val();
          if(y == 1) {
            $('#valueY').html(todayFormat1);
            $('#wrapA > span:nth-child(1)').html(todayFormat1 + "-");
          } else if(y == 2) {
            $('#valueY').html(todayFormat2);
            $('#wrapA > span:nth-child(1)').html(todayFormat2 + "-");
          } else if(y == 3) {
            $('#valueY').html(todayFormat3);
            $('#wrapA > span:nth-child(1)').html(todayFormat3 + "-");
          } else if(y == 4) {
            $('#valueY').html(todayFormat4);
            $('#wrapA > span:nth-child(1)').html(todayFormat4 + "-");
          }
        };
        function changeFormatD() {
          let d = $('#formatD').val();
          if(d == 1) {
            $('#valueD').html("01");
            $('#wrapA > span:nth-child(2)').html("01-");
          } else if(d == 2) {
            $('#valueD').html("인사");
            $('#wrapA > span:nth-child(2)').html("인사-");
          }
        };
        function changeFormatF() {
          let d = $('#formatF').val();
          if(d == 1) {
            $('#valueF').html("0001");
            $('#wrapA > span:nth-child(3)').html("0001-1");
          } else if(d == 2) {
            $('#valueF').html("비품구매서");
            $('#wrapA > span:nth-child(3)').html("비품구매서-1");
          }
        };
    </script>

</body>
</html> 