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
       
        <div style="height: 40px; text-align: center;">
        	<h1 style="color: rgb(50, 48, 48); font-weight: 600;" id="currentDate"></h1>
        </div>
        
        <br>
        
        <div class="row stat-cards">
          <div class="col-md-6 col-xl-12" style="width: 20%; height: 150px;">
            <article class="stat-cards-item" style="text-align: center; margin: auto;">
              	<div class="border-right" style="width: 20%; height: 100%; float: left;">
              		<span>
              		프사
              		</span>
              		<span>
              		이름정보
              		</span>
              	</div>
              	<div class="border-right" style="width: 13%; height: 100%; float: left; margin-left: 4px;">
              		<span>
              		발생연차
              		</span> <br>
              		<span>
              		num
              		</span>
              	</div>
              	<div class="border-right" style="width: 13%; height: 100%; float: left; margin-left: 4px;">
              		<span>
              		발생월차
              		</span> <br>
              		<span>
              		num
              		</span>
              	</div>
              	<div class="border-right" style="width: 13%; height: 100%; float: left; margin-left: 4px;">
              		<span>
              		조정연차
              		</span> <br>
              		<span>
              		num
              		</span>
              	</div>
              	<div class="border-right" style="width: 13%; height: 100%; float: left; margin-left: 4px;">
              		<span>
              		총연차
              		</span> <br>
              		<span>
              		num
              		</span>
              	</div>
              	<div class="border-right" style="width: 13%; height: 100%; float: left; margin-left: 4px;">
              		<span>
              		사용연차
              		</span> <br>
              		<span>
              		num
              		</span>
              	</div>
              	<div style="width: 13%; height: 100%; float: left; margin-left: 4px;">
              		<span>
              		남은연차
              		</span> <br>
              		<span>
              		num
              		</span>
              	</div>          
            </article>
          </div>
        </div>
        
        <br>
       
        <div style="height: 40px; width: 100%;">
        	<div style="width: 25%; height: 100%; float: left;">
        		<p style=" color: rgb(94, 94, 94); font-weight: 600; font-size: large; margin-top: 10px; float: left;">0000-00-00</p>
        		<p style=" color: rgb(94, 94, 94); font-weight: 600; font-size: large; margin-top: 10px; float: left;">&nbsp~&nbsp</p>
        		<p style=" color: rgb(94, 94, 94); font-weight: 600; font-size: large; margin-top: 10px; float: left;" id="currentDate2"></p>
			</div>
        	<div style="width: 45%; height: 100%; float: left;"></div>
        	<div style="width: 30%; height: 100%; float: left; text-align: right;">
        		<input type="button" value="연차 신청" style="background-color: rgb(14, 104, 225); margin-right: 6px; font-weight: bold; color: white;">
        		<input type="button" value="휴가 신청" style="background-color: rgb(14, 104, 225); font-weight: bold; color: white;">
        	</div>
        </div>
       
        <div style="height: 30px; width: 100%;">
        	<div style="width: 25%; height: 100%; float: left;">
        		<h3 style="color: rgb(94, 94, 94); font-weight: 600; font-size: larger; margin-top: 4px; margin-left: 3px">사용 내역</h3>
			</div>
        </div>
        
        <div class="row stat-cards" style="height: 30%;">
          <div class="col-md-6 col-xl-12">
            <article class="stat-cards-item">
            
              <div class="stat-cards-info">
                <table class="table">
				  <thead>
				    <tr>
				      <th scope="col">#</th>
				      <th scope="col">First</th>
				      <th scope="col">Last</th>
				      <th scope="col">Handle</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row">1</th>
				      <td>Mark</td>
				      <td>Otto</td>
				      <td>@mdo</td>
				    </tr>
				  </tbody>
				</table>
              </div>
              
            </article>
          </div>
        </div>
        
        <br>
       
        <div style="height: 30px; width: 100%;">
        	<div style="width: 25%; height: 100%; float: left;">
        		<h3 style="color: rgb(94, 94, 94); font-weight: 600; font-size: larger; margin-top: 4px; margin-left: 3px">생성 내역</h3>
			</div>
        </div>
        
        <div class="row stat-cards" style="height: 30%;">
          <div class="col-md-6 col-xl-12">
            <article class="stat-cards-item">
            
              <div class="stat-cards-info">
                <table class="table">
				  <thead>
				    <tr>
				      <th scope="col">#</th>
				      <th scope="col">First</th>
				      <th scope="col">Last</th>
				      <th scope="col">Handle</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row">1</th>
				      <td>Mark</td>
				      <td>Otto</td>
				      <td>@mdo</td>
				    </tr>
				  </tbody>
				</table>
              </div>
              
            
            </article>
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