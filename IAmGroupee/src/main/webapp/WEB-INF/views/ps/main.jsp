<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IAMGROUPE-인사 관리</title>
</head>
<body>
 	<%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

    <!-- ! Main -->
    <main class="main users chart-page" id="skip-target">
     <div class="container">
     	<br>
       <h1>인사 관리 메인페이지</h1>
       <hr>
       <br>
       <a href="${root}/admin/ps/userlist">임직원 관리</a><br>
       <a href="${root}/admin/ps/deptmanage">부서 관리</a><br>
       <a href="${root}/admin/ps/jobmanage">직무 관리</a><br>
       <a href="${root}/admin/ps/posimanage">직위 관리</a><br>
      </div>
    </main>

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>

	<!-- Custom scripts -->
</body>
</html>
