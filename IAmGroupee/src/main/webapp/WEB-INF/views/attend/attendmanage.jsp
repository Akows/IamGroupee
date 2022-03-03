<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>근태관리 관리자페이지</title>
  
  <c:set var="root" value="${pageContext.request.contextPath}"/>
  
  <!-- Favicon -->
  <link rel="shortcut icon" href="../resources/img/svg/looo.png" type="image/x-icon">
  <!-- Custom styles -->
  <link rel="stylesheet" href="../resources/css/style.min.css">

<script>

</script>
<style>

</style>

</head>
<body>

<!-- 메인 메뉴바(좌측 사이드) -->
<%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

<main class="main users chart-page" id="skip-target">
	<div class="container">
	       
		<hr>     
		<div style="height: 40px; text-align: left;">
			<h1>근태관리 관리자페이지</h1> <br> 오늘 날짜 <h4 style="color: rgb(50, 48, 48); font-weight: 600;" id="currentDate"></h4>
		</div>
		<br>
		<br>
		<hr>

		<div class="row stat-cards">
		<div class="col-lg-12">
            <div class="users-table table-wrapper">
            
              <table class="posts-table">
                <thead>
                  <tr class="users-table-info">
                    <th>신청일</th>
                    <th>신청자</th>
                    <th>신청사유</th>
                    <th>첨부파일</th>
                    <th>현재상태</th>
                    <th>결과처리</th>
                  </tr>
                </thead>
                
                <tbody>
	                <c:forEach items="${atModList}" var="modlist">
						<tr>
							<td>${modlist.req_date}</td>
							<td>${modlist.user_name}</td>
							<td>${modlist.mod_reason}</td>
							<td><input type="button" id="filepage" value="${modlist.attach_file}"></td>
							<td>${modlist.approve_state}</td>
							<td>
		                    	<span class="p-relative">
			                        <button class="dropdown-btn transparent-btn" type="button" title="More info">
			                          <div class="sr-only">More info</div>
			                          <i data-feather="more-horizontal" aria-hidden="true"></i>
			                        </button>
			                        <ul class="users-item-dropdown dropdown">
			                          <li><a href="##">요청 승인</a></li>
			                          <li><a href="##">요청 반려</a></li>
			                        </ul>
			                    </span>
                            </td>
						</tr>

						<form action="attachfile" method="get" id="autoform">
                			<input type="hidden" name="attend_mod_num" value="${modlist.attend_mod_num}">
		                </form>
						
					</c:forEach>
                </tbody>
                
                
              </table>

            </div>
          </div>
        </div>

	</div>
</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script type="text/javascript">

	<!-- 오늘 날짜 계산하는 스크립트 -->
	let today = new Date();
	let year = today.getFullYear(); 
	let month = today.getMonth() + 1
	let day = today.getDate();
	
	document.getElementById("currentDate").innerHTML = year + '-' + (("00"+month.toString()).slice(-2)) + '-' + (("00"+day.toString()).slice(-2));

	<!-- 첨부파일 상세페이지로 이동하는 스크립트 -->
	let filebtn = document.getElementById("filepage");
	filebtn.addEventListener('click', filebtnclickEventHandler)
	
	function filebtnclickEventHandler() 
	{
		var url = "attachfile";
		var name = "파일상세페이지";
		var specs = "width=1000, height=1000, scrollbars=yes, menubar=no";

		window.open(url, name, specs);
    };

    <!-- form을 자동으로 submit하는 스크립트 -->
    document.getElementById('autoform').submit(); 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    <!-- ajax에서 컨트롤러로 넘어가는 스크립트? (오류 확인됨) -->
	function test() 
	{
	    $.ajax({
	   		type : "GET",
		    url : "attachfile",
		    contentType: "application/json",
		    dataType: "json",
		    success : function()
		    {
		    	alert("success!");
		    },
		    error : function() 
		    {
		        alert("error!");
		    }
		});
	    
    };
    

	

</script>



<!-- Custom scripts -->
<script src="${root}/resources/js/script.js"></script>

</body>
</html>














