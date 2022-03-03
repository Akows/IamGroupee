<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>LeaveMain Page</title>
  <link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
  <link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">
  <!-- daterange picker -->
  <link rel="stylesheet" href="${root}/resources/plugins/daterangepicker/daterangepicker.css">
</head>

<body>

    <%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

    <!-- ! Main -->
    <main class="main users chart-page" id="skip-target">
     <div class="container">
       
        <div style="height: 40px; text-align: center;">
        	<h1 style="color: rgb(50, 48, 48); font-weight: 600;" id="currentDate"></h1>
        </div>
        
        <br>
        
        <div class="row stat-cards" style="margin-bottom: 15px;">
          <div class="col-md-6 col-xl-4">
              <div class="card card-primary card-outline" style="width: 100%; height: 100%;">
	                <div style="float: left; width: 30%; margin-left: 30px; margin-top: 20px;">
	                  <ion-icon size="large" name="duplicate-outline"></ion-icon>
	                </div>
	                <div style="float: left; width: 68%; margin-left: 30px; margin-top: 10px; margin-bottom: 13px;">
	                  <a href="${root}/admin/leave/lvModiAD">
	                  	<p style="color: rgb(94, 94, 94); font-size: x-large; font-weight: bold;">휴가 발생 관리</p>
	                  </a>
	                </div>
              </div>
          </div>

          <div class="col-md-6 col-xl-4">
              <div class="card card-primary card-outline" style="width: 100%; height: 100%;">
	                <div style="float: left; width: 30%; margin-left: 30px; margin-top: 20px;">
	                  <ion-icon size="large" name="file-tray-full-outline"></ion-icon>
	                </div>
	                <div style="float: left; width: 68%; margin-left: 30px; margin-top: 10px; margin-bottom: 13px;">
	                  <a href="${root}/leave/lvInfo">
	                  	<p style="color: rgb(94, 94, 94); font-size: x-large; font-weight: bold;">연차 및 휴가 정보 게시판 관리</p>
	                  </a>
	                </div>
              </div>
          </div>
          
          <div class="col-md-6 col-xl-4">
              <div class="card card-primary card-outline" style="width: 100%; height: 100%;">
	                <div style="float: left; width: 30%; margin-left: 30px; margin-top: 20px;">
	                  <ion-icon size="large" name="mail-unread-outline"></ion-icon>
	                </div>
	                <div style="float: left; width: 68%; margin-left: 30px; margin-top: 10px; margin-bottom: 13px;">
	                  <a href="${root}/admin/leave/alvIntendAD">
	                  	<p style="color: rgb(94, 94, 94); font-size: x-large; font-weight: bold;">연차 사용 촉구서 관리</p>
	                  </a>
	                </div>
              </div>
          </div>
          
        </div>
        
        <div class="row stat-cards" style="margin-top: 30px;">
          <div class="col-md-6 col-xl-12">
            <article class="stat-cards-item">
            <div style="margin-bottom: 20px; width: 100%;">
              <ion-icon size="large" name="accessibility-outline" style="width: 5%; float: left;  text-align: right;"></ion-icon>
              <h3 style="color: rgb(94, 94, 94); font-weight: 600; width: 75%; float: left; line-height: 35px;">사원 연차 관리</h3>
                <%-- <a href="${root}/admin/leave/usAlvAD">링크</a> --%>
                <label style="font-size: large; width: 10%; float: left;">
                  <form action="" method="post">
					<input type="text" name="searchByUserNo">
                  </form>
				</label>
            </div>
              
            
              <div class="stat-cards-info" style="width: 100%">
                <table class="table" style="width: 100%">
				  <thead>
				    <tr>
				      <th scope="col">이름</th>
				      <th scope="col">부서명</th>
				      <th scope="col">직급명</th>
				      <th scope="col">발생 연차</th>
				      <th scope="col">조정 연차</th>
				      <th scope="col">총 연차</th>
				      <th scope="col">사용 연차</th>
				      <th scope="col">남은 연차</th>
				      <th scope="col">연차 추가</th>
				    </tr>
				  </thead>
				  <tbody>
				  <c:forEach items="${allUserList}" var="allUserList">
				    <tr>
				      <td style="width: 13%">${allUserList.name}</td>
				      <td style="width: 12%">${allUserList.departmentName}</td>
				      <td style="width: 12%">${allUserList.positionName}</td>
				      <td style="width: 11%">${allUserList.alvCount}</td>
				      <td style="width: 11%">${allUserList.alvAddCount}</td>
				      <td style="width: 11%">${allUserList.alvTotalCount}</td>
				      <td style="width: 11%">${allUserList.alvUsedCount}</td>
				      <td style="width: 11%">${allUserList.alvLeftCount}</td>
				      <td style="width: 8%"><input type="button" value="추가" style="background-color: rgb(14, 104, 225); font-weight: bold; color: white;"></td>
				    </tr>
				  </c:forEach>
				  </tbody>
				</table>
              </div>
              <!-- 페이징 -->
			  <div class="card-footer clearfix" style="width: 100%; margin: auto; text-align: center;">
			    <ul class="pagination pagination-m m-2" style=" margin: auto; color: black; padding-left: 40%; padding-right: 40%;">
				   <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225); font-weight: bold;">&laquo;</a></li>&nbsp;
			       <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225);">1</a></li>
			       <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225);">2</a></li>
			       <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225);">3</a></li>
			       <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225);">4</a></li>
			       <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225);">5</a></li>&nbsp;
			       <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225); font-weight: bold;">&raquo;</a></li>
			    </ul>
		      </div>
            </article>
          </div>
        </div>
      </div>
    </main>

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
  </div>
</div>


	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>

<script type="text/javascript">
	let today = new Date();
	let year = today.getFullYear(); 
	let month = today.getMonth() + 1
	let day = today.getDate();

	document.getElementById("currentDate").innerHTML = year + '-' + (("00"+month.toString()).slice(-2)) + '-' + (("00"+day.toString()).slice(-2));
</script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>

</html>