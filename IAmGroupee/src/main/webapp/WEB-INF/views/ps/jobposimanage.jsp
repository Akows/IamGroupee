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
</head>
<body>
<%@ include file="/WEB-INF/views/common/headerSide.jsp" %>
<c:set var="rating" value="${lastLevel}" />
    <!-- ! Main -->
    <main class="main users chart-page" id="skip-target">
     	<div class="container">
     		<br>
       		<h1>직위 관리</h1>
       		<hr>
       		<br>
			<div class="row">
				<div class="col-12">
					<div class="card">
              			<div class="card-header">
                			<a class="levelAddLink float-right">등급 추가 +</a>  
              			</div>
              			<!-- /.card-header -->
             			 <div class="card-body table-responsive p-0">
                			<table class="table table-hover text-nowrap">
                  				<c:forEach begin="1" end="${lastLevel}" var="c">
								<tr>
									<td class="posi-hidden">${c}</td>
									<th>${c}등급</th>
									<c:forEach items="${posiList}" var="posi">
										<c:if test="${posi.positionLevel eq c}">
											<td>${posi.positionName}</td>
										</c:if>
									</c:forEach>
								</tr>
								</c:forEach>
                			</table>
              			</div>
              			<!-- /.card-body -->
            		</div>
				</div>
			</div>
			<br>
       		<h1>직무 관리</h1>
       		<hr>
       		<br>
			<div class="row">
				<div class="col-12">
					
				</div>
			</div>
		</div>
    </main>
    
        
	<script type="text/javascript">
		$(document).ready(function () { 
			var rating = <c:out value="${rating}"/>;
			$(".levelAddLink").click(function(){
				if(rating < 10){
					rating += 1;
					
				}else{
					alert("직위 등급은 최대 10등급 까지만 생성 가능합니다.");
				}
				
			})
		});
	</script>
	
	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
</body>
</html>