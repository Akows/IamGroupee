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
<title>LeaveInfo</title>
  <!-- Theme style -->
  <link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
  <!-- Favicon -->
  <link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">
</head>

<body>

    <%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

    <!-- ! Main -->
    <main class="main users chart-page" id="skip-target">
      <div class="container">
       <div class="row stat-cards">
          <div class="col-md-6 col-xl-12" style="height: 90%;">
            <article class="stat-cards-item">
            
            	<div class="card card-primary card-outline" style="width: 100%">

		            <div class="card-body p-0">
		              <div class="mailbox-read-info">
		                <h5 style="margin-bottom: 3px;">제목</h5>
		                <h6>작성자
		                  <span class="mailbox-read-time float-right">작성날짜</span></h6>
		              </div>
		              <!-- /.mailbox-controls -->
		              <div class="mailbox-read-message" style="text-align: center; width: 90%; margin: auto; margin-bottom: 10px;">
		                <p>
		                Skateboard artisan letterpress before they sold out High Life messenger bag. Bitters chambray
	                    leggings listicle, drinking vinegar chillwave synth. Fanny pack hoodie American Apparel twee. American
	                    Apparel PBR listicle, salvia aesthetic occupy sustainable Neutra kogi. Organic synth Tumblr viral
	                    plaid, shabby chic single-origin coffee Etsy 3 wolf moon slow-carb Schlitz roof party tousled squid
	                    vinyl. Readymade next level literally trust fund. Distillery master cleanse migas, Vice sriracha
	                    flannel chambray chia cronut.
		                </p>
		              </div>
		            </div>
		          </div>
		            
		            <div style="height: 30px; width: 100%; margin-left: 90px;">
			           <div class="input-group-prepend" style="margin-left: 90%">
			              <a href="${root}/admin/leave/lvInfoWriteAD">
			                <input type="button" value="삭제" style="background-color: rgb(14, 104, 225); font-weight: bold; color: white; margin-right: 10px; float: left;">
			              </a>
			              <a href="${root}/admin/leave/lvInfoWriteAD">
			                <input type="button" value="수정" style="background-color: rgb(14, 104, 225); font-weight: bold; color: white; margin-right: 6px; float: left;">
			              </a>
			           </div>
			        </div>
             
            </article>
          </div>
        </div>
      </div>
    </main>

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>

	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
</body>

</html>