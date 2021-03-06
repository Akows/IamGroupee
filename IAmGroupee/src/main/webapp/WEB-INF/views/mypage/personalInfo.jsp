<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>IAMGROUPE-개인정보 수정</title>
<link rel="stylesheet" href="${root}/resources/css/ps/userenroll.css">

</head>
<body>
<%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

     <div class="container">
     	<br>
       <h1>개인정보 수정</h1>
       <hr>
       <br>
		<div class="row">
			<div class="col-lg-3"></div>
			<div class="col-lg-6">
			 <div class="card card-primary">
              <!-- /.card-header -->
              <div class="card-body">
                <form action="${root}/my/modiuser" method="post" enctype="multipart/form-data">
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                        <label for="userNo">사원번호</label>
                        <input type="text" class="form-control textInput" placeholder="ID" name="userNo" id="userNo" readonly>
                      </div>
                      <div class="form-group">
                      	<span id="idDup"></span>
                      </div>
                      <div class="form-group">
                        <label for="pwd">비밀번호</label>
                        <input type="password" class="form-control textInput" placeholder="PASSWORD" name="pwd" id="pwd">
                      </div>
                      <div class="form-group">
                        <label for="pwdCheck">비밀번호 확인</label>
                        <input type="password" class="form-control textInput" placeholder="PASSWORD CHECK" name="pwdCheck" id="pwdCheck">
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
                        <input type="text" class="form-control textInput" placeholder="NAME" name="name" id="name" required>
                      </div>          
                    </div>
                    <div class="col-sm-6">
                  		<div class="form-group">
                        <label for="residentNo">주민등록번호</label>
                        <input type="text" class="form-control textInput" placeholder="주민등록번호" name="residentNo" id="residentNo" required>
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
                        <input type="text" class="form-control textInput" placeholder="PHONE" name="phone" id="phone" required>
                      </div>   
                      <div class="form-group">
                      	<span id="phoneEx"></span>
                      </div>       
                    </div>
                    <div class="col-sm-6">
                  		<div class="form-group">
                        <label for="email">이메일</label>
                        <input type="text" class="form-control textInput" placeholder="EMAIL" name="email" id="email" required>
                      </div>
                      <div class="form-group">
                      	<span id="emailEx"></span>
                      </div>
					</div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                  		<div class="form-group">
                        <label for="address">주소</label>
                        <input type="text" class="form-control textInput" placeholder="ADDRESS" name="address" id="address" required>
                      </div>
					</div>
                  </div>

                  <div class="row">
                  	<div class="col-sm-6 col-lg-8"></div>
                  	<div class="col-sm-3 col-lg-2">
                  		<button type="submit" class="btn btn-block btn-primary" id="add">수정</button>
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
			var idCheck =true;
			var resiCheck =true;
			var emailCheck =true;
			var phoneCheck =true;
			var check = false;
			var userNo = '${user.userNo}';
			var name = '${user.name}';
			var residentNo = '${user.residentNo}';
			var phone = '${user.phone}';
			var email = '${user.email}';
			var address = '${user.address}';
			var profile = '${user.profile}';

				
			$("#userNo").val(userNo);
			$("#name").val(name);
			$("#residentNo").val(residentNo);
			$("#phone").val(phone);
			$("#email").val(email);
			$("#address").val(address);
			$("#userImg").attr("src", "${root}/resources/img/ps/profile/"+profile);
			
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
			$("#add").on("click", function(){
				if(!(pwdCheck && idCheck && resiCheck && emailCheck && phoneCheck)){
					alert("입력을 확인해주세요.");
					return false;
				}
			});
			var regex1= /^\d{2}([0]\d|[1][0-2])([0][1-9]|[1-2]\d|[3][0-1])[-]*[1-4]\d{6}/g;
			var regex2= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var regex3= /^\d{2,3}-\d{3,4}-\d{4}$/;
			$("#residentNo").change(function(){
				if(!regex1.test($(this).val())){
					resiCheck = false;
					$("#resiEx").text("올바르지 않은 주민등록번호입니다.");
					$("#resiEx").css("color", "red");
				} else{
					resiCheck = true;
					$("#resiEx").text("올바른 주민등록번호입니다.");
					$("#resiEx").css("color", "green");
				}
			});
			$("#email").change(function(){
				if(!regex2.test($(this).val())){
					emailCheck = false;
					$("#emailEx").text("올바르지 않은 이메일입니다.");
					$("#emailEx").css("color", "red");
				} else{
					emailCheck = true;
					$("#emailEx").text("올바른 이메일입니다.");
					$("#emailEx").css("color", "green");
				}
			});
			$("#phone").change(function(){
				if(!regex3.test($(this).val())){
					phoneCheck = false;
					$("#phoneEx").text("올바르지 않은 전화번호입니다.");
					$("#phoneEx").css("color", "red");
				} else{
					phoneCheck = true;
					$("#phoneEx").text("올바른 전화번호입니다.");
					$("#phoneEx").css("color", "green");
				}
			});
			$("#residentNo").keyup(function(){
				$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(\d{6})(\d+)/g,"$1-$2").replace("--", "-") );
			})
			$("#phone").keyup(function() { 
				$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); 
			});
		});
	</script>

	


	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
</body>
</html>