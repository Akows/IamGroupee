<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>근태수정요청 조회페이지</title>
  
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
			<h1>근태수정요청 조회페이지</h1> <br> 오늘 날짜 <h4 style="color: rgb(50, 48, 48); font-weight: 600;" id="currentDate"></h4>
		</div>
		<br>
		<br>
		<hr>
		
		<div class="row stat-cards">
		<div class="col-lg-12">
            <div class="users-table table-wrapper">
            
              <form action="attendModViewSearch" method="post">      
              	<div>
	              	<select id="searchvalue">
	              		<option value="처리중">처리중</option>
	              		<option value="승인됨">승인됨</option>
	              		<option value="반려됨">반려됨</option>
	              	</select>
	              	
	              	<input type="button" class="searchBtn" name="search" id="search" value="검색">
              	</div>
              </form>	
              
              <table class="posts-table">
                <thead>
                  <tr class="users-table-info">
                    <th>신청일</th>
                    <th>신청자</th>
                    <th>신청사유</th>
                    <th>첨부파일</th>
                    <th>현재상태</th>
                  </tr>
                </thead>
                
                <tbody>
	                <c:forEach items="${atModList}" var="modlist">
						<tr>
							<td>${modlist.req_date}</td>
							<td>${modlist.user_name}</td>
							<td>${modlist.mod_reason}</td>
							<td>
								<input type="hidden" id="xxx" name="attend_mod_num" value="${modlist.attend_mod_num}">
								<input type="button" class="tempBtn" name="attach_file" id="filepage" value="${modlist.attach_file}">
							</td>
							<td>
								<c:choose>
									<c:when test="${modlist.approve_state eq '처리중'}">
										<span class="badge-active">
											${modlist.approve_state}
										</span>
									</c:when>
									
									<c:when test="${modlist.approve_state eq '승인됨'}">
										<span class="badge-pending">
											${modlist.approve_state}
										</span>
									</c:when>
									
									<c:otherwise>
										<span class="badge-pending">
											<input type="hidden" name="attend_mod_num" value="${modlist.attend_mod_num}">
											<input type="button" class="rejectReasonBtn" value="${modlist.approve_state}">	
										</span>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						
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
	<!-- 파일 검색용 modnum을 전송하는 스크립트도 겸함 -->
	let filebtn = document.getElementsByClassName("tempBtn");
	
	$(filebtn).each(function(idx, element)
	{
		element.addEventListener('click', filebtnclickEventHandler);
	
	});
	//filebtn.addEventListener('click', filebtnclickEventHandler)
	
	function filebtnclickEventHandler(e) 
	{
		// http://127.0.0.1:8989/iag/attend/attachfile?attend_mod_num=1
				
				
		var url = "http://127.0.0.1:8989/iag/attend/attachfile?attend_mod_num=";
		let no = e.currentTarget.previousSibling.previousSibling.value;
		url += no;
		
		var name = "파일상세페이지";
		var specs = "width=1000, height=1000, scrollbars=yes, menubar=no";

		window.open(url, name, specs);
		
		//document.getElementById('auform').submit(); 
    };
    
	<!-- 반려사유 페이지로 이동하는 스크립트 -->
	let rejectreasonbtn = document.getElementsByClassName("rejectReasonBtn");
	
	$(rejectreasonbtn).each(function(idx, element)
	{
		element.addEventListener('click', rejectreasonbtnclickEventHandler);
	
	});
	
	function rejectreasonbtnclickEventHandler(e) 
	{		
		var url = "http://127.0.0.1:8989/iag/attend/rejectreasonview?attend_mod_num=";
		let no = e.currentTarget.previousSibling.previousSibling.value;
		url += no;
		
		var name = "반려사유보기페이지";
		var specs = "width=500, height=300, scrollbars=yes, menubar=no";

		window.open(url, name, specs);
    };

    
	<!-- 검색값을 Controller로 전송 -->
    let searchbtn = document.getElementsByClassName("searchBtn");
	
	$(searchbtn).each(function(idx, element)
	{
		element.addEventListener('click', searchbtnclickEventHandler);
			
	});
			
	function searchbtnclickEventHandler(e) 
	{	
		var value = document.getElementById('searchvalue').options[document.getElementById('searchvalue').selectedIndex].text;
		
	    $.ajax
	    ({
	   		type : "POST",
		    url : "attendmodviewsearch",
	        data : {'searchKey' : value},
	        dataType : 'text',
		    success : function()
		    {
		    	console.log("success!");
		    },
		    error : function() 
		    {
		    	console.log("error!");
		    }
		});
	};
    
    
	
	
	
	
	
	
	
	
	
	
	
	
	
	
    
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
		    	console.log("success!");
		    },
		    error : function() 
		    {
		    	console.log("error!");
		    }
		});
	    
    };
    

	

</script>



<!-- Custom scripts -->
<script src="${root}/resources/js/script.js"></script>

</body>
</html>

