<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IAMGROUPE-임직원 정보보기</title>
<link rel="stylesheet" href="${root}/resources/css/ps/viewuser.css">
</head>
<body>
<%@ include file="/WEB-INF/views/common/headerSide.jsp" %>
    <div class="container">
    	<br>
    	<h1>임직원 정보 보기</h1>
    	<hr>
    	<br>
    	 <div class="row">
          <div class="col-3">
          <div class="row back">
          	<div class="col-12">
          	<ul class="tree">
          	<c:forEach items="${deptList}" var="dept">
          		<c:if test="${dept.topDepartment eq 0}">
    				<li><button class="deptClick" value="${dept.departmentNo}">${dept.departmentName}</button>
    					<c:if test="${dept.leaf eq 0}">
    						<ul id="dept-${dept.departmentNo}"></ul>
    					</c:if>
    				</li>
        		</c:if>
        	</c:forEach>
		  </ul>
          	</div>
          	
          </div>
         
          </div>
          <div class="col-1"></div>
          <div class="col-8">
        		<div class="row">
        			<div class="col-12">
        				<div class="card">
              				<div class="card-header">
              					<span class="hidden" id="deptNo">${deptList[0].departmentNo}</span>
                				<h2 class="card-title" id="deptName">${deptList[0].departmentName}</h2>
              				</div>
              				<div class="card-body">
              					<h3>소속 임직원</h3>
              					<br>
              					<br>
              					<div class="row" id="userList">
              						<c:forEach items="${userList}" var="u">
                						<c:if test="${u.departmentNo eq deptList[0].departmentNo}">
                							<div class="col-6 p-2">
                								<div class="row clickUser">
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
                						</c:if>
                					</c:forEach>
              					</div>
              				</div>
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
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                        <label for="userNo">사원번호</label>
                        <input type="text" class="form-control textInput" placeholder="ID" name="userNo" id="userNo" readonly required/>
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
                        <input type="text" class="form-control textInput" placeholder="NAME" name="name" id="name"/>
                      </div>          
                    </div>
                   	<div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                        <label for="phone">전화 번호</label>
                        <input type="text" class="form-control textInput" placeholder="PHONE" name="phone" id="phone" required/>
                      </div>       
                    </div>
                  </div>
                  <div class="row">
                    
                    <div class="col-sm-6">
                  		<div class="form-group">
                        <label for="email">이메일</label>
                        <input type="text" class="form-control textInput" placeholder="EMAIL" name="email" id="email" required/>
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
                   		
                    	<div class="col-sm-6">
                    		<div class="form-group">
                      			<label for="endDate">퇴직일</label>
                    				<div class="input-group date" id="endDateDiv" data-target-input="nearest">
                        			<input type="text" name="endDateStr" id="endDate" class="form-control datetimepicker-input" data-target="#endDateDiv" placeholder="dd/MM/yyyy"/>
                        			<div class="input-group-append" data-target="#endDateDiv" data-toggle="datetimepicker">
                            			<div class="input-group-text"><i class="fa fa-calendar"></i></div>
                        				</div>
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
            </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>

	<script type="text/javascript">
		$(function(){
			var arr = new Array();
			<c:forEach items="${deptList}" var="dept">
				arr.push({
					departmentNo : "${dept.departmentNo}",
					departmentName : "${dept.departmentName}",
					topDepartment : "${dept.topDepartment}",
					leaf : "${dept.leaf}"
				});
			</c:forEach>
			var arr2 = new Array();
			<c:forEach items="${userList}" var="user">
				arr2.push({
					profile : "${user.profile}",
					name : "${user.name}",
					positionName : "${user.positionName}",
					departmentName : "${user.departmentName}",
					phone : "${user.phone}",
					departmentNo: "${user.departmentNo}"
				});
			</c:forEach>
			
			for(let i=0; i< arr.length; i++){
				if(arr[i].topDepartment > 0){
					let li = document.createElement('li');
					let btn = document.createElement('button');
					btn.className = "deptClick";
					btn.value = arr[i].departmentNo;
					btn.append(arr[i].departmentName);
					li.append(btn);
					let dept = $('#dept-'+ arr[i].topDepartment);
					if(arr[i].leaf === '0'){
						let ul = document.createElement('ul');
						ul.id = "dept-"+arr[i].departmentNo;
						li.append(ul);
					}
					dept.append(li);
				}
			}
			
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
			$(document).on("click", ".deptClick" ,function(){
				let dept = $(this).val();
				let userDiv = $("#userList");
				for(let i=0; i< arr.length; i++){
					if(arr[i].departmentNo === dept){
						$("#deptNo").text(arr[i].departmentNo);
						$("#deptName").text(arr[i].departmentName);
						$("#deptModi").val(arr[i].departmentNo);
						$("#deptTop").val(arr[i].departmentNo);
						$("#detpDel").val(arr[i].departmentNo);
					}
				}
				userDiv.text('');
				for(let i=0; i< arr2.length; i++){
					if(arr2[i].departmentNo === dept){
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
						img.src = "${root}/resources/img/ps/profile/" + arr2[i].profile;
						boxDiv.append(img);
						div1.append(boxDiv);
						let div2 = document.createElement("div");
						div2.className = "col-6";
						let span1 = document.createElement("span");
						let br1 = document.createElement("br");
						let br2 = document.createElement("br");
						let br3 = document.createElement("br");
						span1.className = "info";
						span1.append(arr2[i].name);
						div2.append(span1);
						div2.append(br1);
						let span2 = document.createElement("span");
						span2.className = "info";
						span2.append(arr2[i].positionName);
						div2.append(span2);
						div2.append(br2);
						let span3 = document.createElement("span");
						span3.className = "info";
						span3.append(arr2[i].departmentName);
						div2.append(span3);
						div2.append(br3);
						let span4 = document.createElement("span");
						span4.className = "info";
						span4.append(arr2[i].phone);
						div2.append(span4);
						divrow.append(div1);
						divrow.append(div2);
						divcol.append(divrow);
						userDiv.append(divcol);
					}
				}
				
			});
			
			$(document).on("click", ".clickUser", function(){
				console.log('123');
			});
			
		});
	</script>

	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
</body>
</html>