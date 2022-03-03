<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>IAMGROUPE-사용자 등록</title>
<link rel="stylesheet" href="${root}/resources/css/ps/userenroll.css">

</head>
<body>
<%@ include file="/WEB-INF/views/common/headerSide.jsp" %>
	<c:set var="pwdCheck" value="false" />
    <!-- ! Main -->
    <main class="main users chart-page" id="skip-target">
     <div class="container">
     	<br>
       <h1>사용자 등록</h1>
       <hr>
       <br>
		<div class="row">
			<div class="col-lg-3"></div>
			<div class="col-lg-6">
			 <div class="card card-primary">
              <!-- /.card-header -->
              <div class="card-body">
                <form action="" method="post" enctype="multipart/form-data">
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                        <label for="userNo">사원번호</label>
                        <input type="text" class="form-control textInput" placeholder="ID" name="userNo" id="userNo" required>
                      </div>
                      <div class="form-group">
                        <label for="pwd">비밀번호</label>
                        <input type="password" class="form-control textInput" placeholder="PASSWORD" name="pwd" id="pwd" required>
                      </div>
                      <div class="form-group">
                        <label for="pwdCheck">비밀번호 확인</label>
                        <input type="password" class="form-control textInput" placeholder="PASSWORD CHECK" name="pwdCheck" id="pwdCheck" required>
                      </div>
                    </div>
                    <div class="col-sm-6">
                  		<div class="box" style="background: #BDBDBD;">
    						<a id="profile"><img class="profile" src="${root}/resources/img/ps/profile/user.png"></a>
    						<input type="file" id="file" accept=".jpg,.png" name="profile"/>
						</div>
					</div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                        <label for="name">이름</label>
                        <input type="text" class="form-control textInput" placeholder="NAME" name="name" id="name" required>
                      </div>          
                    </div>
                    <div class="col-sm-6">
                  		<div class="form-group">
                        <label for="residentNo">주민등록번호</label>
                        <input type="text" class="form-control textInput" placeholder="주민등록번호" name="residentNo" id="residentNo" required>
                      </div>
					</div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                        <label for="phone">전화 번호</label>
                        <input type="text" class="form-control textInput" placeholder="PHONE" name="phone" id="phone" required>
                      </div>          
                    </div>
                    <div class="col-sm-6">
                  		<div class="form-group">
                        <label for="email">이메일</label>
                        <input type="text" class="form-control textInput" placeholder="EMAIL" name="email" id="email" required>
                      </div>
					</div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                      <label for="enrollDate">입사일</label>
                    	<div class="input-group date" id="reservationdate" data-target-input="nearest">
                    	
                        <input type="text" name="enrollDate" id="enrollDate" class="form-control datetimepicker-input" data-target="#reservationdate"/>
                        <div class="input-group-append" data-target="#reservationdate" data-toggle="datetimepicker">
                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                        </div>
                    </div>
                </div>
                    </div>
                    <div class="col-sm-6">
                  		<div class="form-group">
                        <label for="address">주소</label>
                        <input type="text" class="form-control textInput" placeholder="ADDRESS" name="address" id="address" required>
                      </div>
					</div>
                  </div>
                  <div class="row">
                    <div class="col-sm-4">
                      <!-- select -->
                      <div class="form-group">
                        <label>조직</label>
                        <select class="form-control" name="departmentNo">
                          <option value="0">없음</option>
                        </select>
                      </div>
                    </div>
                    <div class="col-sm-4">
                      <!-- select -->
                      <div class="form-group">
                        <label>직위</label>
                        <select class="form-control" name="positionNo">
                          <option value="0">없음</option>
                        </select>
                      </div>
                    </div>
                     <div class="col-sm-4">
                      <!-- select -->
                      <div class="form-group">
                        <label>직무</label>
                        <select class="form-control" name="jobNo">
                          <option value="0">없음</option>
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
                   		<label>계정 활성화 여부</label>
                   </div>
                   <div class="row">
                   		<div class="col-sm-6">
                      		<!-- radio -->
                      		<div class="form-group">
                        		<div class="custom-control custom-radio">
                          			<input class="custom-control-input" type="radio" id="customRadio1" name="activityYn" value="Y" checked>
                          			<label for="customRadio1" class="custom-control-label">활성화</label>
                        		</div>
                        		<div class="custom-control custom-radio">
                          			<input class="custom-control-input" type="radio" id="customRadio2" name="activityYn" activityYn="N">
                          			<label for="customRadio2" class="custom-control-label">비활성화</label>
                        		</div>
                      		</div>
                    	</div>
                   </div>

                  <div class="row">
                  	<div class="col-sm-6 col-lg-8"></div>
                  	<div class="col-sm-3 col-lg-2">
                  		<button type="submit" class="btn btn-block btn-primary">추가</button>
                  	</div>
                  	<div class="col-sm-3 col-lg-2">
                  		<button type="button" class="btn btn-block btn-secondary" id="cancle">취소</button>
                  	</div>
                  </div>
                  
                  
                </form>
              </div>
              <!-- /.card-body -->
            </div>
              
            </div>
            <!-- /.card -->
			</div>
			<div class="col-lg-3"></div>
		</div>
    </main>
    
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>
<!-- InputMask -->
  <script src="${root}/resources/plugins/moment/moment.min.js"></script>
  <!-- date-range-picker -->
  <script src="${root}/resources/plugins/daterangepicker/daterangepicker.js"></script>
  <!-- Tempusdominus Bootstrap 4 -->
  <script src="${root}/resources/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
    
	<script type="text/javascript">
		$(document).ready(function () { 
			$("#cancle").on("click",function(){
				if(confirm("사용자 등록을 취소하시겠습니까?")){
					window.location.replace("/iag/admin/ps/userlist");
				}
			});
			$("#profile").on("click",function(){
				$("#file").click();
			});
			$("#file").change(function(){
				let fileTag = document.querySelector('input[name=profile]');
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
			$("#pwdCheck").change(function(){
				if(this.val() === $("#pwd").val()){
					pwdCheck="true"
				}else{
					pwdCheck="false";
				}
				
			})
		});
		

	</script>

	


	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
</body>
</html>