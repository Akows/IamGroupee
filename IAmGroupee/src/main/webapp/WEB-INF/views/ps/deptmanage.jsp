<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IAMGROUPE-부서 관리</title>
<link rel="stylesheet" href="${root}/resources/css/ps/deptmanage.css">
</head>
<body>
<%@ include file="/WEB-INF/views/common/headerSide.jsp" %>
    <div class="container">
    	<br>
    	<h1>부서 관리 페이지</h1>
    	<hr>
    	<br>
    	 <div class="row">
          <div class="col-3">
          <div class="row back">
          	<div class="col-12">
          	<a class="addLink float-right">부서 추가 +</a>
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
        				<div class="card overflow">
              				<div class="card-header">
              					<span class="hidden" id="deptNo">${deptList[0].departmentNo}</span>
                				<h2 class="card-title" id="deptName">${deptList[0].departmentName}</h2>
                				<div class="card-tools">
                  				<button type="button" class="btn btn-primary" id="deptModi" value="${deptList[0].departmentNo}">이름 변경</button>
                  				<button type="button" class="btn btn-primary" id="deptTop" value="${deptList[0].departmentNo}">상위 조직 변경</button>
                  				<button type="button" class="btn btn-primary" data-del="${deptList[0].departmentName}" id="detpDel" value="${deptList[0].departmentNo}">삭제</button>
                				</div>
              				</div>
              				<div class="card-body">
              					<h3>소속 임직원</h3>
              					<br>
              					<br>
              					<div class="row" id="userList">
              						<c:forEach items="${userList}" var="u">
                						<c:if test="${u.departmentNo eq deptList[0].departmentNo}">
                							<div class="col-3 p-4">
                								<div class="box">
    												<img class="profile" src="${root}/resources/img/ps/profile/${u.profile}">
												</div>
                							</div>
                							<div class="col-3 p-4">
                							<span class="info">${u.name}</span> <br>
                							<span class="info">${u.positionName}</span> <br>
                							<span class="info">${u.departmentName}</span><br>
                							<span class="info">${u.phone}</span><br>
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
    
    <div class="modal fade" id="modal-addDept">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">부서 추가</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form action="${root}/admin/ps/addDept" method="get">
            <div class="modal-body">
              	<div class="col-12">
              		<div class="form-group">
                        <label>상위 조직</label>
                        <select class="form-control" name="topDepartment">
                          <option value="0">없음</option>
                          <c:forEach items="${deptList}" var="d">
                          	<option value="${d.departmentNo}">${d.departmentName}</option>
                          </c:forEach>
                        </select>
                     </div>
                  	<div class="form-group">
                  		
                       <label for="departmentName">부서 이름</label>
                       <input type="text" class="form-control textInput" placeholder="부서 이름 입력" name="departmentName" id="departmentName" required>
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
      
      <div class="modal fade" id="modal-deptNameModi">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">부서 이름 변경</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form action="${root}/admin/ps/deptNameModi" method="get">
            <div class="modal-body">
              	<div class="col-12">
                  	<div class="form-group">
                  		<input type="text" class="hidden" name="departmentNo" id="departmentNo1">
                       <label for="departmentName">부서 이름</label>
                       <input type="text" class="form-control textInput" placeholder="부서 이름 입력" name="departmentName" id="departmentName" required>
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
      
      <div class="modal fade" id="modal-deptTopModi">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">상위 부서 변경</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form action="${root}/admin/ps/deptTopModi" method="get">
            <div class="modal-body">
              	<div class="col-12">
              		<input type="text" class="hidden" name="departmentNo" id="departmentNo2">
              		<div class="form-group">
                        <label>상위 조직 변경</label>
                        <select class="form-control" name="topDepartment" id="topDepartment">
                          <option value="0">없음</option>
                          <c:forEach items="${deptList}" var="d">
                          	<option value="${d.departmentNo}">${d.departmentName}</option>
                          </c:forEach>
                        </select>
                     </div>
                </div>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
              <button type="submit" class="btn btn-primary">상위 부서 변경</button>
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
						$("#topDepartment").val(arr[i].topDepartment).prop("selected", true);
					}
				}
				userDiv.text('');
				for(let i=0; i< arr2.length; i++){
					if(arr2[i].departmentNo === dept){
						let div1 = document.createElement("div");
						div1.className = "col-3 p-4";
						let boxDiv = document.createElement("div");
						boxDiv.className = "box"
						let img = document.createElement("img");
						img.className = "profile";
						img.src = "${root}/resources/img/ps/profile/" + arr2[i].profile;
						boxDiv.append(img);
						div1.append(boxDiv);
						let div2 = document.createElement("div");
						div2.className = "col-3 p-4";
						let span1 = document.createElement("span");
						let br1 = document.createElement("br");
						let br2 = document.createElement("br");
						let br3 = document.createElement("br");
						let br4 = document.createElement("br");
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
						div2.append(br4);
						userDiv.append(div1);
						userDiv.append(div2);
					}
				}
				
			});
			
			$(document).on("click",".addLink", function(){
				$("#modal-addDept").modal();
			});
			
			$(document).on("click","#deptModi", function(){
				let deptNo = $(this).val();
				$("#departmentNo1").val(deptNo);
				$("#modal-deptNameModi").modal();
			});
			
			$(document).on("click","#deptTop", function(){
				let deptNo = $(this).val();
				$("#departmentNo2").val(deptNo);
				$("#modal-deptTopModi").modal();
			});
			
			$(document).on("click","#detpDel", function(){
				let deptNo = $(this).val();
				let deptName = $("#deptName").text();
				let str = "소속 임직원들의 부서가 전부 사라지고 \n하위 부서들이 전부 삭제 됩니다. \n["+deptName+"] 삭제하시겠습니까?"
				if(confirm(str)){
					$.ajax({ 
						url: "${root}/admin/ps/deptDelete", 
						type: "GET", 
						data: {"departmentNo":deptNo}, 
						success: function(data){ 
							if(data === "true"){
								window.location.replace("${root}/admin/ps/deptmanage");
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