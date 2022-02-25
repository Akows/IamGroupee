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
<title>LeavModPage</title>
  <link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
  <link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js%22%3E"></script>
</head>

<body>

    <%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

    <!-- ! Main -->
    <main class="main users chart-page" id="skip-target">
     <div class="container">
     
        <div class="row stat-cards">
          <div class="col-md-6 col-xl-6">
            <article class="stat-cards-item" style="margin-bottom: 205px;">
              <div class="stat-cards-info" style="width: 100%">
			      <div id="letter" style="margin-bottom: 30px;">
			          <h4 style="color: rgb(94, 94, 94); font-weight: 600;">휴가 항목 발생</h4>
				  </div>
				  <form action="${root}/admin/leave/lvAddAD" method="post">
				  <table class="table" style="text-align: center; width: 100%; font-weight: bolder;">
				      <tr>
				         <td style="border-right: 1px solid lightgray; margin: auto;">휴가 코드</td>
				         <td><input class="form-control" type="text" placeholder="LV_00" name="lvCode" style="border: 1px solid lightgray;"></td>
				      </tr>
				      <tr>
				         <td style="border-right: 1px solid lightgray;">휴가명</td>
				         <td><input class="form-control" type="text" placeholder="휴가명을 입력하세요." name="lvName" style="border: 1px solid lightgray;"></td>
				      </tr>
				      <tr>
				         <td style="border-right: 1px solid lightgray;">유급 여부</td>
				         <td><input class="form-control" type="text" placeholder="Y/N" name="lvPaid" style="border: 1px solid lightgray;"></td>
				      </tr>
				      <tr>
				         <td style="border-right: 1px solid lightgray;">세부 내용</td>
				         <td><input class="form-control" type="text" placeholder="세부 내용을 입력하세요" name="lvContent" style="border: 1px solid lightgray;"></td>
				      </tr>
			      </table>
			      <!-- 휴가코드명 중복 시 띄우는 모달창 -->
			      <div class="modal fade" id="modal-default">
			        <div class="modal-dialog">
			          <div class="modal-content">
			            <div class="modal-header">
			              <h4 class="modal-title">Caution!</h4>
			              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                <span aria-hidden="true">&times;</span>
			              </button>
			            </div>
			            <div class="modal-body">
			              <p>One fine body&hellip;</p>
			            </div>
			            <div class="modal-footer justify-content-between">
			              <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
			            </div>
			          </div>
			        </div>
			      </div>
			        <!-- modal end -->
			      <input type="submit" value="추가하기" style="background-color: rgb(14, 104, 225); font-weight: bold; color: white; margin-left: 85%">
			      </form>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-xl-6">
            <article class="stat-cards-item" style="margin-bottom: 205px;">
              <div class="stat-cards-info" style="width: 100%">
			      <div id="letter" style="margin-bottom: 20px;">
			          <h4 style="color: rgb(94, 94, 94); font-weight: 600;">휴가 목록</h4>
				  </div>
				  <form action="${root}/admin/leave/lvDelAD" method="post">
				  <div class="card" style="text-align: center; width: 100%">
			          <table class="table" style="text-align: center; width: 100%">
			             <thead>
			                <tr>
			                  <th style="width: 10%"></th>
			                  <th style="width: 20%">휴가 코드</th>
			                  <th style="width: 20%">휴가명</th>
			                  <th style="width: 20%">유급 여부</th>
			                  <th style="width: 30%">세부 내용</th>
			                </tr>
			             </thead>
			             <tbody>
				           <c:forEach items="${lvTypeList}" var="lvTypeList">
				            <tr>
				              <td><input type="checkbox" class="delLv" value="${lvTypeList.lvCode}"></td>
				              <td>${lvTypeList.lvCode}</td>
				              <td>${lvTypeList.lvName}</td>
				              <td>${lvTypeList.lvPaid}</td>
				              <td>${lvTypeList.lvContent}</td>
				            </tr>
				           </c:forEach>
			             </tbody>
			           </table>
			      </div> 
		          <div style="height: 30px; width: 100%;">
			         <div class="input-group-prepend" style="margin-left: 92%">
			              <input type="button" onclick="del();" value="삭제" style="background-color: rgb(14, 104, 225); font-weight: bold; color: white; margin-right: 10px; float: left;">
			         </div>
			      </div>
			      </form>	                   	    
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

<script>
	
	$(document).ready(function() {
		var result = '<c:out value="${checkExist}" />';
		console.log(result);
		checkModal(result);
		
		function checkModal(result){
			if(result === ''){
				return;
			}
			if(result !== ''){
				$(".modal-body").html("휴가 코드 " + result + "은 이미 존재합니다.");
			}
			
			$("#modal-default").modal("show");
		}
	});
	// 삭제하기 버튼 눌렀을 때
	function del() {
		let delArr = document.getElementsByClassName('delLv');
		let result = "";
		for (var i = 0; i < delArr.length; i++) {
			let t = delArr[i];
			if (t.checked) {
				result += t.value + ',';
			}
		}
	// 삭제할 번호를 전달해주면서 삭제 요청 보내기
		$.ajax({
			url : "${root}/admin/leave/lvDelAD",
			data : {"result": result},
			type : 'post',
			success : function (data) {
				console.log(data);
			},
			error : function (e) {
				console.log(e);
			}
		});
	// 새로고침처리
	window.location.reload();
	}
</script>

</body>

</html>