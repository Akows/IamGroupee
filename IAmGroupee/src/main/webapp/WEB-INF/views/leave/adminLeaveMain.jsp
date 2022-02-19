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
        
        <div class="row stat-cards">
          <div class="col-md-6 col-xl-6">
            <article class="stat-cards-item">
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">사원 연차 관리</p>
                  <pre>






                  </pre>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-xl-6">
            <article class="stat-cards-item">
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">휴가 발생 관리</p>
                  <pre>






                  </pre>
              </div>
            </article>
          </div>
        </div>
        <div>
        	<pre></pre>
        </div>
        <div class="row stat-cards">
          <div class="col-md-6 col-xl-6">
            <article class="stat-cards-item">
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">연차 및 휴가 정보 게시판 관리</p>
                  <pre>






                  </pre>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-xl-6">
            <article class="stat-cards-item">
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">연차 사용 촉구서 관리</p>
                  <pre>






                  </pre>
              </div>
            </article>
          </div>
        </div>
      </div>
    </main>

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
  </div>
</div>

<script type="text/javascript">
	let today = new Date();
	let year = today.getFullYear(); 
	let month = today.getMonth() + 1
	let day = today.getDate();

	document.getElementById("currentDate").innerHTML = year + '-' + (("00"+month.toString()).slice(-2)) + '-' + (("00"+day.toString()).slice(-2));
</script>

	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
</body>

</html>