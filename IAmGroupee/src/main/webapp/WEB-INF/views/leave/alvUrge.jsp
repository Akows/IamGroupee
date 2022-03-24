<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>alvUrge</title>
  <link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
  <link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">
</head>

<body>

    <%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

    <main class="main users chart-page" id="skip-target">
     <div class="container">
        
        <br>
        
        <div class="row stat-cards">
          <div class="col-md-6 col-xl-12">
            <article class="stat-cards-item">
              <div class="stat-cards-info" style=" margin: auto; width: 100%; margin-top: 10px; ">
                
                  <div style="height: 30px; width: 45%; text-align: center; margin: auto; margin-bottom: 30px;text-align: center;">
		        		<p style=" color: rgb(94, 94, 94); font-weight: 600; font-size: 40px;
		        		box-shadow: inset 0 -3px 0  #8092B8; line-height: 90px;">미 사용 연차 유급휴가 사용 촉구서</p>
		          </div>
                
	              <br><br>
	              
	              <div class="card-body table-responsive" style="width: 90%; margin: auto;text-align: center; margin-bottom: 20px;">
	                <table class="table table-bordered" style="width: 35%; border: 1px solid black; margin-bottom: 20px;">
	                    <tr>
	                      <td class="table-active" style="width: 30%;">참조자</td>
	                      <td style="width: 70%;">부서 관리자이름 직급</td>
	                    </tr>
	                    
	                    <tr>
	                      <td class="table-active">제목</td>
	                      <td>미사용 연차유급휴가 사용 촉구서</td>
	                    </tr>
	                </table>

	                <table class="table table-bordered" style="width: 100%; border: 1px solid black;">
	                    <tr>
	                      <td class="table-active" rowspan="3" style="width: 15%; line-height: 100px;">인적사항</td>
	                      <td class="table-active" style="width: 15%;">성명</td>
	                      <td style="width: 27.5%;">${loginUser.name}</td>
	                      <td class="table-active" style="width: 15%;">입사일자</td>
	                      <td style="width: 27.5%;">${loginUser.enrollDate}</td>
	                    </tr>
	                    
	                    <tr>
	                      <td class="table-active">생년월일</td>
	                      <td style="width: 27.5%;">${loginUser.residentNo}</td>
	                      <td class="table-active">이메일</td>
	                      <td>${loginUser.email}</td>
	                    </tr>
	                    
	                    <tr>
	                      <td class="table-active">부서</td>
	                      <td>${loginUser.departmentName}</td>
	                      <td class="table-active">직급</td>
	                      <td>${loginUser.positionName}</td>
	                    </tr>
	                </table>
	              </div>
       
		          <div style="width: 70%; height: 100%; margin-left: 5%;">
		        	<h4 style="color: rgb(94, 94, 94); font-weight: 600; margin-left: 14px;">연차 세부 내용</h4>
					<pre style="color: rgb(94, 94, 94); font-weight: 700; font-size: 15px; margin-left: 4px; margin-bottom: 0px;">본 자료는 <span id="now"></span>까지 상신된 내역을 기초로 작성된 것이므로,
예정된 휴무에 의거한 연차는 반영되지 않았을 수도 있습니다.</pre>
				  </div>
				  
				  <div class="card-body table-responsive" style="width: 90%; height: 90%; margin: auto;text-align: center; padding-top: 0px;">
	                <table class="table table-bordered" style="width: 100%; border: 1px solid black; margin-bottom: 20px;">
	                    <tr class="table-active">
	                      <td style="width: 29%;">연차 유급휴가 발생 대상 기간</td>
	                      <td style="width: 29%;">연차 유급휴가 사용 대상 기간</td>
	                      <td style="width: 14%;">발생 연차</td>
	                      <td style="width: 14%;">사용 연차</td>
	                      <td style="width: 14%;">미사용 연차</td>
	                    </tr>
	                    
	                    <tr>
	                      <td>${during}</td>
	                      <td>${during}</td>
	                      <td>${user.alvTotalCount}</td>
	                      <td>${user.alvUsedCount}</td>
	                      <td>${user.alvLeftCount}</td>
	                    </tr>
	                </table>
                  </div>
                  
		          <div style="width: 100%; height: 100%; margin-left: 5%; padding-top: 0px; margin-bottom: 10px;">
		        	<h4 style="color: rgb(94, 94, 94); font-weight: 600; margin-left: 14px; margin-bottom: 15px;">사용 촉구서 알림</h4>
					<p style="color: rgb(94, 94, 94); font-weight: 500; font-size: 17px; margin-left: 14px; margin-bottom: 15px;">상기 본인은 사용 대상 기간(10일) 내에 미사용 연차 일수를 사용하여 주시길 바랍니다.<p>
				  </div>
				  <a href="#" style="margin-left: 6%; margin-top: 15px; color: rgb(66, 6, 24); font-weight: 400; margin-bottom: 30px;"><u>사용계획서 작성하기(클릭)</u></a>

              </div>
            </article>
            
          </div>
        </div>
        
      </div>
    </main>

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<script src="${root}/resources/js/script.js"></script>
	<script type="text/javascript">
	let today = new Date();
	let year = today.getFullYear(); 
	let month = today.getMonth() + 1
	let day = today.getDate();

	document.getElementById("now").innerHTML = year + '-' + (("00"+month.toString()).slice(-2)) + '-' + (("00"+day.toString()).slice(-2));
	</script>
</body>

</html>