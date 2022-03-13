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
<c:set var="level" value="${maxLevel}"></c:set>
    <div class="container">
    	<br>
    	<h1>부서 관리 페이지</h1>
    	<hr>
    	<br>
    	 <div class="row">
          <div class="col-4">
          	<c:forEach items="${deptList}" var="dept">
          		<c:if test="${dept.topDepartment eq 0}">
          			<div class="col-12 div-border">
          				<span class="hidden">${dept.departmentNo}</span>
          				<span>${dept.departmentName}</span>
          				<c:if test="${dept.leaf eq 1}">
            				<div class="col-12 div-border" id="${dept.departmentNo}">내용</div>
          				</c:if>
            		</div>
            		
          		</c:if>
          	</c:forEach>
          </div>
        </div>
        <!-- /.row -->
    </div>

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>

	<script type="text/javascript">
		window.onload = function(){
			var arr = new Array();
			<c:forEach items="${deptList}" var="dept">
				if(${dept.topDepartment} > 0){
					arr.push({
						departmentNo : "${dept.departmentNo}",
						departmentName : "${dept.departmentName}",
						topDepartment : "${dept.topDepartment}",
						leaf : "${dept.leaf}"
					});
				}
			</c:forEach>
			
			for(let i=0; i< arr.length; i++){
				$('#'+ arr[i].topDepartment).text(arr[i].departmentName);
				if(arr[i].leaf === 1){
					
				}
				
			}
		}
		
	</script>

	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
</body>
</html>