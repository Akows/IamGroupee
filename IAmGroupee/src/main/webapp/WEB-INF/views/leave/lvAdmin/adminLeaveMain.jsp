<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>LeaveMain Page</title>
  <link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
  <link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
</head>

<body>

    <%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

    <!-- ! Main -->
    <main class="main users chart-page" id="skip-target">
     <div class="container">
       
        <div style="height: 40px; text-align: center;">
        	<h1 style="color: rgb(50, 48, 48); font-weight: 600;" id="currentDate"></h1>
        </div>
        
        <br>
        
        <div class="row stat-cards" style="margin-bottom: 15px;">
          <div class="col-md-6 col-xl-4">
              <div class="card card-primary card-outline" style="width: 100%; height: 100%;">
	                <div style="float: left; width: 30%; margin-left: 30px; margin-top: 20px;">
	                  <ion-icon size="large" name="duplicate-outline"></ion-icon>
	                </div>
	                <div style="float: left; width: 68%; margin-left: 30px; margin-top: 10px; margin-bottom: 13px;">
	                  <a href="${root}/admin/leave/lvModiAD">
	                  	<p style="color: rgb(94, 94, 94); font-size: x-large; font-weight: bold;">휴가 발생 관리</p>
	                  </a>
	                </div>
              </div>
          </div>

          <div class="col-md-6 col-xl-4">
              <div class="card card-primary card-outline" style="width: 100%; height: 100%;">
	                <div style="float: left; width: 30%; margin-left: 30px; margin-top: 20px;">
	                  <ion-icon size="large" name="file-tray-full-outline"></ion-icon>
	                </div>
	                <div style="float: left; width: 68%; margin-left: 30px; margin-top: 10px; margin-bottom: 13px;">
	                  <a href="${root}/leave/lvInfo">
	                  	<p style="color: rgb(94, 94, 94); font-size: x-large; font-weight: bold;">연차 및 휴가 정보 게시판 관리</p>
	                  </a>
	                </div>
              </div>
          </div>
          
          <div class="col-md-6 col-xl-4">
              <div class="card card-primary card-outline" style="width: 100%; height: 100%;">
	                <div style="float: left; width: 30%; margin-left: 30px; margin-top: 20px;">
	                  <ion-icon size="large" name="mail-unread-outline"></ion-icon>
	                </div>
	                <div style="float: left; width: 68%; margin-left: 30px; margin-top: 10px; margin-bottom: 13px;">
	                  <a href="${root}/admin/leave/alvIntendAD">
	                  	<p style="color: rgb(94, 94, 94); font-size: x-large; font-weight: bold;">연차 사용 촉구서 관리</p>
	                  </a>
	                </div>
              </div>
          </div>
          
        </div>
        
        <div class="row stat-cards" style="margin-top: 30px;">
          <div class="col-md-6 col-xl-12">
            <article class="stat-cards-item">
            <div style="margin-bottom: 20px; width: 100%;">
              <ion-icon size="large" name="accessibility-outline" style="width: 5%; float: left;  text-align: right;"></ion-icon>
              <h3 style="color: rgb(94, 94, 94); font-weight: 600; width: 55%; float: left; line-height: 35px;">사원 연차 관리</h3>
              <div style="width: 40%; float: left;">
	              <form action="${root}/admin/leave/main" method="post" style="float: left; margin-right: 4px; margin-left: 35%;">
					<input type="text" name="searchByUserNo" style="float: left;"> 
					<input type="submit" value="검색" style="float: left;background-color: rgb(14, 104, 225); font-weight: bold; color: white;">
	              </form>
	              <a href="${root}/admin/leave/main"><input type="button" value="전체보기" style="float: left; background-color: rgb(14, 104, 225); font-weight: bold; color: white;"></a>
              </div>
            </div>
              
            
              <div class="stat-cards-info" style="width: 100%">
                <table class="table abc" style="width: 100%; text-align: center;">
				  <thead>
				    <tr">
				      <th scope="col">이름</th>
				      <th scope="col">부서명</th>
				      <th scope="col">직급명</th>
				      <th scope="col">발생 연차</th>
				      <th scope="col">조정 연차</th>
				      <th scope="col">총 연차</th>
				      <th scope="col">사용 연차</th>
				      <th scope="col">남은 연차</th>
				      <th scope="col">연차 추가</th>
				    </tr>
				  </thead>
				  <tbody>
				  <c:forEach items="${allUserList}" var="allUserList">
				    <tr>
				      <td style="width: 13%">${allUserList.name}</td>
				      <td style="width: 12%">${allUserList.departmentName}</td>
				      <td style="width: 12%">${allUserList.positionName}</td>
				      <td style="width: 11%">${allUserList.alvCount}</td>
				      <td style="width: 11%">${allUserList.alvAddCount}</td>
				      <td style="width: 11%">${allUserList.alvTotalCount}</td>
				      <td style="width: 11%">${allUserList.alvUsedCount}</td>
				      <td style="width: 11%">${allUserList.alvTotalCount - allUserList.alvUsedCount}</td>
				      <td style="width: 8%;">
				      	<button class="btn btn-primary btn-sm" onClick="show_pop('${allUserList.userNo}');">추가</button>
				      </td>
				    </tr>
				  </c:forEach>
				  </tbody>
				</table>
				<!-- 모달창 -->
				<div class="modal" tabindex="-1" role="dialog">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title">조정할 연차의 개수를 입력하세요</h5>
				        <!-- <h2 class="userNo" name="userNo"></h2> -->
				        <input type="hidden" class="userNo" name="userNo"></input>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="close_pop();">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <input type="number" class="alvOccurCount" name="alvOccurCount"><br>
				        <input type="text" class="alvOccurReason" name="alvOccurReason"  placeholder="사유를 입력해주세요.">
				      </div>
				      <div class="modal-footer">
				        <button type="submit" class="btn btn-primary addAlvDB">조정 연차 추가</button>
				        <button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="close_pop();">취소</button>
				      </div>
				    </div>
				  </div>
				</div>
				<!-- 모달창End -->
              </div>
              <!-- 페이징 -->
			  <div class="card-footer clearfix" style="width: 100%; margin: auto; text-align: center;">
			    <ul class="pagination pagination-m m-2" style=" margin: auto; color: black; padding-left: 40%; padding-right: 40%;">
				   <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225); font-weight: bold;">&laquo;</a></li>&nbsp;
			       <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225);">1</a></li>
			       <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225);">2</a></li>
			       <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225);">3</a></li>
			       <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225);">4</a></li>
			       <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225);">5</a></li>&nbsp;
			       <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225); font-weight: bold;">&raquo;</a></li>
			    </ul>
		      </div>
            </article>
          </div>
        </div>
      </div>
    </main>

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
  </div>
</div>


	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>

<script type="text/javascript">
	let today = new Date();
	let year = today.getFullYear(); 
	let month = today.getMonth() + 1
	let day = today.getDate();
	document.getElementById("currentDate").innerHTML = year + '-' + (("00"+month.toString()).slice(-2)) + '-' + (("00"+day.toString()).slice(-2));

		//팝업 show 기능
		function show_pop(userNo) {
			//show_pop 호출시 넘겨준 값을 이용하여 ajax 등을 통해 modal 을 띄울때 동적으로 바뀌어야 하는 값을 얻어온다.  
			//$("#title").html("ajax를 통해 얻어온 id에 해당하는 값");
			$(".userNo").html(userNo);
			console.log(userNo);
		     $('.modal').show();
		};
		//팝업 Close 기능
		function close_pop() {
		     $('.modal').hide();
		};

	
	$(function() {
	    $('.addAlvDB').click(function() {
	            
	        var alvAddCount = $('.alvOccurCount').val();
	        var userNo = $('.userNo').text();      
	        var alvOccurReason = $('.alvOccurReason').val();    
	            
	        // ajax 호출을 위한 정보 기입
	        var request = $.ajax({
	            url: "${root}/admin/leave/alvAddUpdate", // 호출 url
	            method: "POST", // 전송방식
	            data: {alvAddCount, userNo, alvOccurReason}, // 파라미터
	            dataType: "text" 
	        });
	             
	        // 호출 정상일 시 실행되는 메서드
	        request.done(function( data ) {
	            console.log(data);
	            close_pop();
	           /*  $('.abc').load(location.href+' .abc'); */
	            window.location.reload();
	        });
	 
	        // 호출 에러일 시 실행되는 메서드
	        request.fail(function() {
	            alert( "조정연차가 추가되지않았습니다.");
	        });
	 
	        // 호출 정상 또는 에러 상관없이 실행
	        request.always(function() {
	            console.log('완료');
	        });
	    });
	});

</script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>


</body>

</html>