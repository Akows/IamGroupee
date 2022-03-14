<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Leave Info</title>
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
              <div class="stat-cards-info" style="text-align: center; margin: auto; width: 100%;">
                
                  <div style="height: 30px; width: 100%; margin-left: 90px;">
		        	<div style="width: 30%; height: 100%; float: left;">
		        		<h1 style="width: 180px; color: rgb(94, 94, 94); font-weight: 600;
		        		box-shadow: inset 0 -3px 0   #8092B8; line-height: 60px;">자유게시판</h1>
					</div>
		            <div class="input-group-prepend" style="height: 30px; width: 100%; float: left; margin-left: 83%;">
	               		<a href="${root}/board/freeWrite">
	                		<input type="button" value="글쓰기" style="background-color: rgb(14, 104, 225); font-weight: bold; color: white; margin-right: 10px; float: left;">
	                	</a>
		            </div>	
		          </div>
                
	              <br><br>
	              
	              <div class="card-body table-responsive" style="width: 90%; margin: auto;">
	                <table class="table table-hover text-nowrap" style="width: 100%; border-top: 1px solid rgb(94, 94, 94);">
	                  <thead>
	                    <tr>
	                      <th style="width: 10%;">글번호</th>
	                      <th style="width: 40%;">제목</th>
	                      <th style="width: 15%;">작성자</th>
	                      <th style="width: 25%;">작성일자</th>
	                      <th style="width: 10%;">조회수</th>
	                    </tr>
	                  </thead>
	                  <tbody>
	                  <c:forEach items="${freeBoardList}" var="fbl">
	                    <tr>
	                      <td><a href="${root}/board/freeBoardDetail/${fbl.boardFreeNum}">${fbl.boardFreeNum}</a></td>
	                      <td><a href="${root}/board/freeBoardDetail/${fbl.boardFreeNum}">${fbl.freeTitle}</a></td>
	                      <td><a href="${root}/board/freeBoardDetail/${fbl.boardFreeNum}">익명</a></td>
	                      <td><a href="${root}/board/freeBoardDetail/${fbl.boardFreeNum}">${fbl.freeDate}</a></td>
	                      <td><a href="${root}/board/freeBoardDetail/${fbl.boardFreeNum}">${fbl.freeViewCount}</a></td>
	                    </tr>
	                  </c:forEach>
	                  </tbody>
	                </table>
	              </div>
				  <div class="card-footer clearfix" style="width: 88%; margin: auto; margin-top: 5px">
	                <ul class="pagination pagination-m m-2" style="padding-left: 40%; color: black;">
	                </ul>
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