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
            <article class="stat-cards-item">
            
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">휴가 발생 관리</p>
                <a href="${root}/admin/leave/lvModiAD">링크</a>
                  <pre>


                  </pre>
                 
				<div class="form-group">
                  <label>Date:</label>
                    <div class="input-group date" id="reservationdate" data-target-input="nearest">
                        <input type="text" class="form-control datetimepicker-input" data-target="#reservationdate"/>
                        <div class="input-group-append" data-target="#reservationdate" data-toggle="datetimepicker">
                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                        </div>
                    </div>
                </div>	


              </div>
            </article>
          </div>

          <div class="col-md-6 col-xl-4">
            <article class="stat-cards-item">
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">연차 및 휴가 정보 게시판 관리</p>
                <a href="${root}/leave/lvInfo">링크</a>
                  <pre>


                  </pre>
              </div>
            </article>
          </div>
          
          <div class="col-md-6 col-xl-4">
            <article class="stat-cards-item">
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">연차 사용 촉구서 관리</p>
                <a href="${root}/admin/leave/alvIntendAD">링크</a>
                  <pre>


                  </pre>
              </div>
            </article>
          </div>
          
        </div>
        
        <div class="row stat-cards">
          <div class="col-md-6 col-xl-12">
            <article class="stat-cards-item">
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">사원 연차 관리</p>
                <a href="${root}/admin/leave/usAlvAD">링크</a>
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


	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>

<!-- InputMask -->
<script src="${root}/resources/plugins/moment/moment.min.js"></script>
<!-- date-range-picker -->
<script src="${root}/resources/plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="${root}/resources/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<script type="text/javascript">
	let today = new Date();
	let year = today.getFullYear(); 
	let month = today.getMonth() + 1
	let day = today.getDate();

	document.getElementById("currentDate").innerHTML = year + '-' + (("00"+month.toString()).slice(-2)) + '-' + (("00"+day.toString()).slice(-2));
	//Date picker
    $('#reservationdate').datetimepicker({
        format: 'L'
    });
</script>

</body>

</html>