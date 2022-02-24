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
  <title>I am groupe Dashboard</title>
  <!-- Theme style -->
  <link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
  <!-- Favicon -->
  <link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">
</head>
<body>

    <%@ include file="common/headerSide.jsp" %>

    <!-- ! Main -->
    <main class="main users chart-page" id="skip-target">
     <div class="container">
      
      <h2 class="main-title">Dashboard</h2>
        <div class="row stat-cards">
          <div class="col-md-6 col-xl-6" style="height: 90%;">
            <article class="stat-cards-item">
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">공지</p>
                 <pre>






                  
                </pre>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">To-do</p>
                <pre>






                  
                </pre>
              </div>
            </article>
          </div>
          <div class="col-md-6 col-xl-3">
            <article class="stat-cards-item">
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">출퇴근shortcut</p>
                <pre>






                  
                </pre>
              </div>
            </article>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-9">
            <div class="chart">
              <article class="stat-cards-item">
                <div class="stat-cards-info">
                  <p class="stat-cards-info__num">게시판</p>
                  <pre>












                    
                  </pre>
                </div>
              </article>
            </div>
          </div>
          <div class="col-lg-3">
            <article class="white-block">
              <div class="top-cat-title">
                <h3>캘린더</h3>
                <p>28 Categories, 1400 Posts</p>
                <pre>




                  







                  
                </pre>
              </div>
            </article>
          </div>
        </div>
      </div>
    </main>

    <%@ include file="common/footer.jsp" %>
  </div>
</div>
	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
</body>

</html>