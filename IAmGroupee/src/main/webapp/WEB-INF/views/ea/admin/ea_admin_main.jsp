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
                      <option value="1">1등급(임원)</option>
                      <option value="2">2등급(부장)</option>
                      <option value="3">3등급(차장)</option>
                      <option value="4">4등급(과장)</option>
                      <option value="5">5등급(대리)</option>
                      <option value="6">6등급(주임/사원)</option>
                    </select> 
                    이상 기본 열람</td>
                  </tr>
                  <tr>
                    <td>B등급</td>
                    <td>최종 승인 후 직위 
                      <select name="gradeB" id="gradeB">
                        <!-- 직위 테이블에서 가져온 직위 데이터 넣기 -->
                        <!-- 직급은 변동이 가능하니.. default값이 있어야..? 그렇다면 직급 추가나 수정시에 문서열람등급 테이블도 디폴트 값으로 바꿔줘야 할 듯..? 테이블에 저장된 값이 처음에 체크된 상태로 -->
                        <option value="1">1등급(임원)</option>
                        <option value="2">2등급(부장)</option>
                        <option value="3">3등급(차장)</option>
                        <option value="4">4등급(과장)</option>
                        <option value="5">5등급(대리)</option>
                        <option value="6">6등급(주임/사원)</option>
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
                    <select name="formatD" id="formatD">
                      <option value="1">부서 번호</option>
                      <option value="2">부서 이름</option>
                    </select>
                    <span>&emsp;&emsp;->&emsp;&emsp;ex)&emsp;</span>
                  </td>
                </tr>
                <tr>
                  <td>양식 설정</td>
                  <td id="wrapF">
                    <select name="formatF" id="formatF" onchange="">
                      <option value="1">양식 번호</option>
                      <option value="2">양식 이름</option>
                    </select>
                    <span>&emsp;&emsp;->&emsp;&emsp;ex)&emsp;</span>
                  </td>
                </tr>
                <tr>
                  <td>포맷 확인</td>
                  <td id="wrapA">

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
          <form action="" method="">

            
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
          let y = $('#formatY').val();
          if(y == 1)
            $('#valueY').html("220224");
        };
    </script>

</body>
</html> 