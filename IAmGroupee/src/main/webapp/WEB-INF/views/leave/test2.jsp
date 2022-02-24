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
  <title>UsedLeaveList</title>
  
  <c:set var="root" value="${pageContext.request.contextPath}"/>
  
  <!-- Favicon -->
  <link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">
  <!-- Theme style -->
  <link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
</head>

<body>

    <%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

    <!-- ! Main -->
    <main class="main users chart-page" id="skip-target">
    
     <div class="container">
      
        <div class="row stat-cards" style="height: 100%;">
        
          <div class="col-md-6 col-xl-5">
	            <div class="card card-primary card-outline card-tabs" style="height: 49%;">
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
				                  <c:forEach items="${alvUsedList}" var="alv">
				                    <tr>
				                      <td>${alv.lvName}</td>
				                      <td>${alv.during}</td>
				                      <td>${alv.alvReduce}</td>
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
				                  <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225); font-weight: bold;">&laquo;</a></li>&nbsp;
								  <%-- <a href="${root}/notice/list/${page.startPage - 1}">이전</a> --%>
							  </c:if>
			                  <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225);">1</a></li>
			                  <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225);">2</a></li>
			                  <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225);">3</a></li>
			                  <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225);">4</a></li>
			                  <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225);">5</a></li>&nbsp;
			                  <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225); font-weight: bold;">&raquo;</a></li>
			                </ul>
		                  </div>
			            </div>
	                </div>
	              </div>
	            </div>
	            
	            <div class="card card-primary card-outline card-tabs" style="height: 49%;">
	              <div class="card-body">
	                <div class="tab-content" id="custom-tabs-three-tabContent">
			        	<div id="letter" style="margin-bottom: 20px;">
			        		<h4 style="color: rgb(94, 94, 94); font-weight: 600;">휴가 사용 대장</h4>
						</div>
	                  <div class="card">
			              <div class="card-body p-0">
			                <table class="table" style="text-align: center;">
			                  <thead>
			                    <tr>
			                      <th style="width: 30%">휴가 종류</th>
			                      <th style="width: 40%">사용 날짜</th>
			                      <th style="width: 30%">세부 내용</th>
			                    </tr>
			                  </thead>
			                  <tbody>
				                  <c:forEach items="${lvUsedList}" var="lv">
				                    <tr>
				                      <td>${lv.lvName}</td>
				                      <td>${lv.during}</td>
				                      <td>${lv.lvReason}</td>
				                    </tr>
				                  </c:forEach>
			                  </tbody>
			                </table>
			              </div>
				  		  <!-- 페이징 -->
						  <div class="card-footer clearfix" style="width: 100%; margin: auto; text-align: center;">
			                <ul class="pagination pagination-m m-2" style=" margin: auto; color: black; padding-left: 25%; padding-right: 25%;">
			             	  <c:if test="${page.startPage != 1}">
				                  <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225); font-weight: bold;">&laquo;</a></li>&nbsp;
								  <%-- <a href="${root}/notice/list/${page.startPage - 1}">이전</a> --%>
							  </c:if>
			                  <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225);">1</a></li>
			                  <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225);">2</a></li>
			                  <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225);">3</a></li>
			                  <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225);">4</a></li>
			                  <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225);">5</a></li>&nbsp;
			                  <li class="page-item"><a class="page-link" href="#" style="color: rgb(14, 104, 225); font-weight: bold;">&raquo;</a></li>
			                </ul>
		                  </div>
			            </div>
	                </div>
	              </div>
	            </div>
          </div>
        
          <div class="col-md-7 col-xl-7">
            	<iframe src="${root}/leave/ts" height="800px" width="100%"  marginwidth="0" scrolling="no" allowtransparency="true"></iframe>
          </div>
        </div>
        
      </div>
      
    </main>

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>

	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
</body>

</html>