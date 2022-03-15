<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IAMGROUPE-주소록</title>
<link rel="stylesheet" href="${root}/resources/css/mypage/addrbook.css">
</head>
<body>
<%@ include file="/WEB-INF/views/common/headerSide.jsp" %>
    <div class="container">
    	<br>
    	<h1>주소록</h1>
    	<hr>
    	<br>
    	 <div class="row">
          <div class="col-3">
          <div class="row back">
          	<div class="col-12">
          		<a class="addLink float-right">주소록 추가 +</a>
          	<ul class="tree">
          	<c:forEach items="${bookList}" var="book">
    			<li><button class="bookClick" value="${book.addressNo}">${book.addressName}</button></li>
        	</c:forEach>
		  </ul>
          	</div>
          	
          </div>
         
          </div>
          <div class="col-1"></div>
          <div class="col-8">
        		<div class="row">
        			<div class="col-12">
        				<div class="card overflow">
        					<c:if test="${empty bookList}">
        						<div class="card-header">
              						<span class="hidden" id="bookNo">0</span>
                					<h2 class="card-title" id="bookName">주소록 없음</h2>
              					</div>
              					<div class="card-body">
              						<h3 id="bookh3">주소록이 없습니다.</h3>
              						<br>
              						<br>
              					</div>
        					</c:if>
        					<c:if test="${not empty bookList}">
              				<div class="card-header">
              					<span class="hidden" id="bookNo">${bookList[0].addressNo}</span>
                				<h2 class="card-title" id="bookName">${bookList[0].addressName}</h2>
                				<div class="card-tools">
                  					<button type="button" class="btn btn-primary" id="bookNameModi" value="${bookList[0].addressNo}">이름 변경</button>
                  					<button type="button" class="btn btn-primary" id="bookUserModi" value="${bookList[0].addressNo}">주소록 수정</button>
                  					<button type="button" class="btn btn-primary" id="bookDel" value="${bookList[0].addressNo}">삭제</button>
                				</div>
              				</div>
              				<div class="card-body">
              					<h3 id="bookh3">${bookList[0].addressName}의 구성원</h3>
              					<br>
              					<br>
              					<div class="row" id="userList">
              						<c:forEach items="${bookList[0].getUserList()}" var="u">
                							<div class="col-6 p-2">
                								<div class="row clickUser">
                									<span class="hidden">${u.userNo}</span>
                									<div class="col-6">
                										<div class="box">
    														<img class="profile" src="${root}/resources/img/ps/profile/${u.profile}">
														</div>
                									</div>
                									<div class="col-6">
                										<span class="info">${u.name}</span> <br>
                										<span class="info">${u.positionName}</span> <br>
                										<span class="info">${u.departmentName}</span><br>
                										<span class="info">${u.phone}</span><br>
                									</div>
                								</div>
                							</div>
                					</c:forEach>
              					</div>
              				</div>
        					</c:if>
              			<!-- /.card-body -->
            			</div>
           				 <!-- /.card -->
        			</div>
        		</div>
        	</div>
        </div>
        <!-- /.row --> 	
    </div>
    
    
    
    <div class="modal fade" id="modal">
        <div class="modal-dialog modal-lg modal-dialog-centered">
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
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                        <label for="userNo">사원번호</label> <br>
                        <span class="textspan" id="userNo"></span>
                      </div>
                      <div class="form-group">
                        <label for="userDeptName">부서</label> <br>
                        <span class="textspan" id="userDeptName"></span>
                      </div>
                      <div class="form-group">
                        <label for="posiName">직위</label> <br>
                        <span class="textspan" id="posiName"></span>
                      </div>
                      <div class="form-group">
                        <label for="jobName">직무</label> <br>
                        <span class="textspan" id="jobName"></span>
                      </div>
                    </div>
                    <div class="col-sm-6">
                  		<div class="box1" style="background: #BDBDBD;">
    						<img class="profile" id="userImg" src="${root}/resources/img/ps/profile/user.png">
						</div>
					</div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                        <label for="name">이름</label> <br>
                        <span class="textspan" id="name"></span>
                      </div>          
                    </div>
                   	<div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                        <label for="phone">전화 번호</label> <br>
                        <span class="textspan" id="phone"></span>
                      </div>       
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                  		<div class="form-group">
                        <label for="email">이메일</label> <br>
                        <span class="textspan" id="email"></span>
                      </div>
					</div>
					<div class="col-sm-6">
                  		<div class="form-group">
                        <label for="address">주소</label> <br>
                        <span class="textspan" id="address"></span>
                      </div>
					</div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                      	<label for="enrollDate">입사일</label> <br>
                    	<span class="textspan" id="enrollDate"></span>
                    	</div>
                	</div>
                	<div class="col-sm-6">
                    	<div class="form-group">
                      		<label for="endDate">퇴직일</label> <br>
                    		<span class="textspan" id="endDate"></span>
                    	</div>
                    </div>
                   </div>
                    
                  </div>
              </div>
              <!-- /.card-body -->
              
            </div>
            <!-- /.card -->
			</div>
            </div>
            </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
      
      <div class="modal fade" id="modal-addBook">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">주소록 추가</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form action="${root}/my/addBook" method="get">
            <div class="modal-body">
              	<div class="col-12">
                  	<div class="form-group">
                       <label for="addressName">주소록 이름</label>
                       <input type="text" class="form-control textInput" placeholder="주소록 이름 입력" name="addressName" id="addressName" required>
                   </div>
                   <div class="form-group userList">
                   		<c:forEach items="${allUserList}" var="user">
                   			<input type="checkbox" name="user" value="${user.userNo}" id="${user.userNo}"/>
                   			<label for="${user.userNo}">${user.name} / 
                   			<c:if test="${empty user.departmentName}">소속 없음 /</c:if> 
                   			<c:if test="${not empty user.departmentName}">${user.departmentName} /</c:if> 
                   			<c:if test="${empty user.positionName}">직위 없음</c:if> 
                   			<c:if test="${not empty user.positionName}">${user.positionName}</c:if> 
                   			</label> <br>
                   		</c:forEach>
                    </div>
                </div>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
              <button type="submit" class="btn btn-primary">추가</button>
            </div>
            </form>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
      
      <div class="modal fade" id="modal-bookNameModi">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">주소록 이름 변경</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form action="${root}/my/bookNameModi" method="get">
            <div class="modal-body">
              	<div class="col-12">
                  	<div class="form-group">
                  		<input type="text" class="hidden" name="addressNo" id="addressNo1">
                       <label for="addressName">주소록 이름 변경</label>
                       <input type="text" class="form-control textInput" placeholder="변경 주소록 이름 입력" name="addressName" id="addressName" required>
                   </div>
                </div>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
              <button type="submit" class="btn btn-primary">이름 변경</button>
            </div>
            </form>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
      
      <div class="modal fade" id="modal-bookUserModi">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">주소록 수정</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form action="${root}/my/bookUserModi" method="get">
            <div class="modal-body">
              	<div class="col-12">
              		<input type="text" class="hidden" name="addressNo" id="addressNo2">
              		<div class="form-group userList">
                   		<c:forEach items="${allUserList}" var="user">
                   			<input type="checkbox" name="user" class="user" value="${user.userNo}"  id="user-${user.userNo}"/>
                   			<label for="user-${user.userNo}">${user.name} / 
                   			<c:if test="${empty user.departmentName}">소속 없음 /</c:if> 
                   			<c:if test="${not empty user.departmentName}">${user.departmentName} /</c:if> 
                   			<c:if test="${empty user.positionName}">직위 없음</c:if> 
                   			<c:if test="${not empty user.positionName}">${user.positionName}</c:if> 
                   			</label> <br>
                   		</c:forEach>
                    </div>
                </div>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
              <button type="submit" class="btn btn-primary">주소록 수정</button>
            </div>
            </form>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>

	<script type="text/javascript">
		$(function(){
			var arr = new Array();
			
			<c:forEach items="${bookList}" var="book">
				var user = new Array();
				<c:forEach items="${book.userList}" var="user">
					user.push({
					userNo : "${user.userNo}",
					profile : "${user.profile}",
					name : "${user.name}",
					positionName : "${user.positionName}",
					departmentName : "${user.departmentName}",
					jobName : "${user.jobName}",
					enrollDate : "${user.enrollDateToString()}",
					<c:if test="${user.endDate ne null}">
						endDate : "${user.endDateToString()}",
					</c:if>
					phone : "${user.phone}",
					email : "${user.email}",
					address : "${user.address}",
					departmentNo: "${user.departmentNo}"
					});
				</c:forEach>
				arr.push({
					addressNo : "${book.addressNo}",
					addressName : "${book.addressName}",
					user : user
					});
			</c:forEach>

			
			$('.tree').each(function(){
			    var $this = $(this);
			    $this.find('li').each(function(){   //li에
			        if(!$(this).children('ul').length){ //자식 ul 없으면
			            $(this).addClass('final');  //final 클래스 부여한다
			        }
			        if($(this).is(':last-child')){  //마지막 li이면
			            $(this).addClass('last');   //last 클래스 부여한다
			        }
			        $(this).append('<span></span>');
			    });
			    $this.find('li>span').on('click',function(){ //span 클릭하면
			        if($(this).parent('li').hasClass('unfold')){    //하위메뉴 열려 있을 경우
			            $(this).parent('li').removeClass('unfold'); //닫고
			        }
			        else {  //하위메뉴 닫혀 있을 경우
			            $(this).parent('li').addClass('unfold');    //연다
			        }
			    });
			});
			$(document).on("click", ".bookClick" ,function(){
				let book = $(this).val();
				let userDiv = $("#userList");

				userDiv.text('');
				for(let j=0; j<arr.length; j++){
					if (arr[j].addressNo === book) {
						$("#bookNo").text(arr[j].addressNo);
						$("#bookName").text(arr[j].addressName);
						$("#bookNameModi").val(arr[j].addressNo);
						$("#bookUserModi").val(arr[j].addressNo);
						$("#bookDel").val(arr[j].addressNo);
						$("#bookh3").text(arr[j].addressName+"의 구성원");
						for(let i=0; i< arr[j].user.length; i++){
								let divcol = document.createElement("div");
								divcol.className = "col-6 p-2";
								let divrow = document.createElement("div");
								divrow.className = "row clickUser";
								let div1 = document.createElement("div");
								div1.className = "col-6";
								let boxDiv = document.createElement("div");
								boxDiv.className = "box"
								let img = document.createElement("img");
								img.className = "profile";
								img.src = "${root}/resources/img/ps/profile/" +arr[j].user[i].profile;
								boxDiv.append(img);
								div1.append(boxDiv);
								let div2 = document.createElement("div");
								div2.className = "col-6";
								let span1 = document.createElement("span");
								let br1 = document.createElement("br");
								let br2 = document.createElement("br");
								let br3 = document.createElement("br");
								span1.className = "info";
								span1.append(arr[j].user[i].name);
								div2.append(span1);
								div2.append(br1);
								let span2 = document.createElement("span");
								span2.className = "info";
								span2.append(arr[j].user[i].positionName);
								div2.append(span2);
								div2.append(br2);
								let span3 = document.createElement("span");
								span3.className = "info";
								span3.append(arr[j].user[i].departmentName);
								div2.append(span3);
								div2.append(br3);
								let span4 = document.createElement("span");
								span4.className = "info";
								span4.append(arr[j].user[i].phone);
								let spanUser = document.createElement("span");
								spanUser.className = "hidden";
								spanUser.append(arr[j].user[i].userNo);
								div2.append(span4);
								divrow.append(spanUser);
								divrow.append(div1);
								divrow.append(div2);
								divcol.append(divrow);
								userDiv.append(divcol);
						}
					}
					
					
				}
				
				
			});
			
			$(document).on("click", ".clickUser", function(){
				let userNo = $(this).children("span:eq(0)").text();
				let bookName = $("#bookName").text();
				let bookNo = $("#bookNo").text();
				for(let j=0; j<arr.length; j++){
					if (arr[j].addressNo === bookNo) {
						for(let i=0; i< arr[j].user.length; i++){
							if(arr[j].user[i].userNo === userNo){
								$("#userNo").text(arr[j].user[i].userNo);
								$("#userDeptName").text(arr[j].user[i].departmentName);
								$("#posiName").text(arr[j].user[i].positionName);
								$("#jobName").text(arr[j].user[i].jobName);
								$("#userImg").attr("src", "${root}/resources/img/ps/profile/"+arr[j].user[i].profile);
								$("#name").text(arr[j].user[i].name);
								$("#phone").text(arr[j].user[i].phone);
								$("#email").text(arr[j].user[i].email);
								$("#address").text(arr[j].user[i].address);
								$("#enrollDate").text(arr[j].user[i].enrollDate);
								$("#endDate").text(arr[j].user[i].endDate);

							}
						}
					}
					
				}
				
				$("#modal").modal();
				
			});
			
			$(document).on("click",".addLink", function(){
				$("#modal-addBook").modal();
			});
			
			$(document).on("click","#bookNameModi", function(){
				let bookNo = $(this).val();
				$("#addressNo1").val(bookNo);
				$("#modal-bookNameModi").modal();
			});
			
			$(document).on("click","#bookUserModi", function(){
				let bookNo = $(this).val();
				$("#addressNo2").val(bookNo);
				$(".user").prop("checked", false);
				for(let j=0; j<arr.length; j++){
					if (arr[j].addressNo === bookNo) {
						for(let i=0; i< arr[j].user.length; i++){
							$("#user-"+arr[j].user[i].userNo).prop("checked",true);
						}
					}
					
				}
				$("#modal-bookUserModi").modal();
			});
			
			$(document).on("click","#bookDel", function(){
				let bookNo = $(this).val();
				let bookName = $("#bookName").text();
				let str = "주소록이 삭제되면 복구할 수 없습니다. \n["+bookName+"] 삭제하시겠습니까?"
				if(confirm(str)){
					$.ajax({ 
						url: "${root}/my/bookDelete", 
						type: "GET", 
						data: {"addressNo":bookNo}, 
						success: function(data){ 
							if(data === "true"){
								window.location.replace("${root}/my/addrbook");
							}else{
								alert("실패");
							}
							
						}, 
						error: function (request){ 
							alert("에러:"+request);
						} 
					});
				}
			});
			
		});
	</script>

	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
</body>
</html>