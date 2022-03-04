<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ALV CAL</title>
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
        
        <br>
        
        <div class="row stat-cards">
          <div class="col-md-6 col-xl-12">
            <article class="stat-cards-item" style="margin-bottom: 205px;">
              <div class="stat-cards-info" style="text-align: center; margin: auto; width: 100%; margin-top: 20px; ">
                
                  <div style="height: 30px; width: 25%; text-align: center; margin: auto; margin-bottom: 30px">
		        		<p style=" color: rgb(94, 94, 94); font-weight: 600; font-size: 40px;
		        		box-shadow: inset 0 -3px 0  #8092B8; line-height: 90px;">연차정산</p>
		          </div>
                
	              <br><br>
	              
	              <div class="card-body table-responsive" style="width: 90%; margin: auto; ">
	                <table class="table table-bordered" style="width: 100%; border: 1px solid black;">
	                    <tr class="table-active">
	                      <td rowspan="2" style="width: 20%; line-height: 50px;">사원 정보</td>
	                      <td style="width: 20%;">사원번호</td>
	                      <td style="width: 20%;">성명</td>
	                      <td style="width: 20%;">부서</td>
	                      <td style="width: 20%;">입사일자</td>
	                    </tr>
	                    
	                    <tr>
	                      <td>${user.userNo}</td>
	                      <td>${user.name}</td>
	                      <td>${user.departmentName}</td>
	                      <td>${user.enrollDate}</td>
	                    </tr>
	                    <tr class="table-active">
	                      <td rowspan="2" style="line-height: 50px;">연차 내역</td>
	                      <td>발생 기간</td>
	                      <td>총 연차일수</td>
	                      <td>사용 연차일수</td>
	                      <td>미사용 연차일수</td>
	                    </tr>
	                    <tr>
	                      <td id="now">${startDate} ~ </td>
	                      <td>${user.alvCount + user.alvAddCount}</td>
	                      <td>${usedAlv}</td>
	                      <td>${(user.alvCount + user.alvAddCount) - usedAlv}</td>
	                    </tr>
	                    <tr class="table-active">
	                      <td rowspan="${size+1}"style="line-height: 1400%;">정산 내역</td> <!-- rowspan = "list size + 1" -->
	                      <td>연차명</td>
	                      <td>사용 개수</td>
	                      <td colspan="2">발생 일자</td>
	                    </tr>
	                    <!-- 반복문 -->
	                    <c:forEach items="${alvUsageCalList}" var="auc">
		                    <tr>
		                      <td>${auc.lvName}</td>
		                      <td>${auc.reduceAlv}</td>
		                      <td colspan="2">${auc.during}</td>
		                    </tr>
	                    </c:forEach>
	                    <!-- 끝 -->
	                    <tr>
	                      <td colspan="3" class="table-active">합계 (미사용 연차일수 * 1일 통상임금)</td>
	                      <td colspan="2" id="total">${((user.alvCount + user.alvAddCount) - usedAlv) * 80000}</td>
	                    </tr>
	                </table>
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

<script type="text/javascript">
	let today = new Date();
	let year = today.getFullYear(); 
	let month = today.getMonth() + 1
	let day = today.getDate();

	document.getElementById("now").innerHTML = year + '-' + (("00"+month.toString()).slice(-2)) + '-' + (("00"+day.toString()).slice(-2));
	document.getElementById("total").innerHTML = parseInt(document.getElementById("total").innerHTML);
	document.getElementById("total").innerHTML += '원';
</script>

</body>

</html>