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

                    <th>Title</th>
                    <th>Author</th>
                    <th>Status</th>
                    <th>Date</th>
                    <th>Action</th>
                  </tr>
                </thead>
                
                <tbody>
                
                  <tr>
                    <td>
                      <label class="users-table__checkbox">
                        <input type="checkbox" class="check">
                        <div class="categories-table-img">

                        </div>
                      </label>
                    </td>
                    <td>
                      클라이언트의 요청으로 출근 중 고객사 방문하여 이슈 처리, 정상 출근 요청함 
                    </td>
                    <td>
                      <div class="pages-table-img">
                        김철수 대리
                      </div>
                    </td>
                    <td><span class="badge-pending">처리 중</span></td>
                    <td>2022.08.23</td>
                    <td>
                      <span class="p-relative">
                        <button class="dropdown-btn transparent-btn" type="button" title="More info">
                          <div class="sr-only">More info</div>
                          <i data-feather="more-horizontal" aria-hidden="true"></i>
                        </button>
                        <ul class="users-item-dropdown dropdown">
                          <li><a href="##">요청 승인</a></li>
                          <li><a href="##">요청 반려</a></li>
                          <li><a href="##">요청 삭제</a></li>
                        </ul>
                      </span>
                    </td>
                  </tr>
                  
                                    <tr>
                    <td>
                      <label class="users-table__checkbox">
                        <input type="checkbox" class="check">
                        <div class="categories-table-img">

                        </div>
                      </label>
                    </td>
                    <td>
                      정상 출근 했으나 출근 처리를 하지 아니함.
                    </td>
                    <td>
                      <div class="pages-table-img">
                        이수철 부장
                      </div>
                    </td>
                    <td><span class="badge-pending">처리 중</span></td>
                    <td>2022.08.23</td>
                    <td>
                      <span class="p-relative">
                        <button class="dropdown-btn transparent-btn" type="button" title="More info">
                          <div class="sr-only">More info</div>
                          <i data-feather="more-horizontal" aria-hidden="true"></i>
                        </button>
                        <ul class="users-item-dropdown dropdown">
                          <li><a href="##">요청 승인</a></li>
                          <li><a href="##">요청 반려</a></li>
                          <li><a href="##">요청 삭제</a></li>
                        </ul>
                      </span>
                    </td>
                  </tr>
                  
                                    <tr>
                    <td>
                      <label class="users-table__checkbox">
                        <input type="checkbox" class="check">
                        <div class="categories-table-img">

                        </div>
                      </label>
                    </td>
                    <td>
                      출근 중 교통사고로 정상 출근하지 못한. 
                    </td>
                    <td>
                      <div class="pages-table-img">
                        박홍수 과장
                      </div>
                    </td>
                    <td><span class="badge-pending">처리 중</span></td>
                    <td>2022.08.24</td>
                    <td>
                      <span class="p-relative">
                        <button class="dropdown-btn transparent-btn" type="button" title="More info">
                          <div class="sr-only">More info</div>
                          <i data-feather="more-horizontal" aria-hidden="true"></i>
                        </button>
                        <ul class="users-item-dropdown dropdown">
                          <li><a href="##">요청 승인</a></li>
                          <li><a href="##">요청 반려</a></li>
                          <li><a href="##">요청 삭제</a></li>
                        </ul>
                      </span>
                    </td>
                  </tr>
                  


                </tbody>
              </table>
            </div>
          </div>
        </div>

	</div>
</main>




















<%@ include file="/WEB-INF/views/common/footer.jsp" %>


<script type="text/javascript">
	let today = new Date();
	let year = today.getFullYear(); 
	let month = today.getMonth() + 1
	let day = today.getDate();

	document.getElementById("currentDate").innerHTML = year + '-' + (("00"+month.toString()).slice(-2)) + '-' + (("00"+day.toString()).slice(-2));
	document.getElementById("currentDate2").innerHTML = year + '-' + (("00"+month.toString()).slice(-2)) + '-' + (("00"+day.toString()).slice(-2));
</script>

	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
</body>

</html>














