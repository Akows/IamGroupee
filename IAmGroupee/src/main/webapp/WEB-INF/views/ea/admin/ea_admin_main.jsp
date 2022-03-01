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
          <form action="" method="GET" onsubmit="return confirmChangeSettings();">
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
                    <select name="secMinA" id="gradeA">
                      <!-- 직위 테이블에서 가져온 직위 데이터 넣기 -->
                      <!-- 직급은 변동이 가능하니.. default값이 있어야..? 그렇다면 직급 추가나 수정시에 문서열람등급 테이블도 디폴트 값으로 바꿔줘야 할 듯..? 테이블에 저장된 값이 처음에 체크된 상태로 -->
                      <c:forEach items="${positionValues}" var="pv">
                      	<c:choose >
                      		<c:when test="${pv.positionLevel eq defaultSettings.secMinA}">
		                      <option value="${pv.positionLevel}" selected="selected">${pv.positionLevel}등급(${pv.positionName})</option>
                      		</c:when>
                      		<c:otherwise>
                      		  <option value="${pv.positionLevel}">${pv.positionLevel}등급(${pv.positionName})</option>
                      		</c:otherwise>
                      	</c:choose>
                      </c:forEach>
                    </select>
                    이상 기본 열람</td>
                  </tr>
                  <tr>
                    <td>B등급</td>
                    <td>최종 승인 후 직위 
                      <select name="secMinB" id="gradeB">
                        <!-- 직위 테이블에서 가져온 직위 데이터 넣기 -->
                        <!-- 직급은 변동이 가능하니.. default값이 있어야..? 그렇다면 직급 추가나 수정시에 문서열람등급 테이블도 디폴트 값으로 바꿔줘야 할 듯..? 테이블에 저장된 값이 처음에 체크된 상태로 -->
                        <c:forEach items="${positionValues}" var="pv">
                      	  <c:choose >
                      		<c:when test="${pv.positionLevel eq defaultSettings.secMinB}">
		                      <option value="${pv.positionLevel}" selected="selected">${pv.positionLevel}등급(${pv.positionName})</option>
                      		</c:when>
                      		<c:otherwise>
                      		  <option value="${pv.positionLevel}">${pv.positionLevel}등급(${pv.positionName})</option>
                      		</c:otherwise>
                      	  </c:choose>
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
                    <select name="formatYear" id="formatY" onchange="changeFormatY();">
                      <option value="YYMMDD">YYMMDD</option>
                      <option value="YYMD">YYMD</option>
                      <option value="YYYYMMDD">YYYYMMDD</option>
                      <option value="YYYYMD">YYYYMD</option>
                    </select>
                    <span>&emsp;&emsp;->&emsp;&emsp;ex)&emsp;</span>
                    <span id="valueY"></span>
                  </td>
                </tr>
                <tr>
                  <td>부서 설정</td>
                  <td id="wrapD">
                    <select name="formatDept" id="formatD"  onchange="changeFormatD();">
                      <option value="부서번호">부서 번호</option>
                      <option value="부서이름">부서 이름</option>
                    </select>
                    <span>&emsp;&emsp;->&emsp;&emsp;ex)&emsp;</span>
                    <span id="valueD"></span>
                  </td>
                </tr>
                <tr>
                  <td>양식 설정</td>
                  <td id="wrapF">
                    <select name="formatForm" id="formatF" onchange="changeFormatF();">
                      <option value="양식번호">양식 번호</option>
                      <option value="양식이름">양식 이름</option>
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
        <div id="secondDiv">
          <form action="editForm" method="GET" onsubmit="return checkingSelectForm();">
            <!-- category -->
            <div>
              <div><span>🗂 카테고리</span></div>
              <select name="categoryNo" size="15">
	              <c:forEach items="${categoryValues}" var="cv">
	                <option value="${cv.categoryNo}" onclick="seletedCategory(this);" ondblclick="updateCategoryName();">${cv.categoryName}</option>
	              </c:forEach>
              </select>
              <div>
                <span id="categoryM" onclick="categoryMinus();">-</span>
                <span id="categoryP" onclick="categoryPlus();">+</span>
              </div>
            </div>
            <!-- form -->
            <div>
              <div><span>🧾 양식</span></div>
              <select name="formNo" size="15">
                <c:forEach items="${formValues}" var="fv">
                  <option class="${fv.categoryNo}" value="${fv.formNo}" onclick="selectedForm(this);" ondblclick="updateFormName();">${fv.formTitle}</option>
                </c:forEach>
              </select>
              <div>
                <span id="formM" onclick="formMinus();">-</span>
                <span id="formP" onclick="formPlus();">+</span>
              </div>
            </div>
            <!-- preview -->
            <div>
              <div><span>🔍 양식 미리보기</span></div>
              <article id="formContents">
                <!-- DB에 저장한 양식 하단에 불러오기 -->
                <c:forEach items="${formValues}" var="fv">
                	<div id="${fv.formNo}">${fv.formContent}</div>
                </c:forEach>
              </article>
            </div>
            
            <span id="arrow1">=></span>
            <span id="arrow2">=></span>
            <input type="submit" value="양식 수정하기" id="editFormBtn">
          </form>

          <div id="updateCategoryLayer">
            <div>카테고리 이름 변경</div>
            <div>
              <input type="text" id="changedCategoryName" placeholder="변경하실 이름을 입력해주세요.">
            </div>
            <div>
              <a>취소</a>
              <a onclick="changingCategoryName();">변경</a>
            </div>
          </div>
          <div id="updateFormLayer">
            <div>양식 이름 변경</div>
            <div>
              <input type="text" id="changedFormName" placeholder="변경하실 이름을 입력해주세요.">
            </div>
            <div>
              <a>취소</a>
              <a onclick="changingFormName();">변경</a>
            </div>
          </div>
          <div id="layer_bg"></div>
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
        });
        function confirmChangeSettings() {
          if(confirm('문서 설정 사항을 변경하시겠습니까?')) {
            return true;
          } else {
            return false;
          }
        }
        // 문서 번호 포맷 디폴트값 들어가게
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

        $("#formatY > option[value=<c:out value='${defaultSettings.formatYear}'/>]").attr('selected', 'selected');
        $("#formatD > option[value=<c:out value='${defaultSettings.formatDept}'/>]").attr('selected', 'selected');
        $("#formatF > option[value=<c:out value='${defaultSettings.formatForm}'/>]").attr('selected', 'selected');

        if("<c:out value='${defaultSettings.formatYear}'/>" == 'YYMMDD') {
          $('#valueY').html(todayFormat1);
          $('#wrapA > span:nth-child(1)').html(todayFormat1 + "-");
        } else if("<c:out value='${defaultSettings.formatYear}'/>" == 'YYMD') {
          $('#valueY').html(todayFormat2);
          $('#wrapA > span:nth-child(1)').html(todayFormat2 + "-");
        } else if("<c:out value='${defaultSettings.formatYear}'/>" == 'YYYYMMDD') {
          $('#valueY').html(todayFormat3);
          $('#wrapA > span:nth-child(1)').html(todayFormat3 + "-");
        } else if("<c:out value='${defaultSettings.formatYear}'/>" == 'YYYYMD') {
          $('#valueY').html(todayFormat4);
          $('#wrapA > span:nth-child(1)').html(todayFormat4 + "-");
        }

        if("<c:out value='${defaultSettings.formatDept}'/>" == '부서번호') {
          $('#valueD').html('01');
          $('#wrapA > span:nth-child(2)').html("01-");
        } else if("<c:out value='${defaultSettings.formatDept}'/>" == '부서이름') {
          $('#valueD').html('인사');
          $('#wrapA > span:nth-child(2)').html("인사-");
        } 

        if("<c:out value='${defaultSettings.formatForm}'/>" == '양식번호') {
          $('#valueF').html('0001');
          $('#wrapA > span:nth-child(3)').html("0001-1");
        } else if("<c:out value='${defaultSettings.formatForm}'/>" == '양식이름') {
          $('#valueF').html('비품구매서');
          $('#wrapA > span:nth-child(3)').html("비품구매서-1");
        } 
        
        // 문서 번호 포맷
        function changeFormatY() {
          
          let y = $('#formatY').val();
          if(y == 'YYMMDD') {
            $('#valueY').html(todayFormat1);
            $('#wrapA > span:nth-child(1)').html(todayFormat1 + "-");
          } else if(y == 'YYMD') {
            $('#valueY').html(todayFormat2);
            $('#wrapA > span:nth-child(1)').html(todayFormat2 + "-");
          } else if(y == 'YYYYMMDD') {
            $('#valueY').html(todayFormat3);
            $('#wrapA > span:nth-child(1)').html(todayFormat3 + "-");
          } else if(y == 'YYYYMD') {
            $('#valueY').html(todayFormat4);
            $('#wrapA > span:nth-child(1)').html(todayFormat4 + "-");
          }
        };
        function changeFormatD() {
          let d = $('#formatD').val();
          if(d == '부서번호') {
            $('#valueD').html("01");
            $('#wrapA > span:nth-child(2)').html("01-");
          } else if(d == '부서이름') {
            $('#valueD').html("인사");
            $('#wrapA > span:nth-child(2)').html("인사-");
          }
        };
        function changeFormatF() {
          let d = $('#formatF').val();
          if(d == '양식번호') {
            $('#valueF').html("0001");
            $('#wrapA > span:nth-child(3)').html("0001-1");
          } else if(d == '양식이름') {
            $('#valueF').html("비품구매서");
            $('#wrapA > span:nth-child(3)').html("비품구매서-1");
          }
        };

        // 양식 카테고리 클릭시(선택시) 카테고리에 포함된 양식 불러오기
        function seletedCategory(e) {
          $('select[name=categoryNo] > option').removeAttr('selected');
          $(e).attr('selected', 'selected');
          let cn = $(e).val();
          let arr = document.getElementsByClassName(cn);
          $('select[name=formNo] > option').removeClass('activeForm');
          for (let i = 0; i < arr.length; i++) {
            arr[i].classList.add('activeForm');
          }
        };

        // 양식 클릭시(선택시) 미리보기에 내용 출력
        function selectedForm(e) {
          $('select[name=formNo] > option').removeAttr('selected');
          $(e).attr('selected', 'selected');
          let fn = $(e).val();
          let value = document.getElementById(fn);
          $('#formContents > div').removeClass('activeContent');
          value.classList.add('activeContent');
        };

        // - , + 버튼으로 카테고리, 양식 추가/삭제
        function categoryPlus() {
          $.ajax({
            url : "${root}/admin/ea/insertCategory",
            method : "GET",
            success : function(result) {
              $("<option>", {
                  value : result,
                  onclick : "seletedCategory(this);",
                  ondblclick : "updateCategoryName();"
              }).text('새로운 카테고리')
              .appendTo("select[name=categoryNo]");
            },
            error : function(e) {
              console.log(e);
            }
          });
        };
        function categoryMinus() {
          if(confirm('선택하신 카테고리를 삭제하시겠습니까?(삭제시 하위 문서양식까지 모두 삭제됩니다 ^^;;)')) {
            $.ajax({
              url : "${root}/admin/ea/deleteCategory",
              method : "GET",
              data : {
                categoryNo : $('select[name="categoryNo"] > option[selected="selected"]').val()
              },
              success : function(result) {
                $('select[name="categoryNo"] > option[selected="selected"]').remove();
              },
              error : function(e) {
                console.log(e);
              }
            });
          } else {
            return false;
          }
        };
        function formPlus() {
          $.ajax({
            url : "${root}/admin/ea/insertForm",
            method : "GET",
            data : {
              categoryNo : $('select[name="categoryNo"] > option[selected="selected"]').val()
            },
            success : function(result) {
              $("<option>", {
                  value : result,
                  class : $('select[name="categoryNo"] > option[selected="selected"]').val(),
                  onclick : "selectedForm(this);",
                  ondblclick : "updateFormName();"
              }).addClass('activeForm')
              .text('새로운 양식')
              .appendTo("select[name=formNo]");

              $("<div>", {
                  id : result
              }).html('<h1 style="text-align:center">새로운 양식</h1>').appendTo("#formContents");
            },
            error : function(e) {
              console.log(e);
            }
          });
        };
        function formMinus() {
          if(confirm('선택하신 양식을 삭제하시겠습니까?')) {
            $.ajax({
              url : "${root}/admin/ea/deleteForm",
              method : "GET",
              data : {
                formNo : $('select[name="formNo"] > option[selected="selected"]').val()
              },
              success : function(result) {
                $('select[name="formNo"] > option[selected="selected"]').remove();
              },
              error : function(e) {
                console.log(e);
              }
            });
          } else {
            return false;
          }
        };

        // 카테고리, 양식 제목 더블클릭시 이름 변경
        // 취소 레이어 hide
        $('div[id$="Layer"] > div:nth-child(3) > a:nth-child(1)').click(function() {
          $(this).parent().parent().hide();
          $('#layer_bg').hide();
        })

        // 카테고리 이름 dblclick시 레이어 show
        function updateCategoryName() {
          $('#updateCategoryLayer').show();
          $('#layer_bg').show();
          $('#changedCategoryName').val('');
        };

        // 카테고리 이름 변경 레이어 '변경'버튼 클릭시 카테고리 이름 변경 적용
        function changingCategoryName() {
          if(confirm('카테고리 이름을 변경하시겠습니까?')) {
            $.ajax({
              url : "${root}/admin/ea/updateCategoryName",
              method : "GET",
              data : {
                categoryNo : $('select[name="categoryNo"] > option[selected="selected"]').val(),
                categoryName : $('#changedCategoryName').val()
              },
              success : function(result) {
                $('select[name="categoryNo"] > option[selected="selected"]').text($('#changedCategoryName').val());
              },
              error : function(e) {
                console.log(e);
              }
            });
          } else {
            return false;
          }
          $('#updateCategoryLayer').hide();
          $('#layer_bg').hide();
        };

        // 양식 이름 dblclick시 레이어 show
        function updateFormName() {
          $('#updateFormLayer').show();
          $('#layer_bg').show();
          $('#changedFormName').val('');
        };

        // 양식 이름 변경 레이어 '변경'버튼 클릭시 카테고리 이름 변경 적용
        function changingFormName() {
          if(confirm('양식 이름을 변경하시겠습니까?')) {
            $.ajax({
              url : "${root}/admin/ea/updateFormName",
              method : "GET",
              data : {
                formNo : $('select[name="formNo"] > option[selected="selected"]').val(),
                formTitle : $('#changedFormName').val()
              },
              success : function(result) {
                $('select[name="formNo"] > option[selected="selected"]').text($('#changedFormName').val());
              },
              error : function(e) {
                console.log(e);
              }
            });
          } else {
            return false;
          }
          $('#updateFormLayer').hide();
          $('#layer_bg').hide();
        };

        // 양식 수정하기 버튼 클릭시 선택된거 없으면 제출 불가
        function checkingSelectForm() {
          if(undefined === $('select[name="formNo"] > option[selected="selected"]').val()) {
            alert('수정할 양식을 선택해주세요.');
            return false;
          } else {
            return true;
          }
        };
        
        


        // enter key process
        // $('.container').on('keydown', 'input', function(e) {
        //  if (e.keyCode === 13) {
        //     e.preventDefault();
        //     e.stopImmediatePropagation();
        //     //Do your stuff...
        //     }
        // });





    </script>

</body>
</html> 