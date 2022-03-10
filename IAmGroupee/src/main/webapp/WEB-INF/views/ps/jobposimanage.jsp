<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IAMGROUPE-직위/직무 관리</title>
<link rel="stylesheet" href="${root}/resources/css/ps/jobposimanage.css">
 <!-- Font Awesome -->
 <link rel="stylesheet" href="${root}/resources/plugins/fontawesome-free/css/all.min.css">
</head>
<body>
<%@ include file="/WEB-INF/views/common/headerSide.jsp" %>
<c:set var="rating" value="${lastLevel}" />
     	<div class="container">
     		<br>
       		<h1>직위 관리</h1>
       		<hr>
       		<br>
                <div class="row" id="positionDiv">
                <div class ="col-2"></div>
                <div class="col-8 col-row">
                <h5><a class="levelAddLink float-right">등급 추가 +</a></h5>
                </div>
                <div class ="col-2"></div>
                  	<c:forEach begin="1" end="${lastLevel}" var="c">
                  	<div class ="col-2"></div>
                  	<div class="col-8 col-row">
						<span class="posi-hidden">${c}</span>
						<span class="posi-element">${c}등급</span> 
						<c:forEach items="${posiList}" var="posi">
							<c:if test="${posi.positionLevel eq c}">
								<span class="posi-element">${posi.positionName}
									<span class="posi-hidden">${posi.positionName}</span>
									<button type="button" class="btn btn-tool posiDelete" value="${posi.positionNo}">
                    					<i class="fas fa-times"></i>
                  					</button></span> 
							</c:if>
						</c:forEach>
						<button class="float-right posiAdd"><i class="fas fa-plus"></i></button>
					</div>
					<div class ="col-2"></div>
					</c:forEach>
				</div>
			<br>
			<div class="row col-row">
				<div class="col-10">
					<h1>직무 관리</h1>
				</div>
				<div class="col-2">
					<h5><a class="jobAdd float-right" data-toggle="modal" data-target="#modal-job">직무 추가 +</a></h5> 
				</div>
			</div>
       		<br>
			<div class="row">
					<c:forEach items="${jobList}" var="job">
						<div class="col-lg-2">
            				<div class="card card-primary">
              					<div class="card-header">
                					<h3 class="card-title job-element">${job.jobName}</h3>
                					<div class="card-tools">
                  						<button type="button" class="btn btn-tool jobDelete" value="${job.jobNo}">
                    						<i class="fas fa-times"></i>
                  						</button>
                					</div>
                					<!-- /.card-tools -->
              					</div>
              					<!-- /.card-header -->	
            				</div>
          				</div>
					</c:forEach>
			</div>
		</div>
		
		<div class="modal fade" id="modal-job">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">직무 추가</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
              <button type="button" class="btn btn-primary">추가</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
      
      <div class="modal fade" id="modal-posi">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Default Modal</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <p>One fine body&hellip;</p>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
              <button type="button" class="btn btn-primary">추가</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
    
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
        
	<script type="text/javascript">
		$(document).ready(function () { 
			var rating = <c:out value="${rating}"/>;
			$(".levelAddLink").click(function(){
				if(rating < 10){
					rating += 1;
					var div1 = document.createElement("div");
					div1.className = "col-2";
					var div2 = document.createElement("div");
					div2.className = "col-8 col-row";
					var div3 = document.createElement("div");
					div3.className = "col-2";
					var span1 = document.createElement("span");
					span1.className="posi-hidden";
					span1.append(rating);
					var span2 = document.createElement("span");
					span2.className="posi-element";
					span2.append(rating+"등급");
					var btn = document.createElement("button");
					btn.className="float-right posiAdd";
					btn.data
					 data-toggle="modal" data-target="#modal-posi
					var i = document.createElement("i");
					i.className="fas fa-plus";
					btn.appendChild(i);
					div2.appendChild(span1);
					div2.appendChild(span2);
					div2.appendChild(btn);

					$("#positionDiv").append(div1);
					$("#positionDiv").append(div2);
					$("#positionDiv").append(div3);
				}else{
					alert("직위 등급은 최대 10등급 까지만 생성 가능합니다.");
				}
			});
			$(".jobDelete").click(function(){
				let name = $(this).parent().parent().children("h3:eq(0)").text();
				let val = $(this).val();
				let warning = "삭제할 경우 이 직무를 가지고 있던 임직원은 직무가 없어집니다.\n["+ name +"] 삭제하시겠습니까?"
				if(confirm(warning)){
					$.ajax({ 
						url: "${root}/admin/ps/jobdelete", 
						type: "GET", 
						data: {"jobNo":val}, 
						success: function(data){ 
							if(data === "true"){
								window.location.replace("${root}/admin/ps/jobposimanage");
							}else{
								alert("실패");
							}
						}, 
						error: function (request){ 
							alert("에러:"+request);
						} 
					});
				}else {
					
				}
				
			});
			$(".posiDelete").click(function(){
				let name = $(this).prev().text();
				let warning = "삭제할 경우 이 직위를 가지고 있던 임직원은 직위가 없어집니다.\n["+ name +"] 삭제하시겠습니까?"
				let val = $(this).val();
				if(confirm(warning)){
					$.ajax({ 
						url: "${root}/admin/ps/posidelete", 
						type: "GET", 
						data: {"posiNo":val}, 
						success: function(data){ 
							if(data === "true"){
								window.location.replace("${root}/admin/ps/jobposimanage");
							}else{
								alert("실패");
							}
							
						}, 
						error: function (request){ 
							alert("에러:"+request);
						} 
					});
				}else {
					
				}
			});
			$(document).on("click",".posiAdd", function(){
				console.log($(this).parent().children("span:eq(0)").text());
			});
			$(".jobAdd").click(function(){
				
			})
		});
	</script>
	
	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
</body>
</html>