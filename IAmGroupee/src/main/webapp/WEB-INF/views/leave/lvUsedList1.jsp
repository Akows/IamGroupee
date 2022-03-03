<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.iag.leave.entity.LvUsedListDto"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  
  <link href='${root}/resources/css/schedule/core_main.css' rel='stylesheet' />
  <link href='${root}/resources/css/schedule/daygrid_main.css' rel='stylesheet' />
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${root}/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- SweetAlert2 -->
  <link rel="stylesheet" href="${root}/resources/plugins/sweetalert2/sweetalert2.min.css">
  <!-- Toastr -->
  <link rel="stylesheet" href="${root}/resources/plugins/toastr/toastr.min.css">
  <!-- Custom styles -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
  integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <!-- Custom styles -->
  <link rel="stylesheet" href="${root}/resources/css/style.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  
  <!-- Favicon -->
  <link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">
  <!-- Theme style -->
  <link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
  <link rel='stylesheet' href='${root}/resources/css/sch/main.css' />
    
</head>

<body>

	            <div class="card card-primary card-outline card-tabs">
	              <div class="card-body">
	                <div class="tab-content" id="custom-tabs-three-tabContent">
			          <div id="letter" style="margin-bottom: 20px;">
			        		<h4 style="color: rgb(94, 94, 94); font-weight: 600;">연차 사용 대장</h4>
					  </div>
	                  <div class="card">
			              <div class="card-body p-0">
			                <table class="table" style="text-align: center;">
			                  <thead>
			                    <tr>
			                      <th style="width: 20%">연차 종류</th>
			                      <th style="width: 40%">사용 날짜</th>
			                      <th style="width: 20%">사용 연차</th>
			                      <th style="width: 20%">세부 내용</th>
			                    </tr>
			                  </thead>
			                  <tbody>
				                  <c:forEach items="${alvUsedListIf}" var="alv">
				                    <tr>
				                      <td>${alv.lvName}</td>
				                      <td>${alv.during}</td>
				                      <td>${alv.reduceAlv}</td>
				                      <td>${alv.lvReason}</td>
				                    </tr>
				                  </c:forEach>
			                  </tbody>
			                </table>
			              </div>
				  		  <!-- 페이징 -->
						  <div class="card-footer clearfix" style="width: 100%; margin: auto; text-align: center;">
			                <ul class="pagination pagination-m m-2" style=" margin: auto; color: black; padding-left: 25%; padding-right: 25%;">
			             	  <c:if test="${page.startPage != 1}">
				                  <li class="page-item"><a class="page-link" href="${root}/leave/alvUsedListIf/${page.startPage - 1}" style="color: rgb(14, 104, 225); font-weight: bold;">&laquo;</a></li>&nbsp;
							  </c:if>
		
							   <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
							  	  <c:if test="${page.currentPage != i and i <= page.lastPage}">
				                   <li class="page-item">
									  <a class="page-link" href="${root}/leave/alvUsedListIf/${i}" style="color: rgb(14, 104, 225);">${i}</a>&nbsp
								   </li>	  
							 	  </c:if> 
							 	 
							  	<c:if test="${page.currentPage == i and i <= page.lastPage}">
			                   	   <li class="page-item">
								  	  <a class="page-link" href="${root}/leave/alvUsedListIf/${i}" style="color: rgb(14, 104, 225);">${i}</a>&nbsp
								   </li>	  
								</c:if>
							   </c:forEach>
							
							  <c:if test="${page.endPage < page.lastPage}">
								<li class="page-item"><a class="page-link" href="${root}/leave/alvUsedListIf/${page.endPage + 1}" style="color: rgb(14, 104, 225); font-weight: bold;">&raquo;</a></li>
							  </c:if>
			                  
			                </ul>
		                  </div>
	           </div>
			        </div>
	              </div>
	            </div>
	      </div>
	      
	      
	      


	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
	<!-- Icons library -->
	<script src="${root}/resources/plugins/feather.min.js"></script>
	<!-- jQuery -->
	<script src="${root}/resources/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="${root}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${root}/resources/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="${root}/resources/dist/js/demo.js"></script>   

</body>

</html>	      
	 