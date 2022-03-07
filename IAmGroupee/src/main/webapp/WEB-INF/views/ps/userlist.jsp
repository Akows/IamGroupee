<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IAMGROUPE-임직원 관리</title>
<link rel="stylesheet" href="${root}/resources/css/ps/userlist.css">
</head>
<body>
<%@ include file="/WEB-INF/views/common/headerSide.jsp" %>
    <!-- ! Main -->
    <main class="main users chart-page" id="skip-target">
     <div class="container">
     	<br>
       <h1>임직원 관리</h1>
       <hr>
       <br>
       <br>
       <div class="row">
        <div class="col-12">
            <div class="card">
            <form action="${root}/admin/ps/userlist" method = "get">
              <div class="card-header">
                <a href="${root}/admin/ps/userenroll" class="userAddLink">사용자 추가 +</a>
 				
                <div class="card-tools">
                  <div class="input-group" style="width: 250px;">
                 
                    <input type="text" name="search" class="form-control float-right" placeholder="사번/이름/전화번호">

                    <div class="input-group-append">
                      <button type="submit" class="btn btn-default">
                        <i class="fas fa-search"></i>
                      </button>
                    </div>
                   
                  </div>
                </div>
                 
              </div>
              </form>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap">
                  <thead>
                    <tr>
                      	<th>사번</th>
       					<th>이름</th>
       					<th>전화번호</th>
       					<th>조직</th>
       					<th>직위</th>
       					<th>직무</th>
       					<th>입사일</th>
       					<th>상태</th>
                    </tr>
                  </thead>
                  <tbody>
                  	<c:forEach items="${userList}" var="user">
                  		<tr class="userSelect" data-toggle="modal" data-target="#modal">
                      		<td>${user.userNo}</td>
                      		<td>${user.name}</td>
                      		<td>${user.phone}</td>
                      		<c:if test="${empty user.departmentName}">
                      			<td></td>
                      		</c:if>
                      		<c:if test="${not empty user.departmentName}">
                      			<td>${user.departmentName}</td>
                      		</c:if>
                      		<c:if test="${empty user.positionName}">
                      			<td></td>
                      		</c:if>
                      		<c:if test="${not empty user.positionName}">
                      			<td>${user.positionName}</td>
                      		</c:if>
                      		<c:if test="${empty user.jobName}">
                      			<td></td>
                      		</c:if>
                      		<c:if test="${not empty user.jobName}">
                      			<td>${user.jobName}</td>
                      		</c:if>
                      		<td>${user.enrollDateToString()}</td>
                      		<c:if test="${user.activityYn eq 'Y'}">
                      			<td>활성화</td>
                      		</c:if>
                      		<c:if test="${user.activityYn eq 'N'}">
                      			<td>비활성화</td>
                      		</c:if>
                    	</tr>
                  	</c:forEach>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
             <div class="card-footer clearfix">
                <ul class="pagination pagination-sm m-0 center">
                	<c:if test="${empty pv.search}">
                		<c:if test="${pv.startPage != 1}">
							<li class="page-item"><a class="page-link" href="${root}/admin/ps/userlist/${page.startPage-1}">&laquo;</a></li>
						</c:if>
						<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
							<c:if test="${pv.currentPage != i and i <= pv.lastPage}"><li class="page-item"><a class="page-link" href="${root}/admin/ps/userlist/${i}">${i}</a></li></c:if>
							<c:if test="${pv.currentPage == i and i <= pv.lastPage}"><li class="page-item"><a class="page-link">${i}</a></li></c:if>
						</c:forEach>
						<c:if test="${pv.endPage < pv.lastPage}">
							<li class="page-item"><a class="page-link" href="${root}/admin/ps/userlist/${pv.endPage+1}">&raquo;</a></li>
						</c:if>
                	</c:if>
                	<c:if test="${not empty pv.search}">
                		<c:if test="${pv.startPage != 1}">
							<li class="page-item"><a class="page-link" href="${root}/admin/ps/userlist/${page.startPage-1}?search=${pv.search}">&laquo;</a></li>
						</c:if>
						<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
							<c:if test="${pv.currentPage != i and i <= pv.lastPage}"><li class="page-item"><a class="page-link" href="${root}/admin/ps/userlist/${i}?search=${pv.search}">${i}</a></li></c:if>
							<c:if test="${pv.currentPage == i and i <= pv.lastPage}"><li class="page-item"><a class="page-link">${i}</a></li></c:if>
						</c:forEach>
						<c:if test="${pv.endPage < pv.lastPage}">
							<li class="page-item"><a class="page-link" href="${root}/admin/ps/userlist/${pv.endPage+1}?search=${pv.search}">&raquo;</a></li>
						</c:if>
                	</c:if>
                </ul>
              </div>
            <!-- /.card -->
          </div>
       </div>
      </div>
    </main>
    <div class="modal fade" id="modal">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">임직원 정보</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="row">
			 <div class="card card-primary">
              <!-- /.card-header -->
              <div class="card-body">
                <form action="${root}/admin/ps/userModi" method="post" enctype="multipart/form-data">
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                        <label for="userNo">사원번호</label>
                        <input type="text" class="form-control textInput" placeholder="ID" name="userNo" id="userNo" readonly required/>
                      </div>
                      <div class="form-group">
                        <label for="pwd">비밀번호</label>
                        <input type="password" class="form-control textInput" placeholder="PASSWORD" name="pwd" id="pwd"/>
                      </div>
                      <div class="form-group">
                        <label for="pwdCheck">비밀번호 확인</label>
                        <input type="password" class="form-control textInput" placeholder="PASSWORD CHECK" name="pwdCheck" id="pwdCheck"/>
                      </div>
                        <div class="form-group">
                      	<span id="pwdDup"></span>
                      </div>
                    </div>
                    <div class="col-sm-6">
                  		<div class="box" style="background: #BDBDBD;">
    						<a id="profile"><img class="profile" id="userImg" src="${root}/resources/img/ps/profile/user.png"></a>
    						<input type="file" id="file" accept=".jpg,.png" name="file"/>
						</div>
					</div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                        <label for="name">이름</label>
                        <input type="text" class="form-control textInput" placeholder="NAME" name="name" id="name" required/>
                      </div>          
                    </div>
                    <div class="col-sm-6">
                  		<div class="form-group">
                        <label for="residentNo">주민등록번호</label>
                        <input type="text" class="form-control textInput" placeholder="주민등록번호" name="residentNo" id="residentNo" required/>
                      </div>
                      <div class="form-group">
                      	<span id="resiEx"></span>
                      </div>
					</div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                        <label for="phone">전화 번호</label>
                        <input type="text" class="form-control textInput" placeholder="PHONE" name="phone" id="phone" required/>
                      </div>   
                      <div class="form-group">
                      	<span id="phoneEx"></span>
                      </div>       
                    </div>
                    <div class="col-sm-6">
                  		<div class="form-group">
                        <label for="email">이메일</label>
                        <input type="text" class="form-control textInput" placeholder="EMAIL" name="email" id="email" required/>
                      </div>
                      <div class="form-group">
                      	<span id="emailEx"></span>
                      </div>
					</div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                      <label for="enrollDate">입사일</label>
                    	<div class="input-group date" id="reservationdate" data-target-input="nearest">
                    	
                        <input type="text" name="enrollDateStr" id="enrollDate" class="form-control datetimepicker-input" data-target="#reservationdate" placeholder="dd/MM/yyyy" required/>
                        <div class="input-group-append" data-target="#reservationdate" data-toggle="datetimepicker">
                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                        </div>
                    </div>
                </div>
                    </div>
                    <div class="col-sm-6">
                  		<div class="form-group">
                        <label for="address">주소</label>
                        <input type="text" class="form-control textInput" placeholder="ADDRESS" name="address" id="address" required/>
                      </div>
					</div>
                  </div>
                  <div class="row">
                    <div class="col-sm-4">
                      <!-- select -->
                      <div class="form-group">
                        <label>조직</label>
                        <select class="form-control" name="departmentNo" id="departmentNo">
                          <option value="0">없음</option>
                          <c:forEach items="${deptList}" var="d">
                          	<option value="${d.departmentNo}">${d.departmentName}</option>
                          </c:forEach>
                        </select>
                      </div>
                    </div>
                    <div class="col-sm-4">
                      <!-- select -->
                      <div class="form-group">
                        <label>직위</label>
                        <select class="form-control" name="positionNo" id="positionNo">
                          <option value="0">없음</option>
                          <c:forEach items="${posiList}" var="p">
                          	<option value="${p.positionNo}">${p.positionName}</option>
                          </c:forEach>
                        </select>
                      </div>
                    </div>
                     <div class="col-sm-4">
                      <!-- select -->
                      <div class="form-group">
                        <label>직무</label>
                        <select class="form-control" name="jobNo" id="jobNo">
                          <option value="0">없음</option>
                          <c:forEach items="${jobList}" var="j">
                          	<option value="${j.jobNo}">${j.jobName}</option>
                          </c:forEach>
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                  	<div class="form-group">
                  		<label>권한 여부</label>
                  	</div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6 col-lg-3">
                      <!-- checkbox -->
                      <div class="form-group">
                        <div class="form-check">
                          <input type="checkbox" id="check1" name="personnelRight" value="Y">
                          <label for="check1" class="form-check-label">인사 관리</label>
                        </div>
                      </div>
                    </div>
                    <div class="col-sm-6 col-lg-3">
                      <!-- checkbox -->
                      <div class="form-group">
                        <div class="form-check">
                          <input type="checkbox" id="check2" name="paymentRight" value="Y">
                          <label for="check2" class="form-check-label">전자결제 관리</label>
                        </div>
                      </div>
                    </div>
                    <div class="col-sm-6 col-lg-3">
                      <!-- checkbox -->
                      <div class="form-group">
                        <div class="form-check">
                          <input type="checkbox" id="check3" name="leaveRight" value="Y">
                          <label for="check3" class="form-check-label">연차 관리</label>
                        </div>
                      </div>
                    </div>
                    <div class="col-sm-6 col-lg-3">
                      <!-- checkbox -->
                      <div class="form-group">
                        <div class="form-check">
                          <input type="checkbox" id="check4" name="reservationsRight" value="Y">
                          <label for="check4" class="form-check-label">예약 관리</label>
                        </div>
                      </div>
                    </div>
                   </div>
                   <div class="row">
                    <div class="col-sm-6 col-lg-3">
                      <!-- checkbox -->
                      <div class="form-group">
                        <div class="form-check">
                          <input type="checkbox" id="check5" name="boardRight" value="Y">
                          <label for="check5" class="form-check-label">게시판 관리</label>
                        </div>
                      </div>
                    </div>
                    <div class="col-sm-6 col-lg-3">
                      <!-- checkbox -->
                      <div class="form-group">
                        <div class="form-check">
                          <input type="checkbox" id="check6" name="attendenceRight" value="Y">
                          <label for="check6" class="form-check-label">근태 관리</label>
                        </div>
                      </div>
                    </div>
                    <div class="col-sm-6 col-lg-3">
                      <!-- checkbox -->
                      <div class="form-group">
                        <div class="form-check">
                          <input type="checkbox" id="check7" name="salaryRight" value="Y">
                          <label for="check7" class="form-check-label">급여 관리</label>
                        </div>
                      </div>
                    </div>
                   </div>

                   <div class="row">
                   		<div class="col-sm-6">
                   		<label>계정 활성화 여부</label>
                      		<!-- radio -->
                      		<div class="form-group">
                        		<div class="custom-control custom-radio">
                        			<input class="custom-control-input" type="radio" id="customRadio1" name="activityYn" value="Y">
                          			<label for="customRadio1" class="custom-control-label">활성화</label>
                        		</div>
                        		<div class="custom-control custom-radio">
                        			<input class="custom-control-input" type="radio" id="customRadio2" name="activityYn" value="N">
                          			<label for="customRadio2" class="custom-control-label">비활성화</label>
                        		</div>
                      		</div>
                    	</div>
                    	<div class="col-sm-6">
                    		<div class="form-group">
                      			<label for="endDate">퇴직일</label>
                    				<div class="input-group date" id="endDate" data-target-input="nearest">
                        			<input type="text" name="endDateStr" id="endDate" class="form-control datetimepicker-input" data-target="#endDate" placeholder="dd/MM/yyyy"/>
                        			<div class="input-group-append" data-target="#endDate" data-toggle="datetimepicker">
                            			<div class="input-group-text"><i class="fa fa-calendar"></i></div>
                        				</div>
                    				</div>
                    		</div>
                    	</div>
                   	</div>

                  <div class="row">
                  	<div class="col-sm-6 col-lg-8"></div>
                  	<div class="col-sm-3 col-lg-2">
                  		<button type="submit" class="btn btn-block btn-primary" id="add">추가</button>
                  	</div>
                  	<div class="col-sm-3 col-lg-2">
                  		<button type="button" class="btn btn-block btn-secondary"  data-dismiss="modal" id="cancle">닫기</button>
                  	</div>
                  </div> 
                </form>
              </div>
              <!-- /.card-body -->
              
            </div>
            <!-- /.card -->
			</div>
            </div>
            </div>
            </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->

    

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>

<!-- InputMask -->
  <script src="${root}/resources/plugins/moment/moment.min.js"></script>
  <!-- date-range-picker -->
  <script src="${root}/resources/plugins/daterangepicker/daterangepicker.js"></script>
  <!-- Tempusdominus Bootstrap 4 -->
  <script src="${root}/resources/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
    

	<script type="text/javascript">
		$(document).ready(function(){
			var pwdCheck = true;
			$(".userSelect").click(function(){
				$("#userNo").val('');
				$("#name").val('');
				$("#residentNo").val('');
				$("#phone").val('');
				$("#email").val('');
				$("#enrollDate").val('');
				$("#address").val('');
				$("#endDate").val('');
				$("#departmentNo").val('0').prop("selected", true);
				$("#positionNo").val('0').prop("selected", true);
				$("#jobNo").val('0').prop("selected", true);
				$("#check1").prop('checked', false);
				$("#check2").prop('checked', false);
				$("#check3").prop('checked', false);
				$("#check4").prop('checked', false);
				$("#check5").prop('checked', false);
				$("#check6").prop('checked', false);
				$("#check7").prop('checked', false);
				var userNo1 = $(this).children().eq(0).text();
				<c:forEach items="${userList}" var="user">
					if(userNo1 === '${user.userNo}'){
						var userNo = '${user.userNo}';
						var positionNo = '${user.positionNo}';
						var departmentNo = '${user.departmentNo}';
						var jobNo = '${user.jobNo}';
						var name = '${user.name}';
						var residentNo = '${user.residentNo}';
						var phone = '${user.phone}';
						var email = '${user.email}';
						var address = '${user.address}';
						var enrollDate = '${user.enrollDateModi()}';
						<c:if test="${user.endDate ne null}">
							console.log("들어옴");
							var endDate = '${user.endDateModi()}';
							console.log(endDate);
						</c:if>
						var activityYn = '${user.activityYn}';
						var profile = '${user.profile}';
						var personnelRight = '${user.personnelRight}';
						var paymentRight = '${user.paymentRight}';
						var leaveRight = '${user.leaveRight}';
						var reservationsRight = '${user.reservationsRight}';
						var boardRight = '${user.boardRight}';
						var attendenceRight = '${user.attendenceRight}';
						var salaryRight = '${user.salaryRight}';
					}
				</c:forEach>
				$("#userNo").val(userNo);
				$("#name").val(name);
				$("#residentNo").val(residentNo);
				$("#phone").val(phone);
				$("#email").val(email);
				$("#enrollDate").val(enrollDate);
				<c:if test="${user.endDate ne null}">

					$("#endDate").val(endDate);

				</c:if>
					

				$("#address").val(address);
				$("#userImg").attr("src", "${root}/resources/img/ps/profile/"+profile);
				$("#departmentNo").val(departmentNo).prop("selected", true);
				$("#positionNo").val(positionNo).prop("selected", true);
				$("#jobNo").val(jobNo).prop("selected", true);
				if(activityYn === 'Y'){
					$("#customRadio1").prop('checked', true);
					$("#customRadio2").prop('checked', false);
				}else {
					$("#customRadio1").prop('checked', false);
					$("#customRadio2").prop('checked', true);
				}
				if(personnelRight === 'Y'){
					$("#check1").prop('checked', true);
				}
				if(paymentRight === 'Y'){
					$("#check2").prop('checked', true);
				}
				if(leaveRight === 'Y'){
					$("#check3").prop('checked', true);
				}
				if(reservationsRight === 'Y'){
					$("#check4").prop('checked', true);
				}
				if(boardRight === 'Y'){
					$("#check5").prop('checked', true);
				}
				if(attendenceRight === 'Y'){
					$("#check6").prop('checked', true);
				}
				if(salaryRight === 'Y'){
					$("#check7").prop('checked', true);
				}
			});
			$("#profile").on("click",function(){
				$("#file").click();
			});
			$("#file").change(function(){
				let fileTag = document.querySelector('input[name=file]');
				let aTag = document.querySelector('#profile');
				if(fileTag.files.length > 0){
					let reader = new FileReader();
					reader.onload = function(data){
						let imgTag = document.createElement('img');
						imgTag.classList.add("profile");
						imgTag.setAttribute('src', data.target.result);
						aTag.innerHTML ='';
						aTag.appendChild(imgTag);
					}
					reader.readAsDataURL(fileTag.files[0]);

				}else {
					let imgTag = document.createElement('img');
					imgTag.classList.add("profile");
					imgTag.setAttribute('src', "${root}/resources/img/ps/profile/user.png");
					aTag.innerHTML ='';
					aTag.appendChild(imgTag);
				}
			});
			$('#reservationdate').datetimepicker({
			     format: 'L'
			});
			$('#endDate').datetimepicker({
			     format: 'L'
			});
			$("#pwdCheck").change(function(){
				if(($("#pwdCheck").val() === null || $("#pwdCheck").val() === "") && ($("#pwd").val() === null || $("#pwd").val() === "")){
					pwdCheck = true;
				}else if($("#pwdCheck").val() === $("#pwd").val()){
					pwdCheck=true;
					$("#pwdDup").text("비밀번호가 일치합니다.");
					$("#pwdDup").css("color", "green");
				}else{
					pwdCheck=false;
					$("#pwdDup").text("비밀번호가 일치하지 않습니다.");
					$("#pwdDup").css("color", "red");
				}
			});
			$("#pwd").change(function(){
				if(($("#pwdCheck").val() === null || $("#pwdCheck").val() === "") && ($("#pwd").val() === null || $("#pwd").val() === "")){
					pwdCheck = true;
					$("#pwdDup").text("");
				}else if($("#pwdCheck").val() === $("#pwd").val()){
					pwdCheck=true;
					$("#pwdDup").text("비밀번호가 일치합니다.");
					$("#pwdDup").css("color", "green");
				}else{
					pwdCheck=false;
					$("#pwdDup").text("비밀번호가 일치하지 않습니다.");
					$("#pwdDup").css("color", "red");
				}
			});
		});
	</script>

	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
</body>
</html>