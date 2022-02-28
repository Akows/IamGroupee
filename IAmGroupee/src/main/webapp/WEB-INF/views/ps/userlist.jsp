<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IAMGROUPE-임직원 관리</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

    <!-- ! Main -->
    <main class="main users chart-page" id="skip-target">
     <div class="container">
     	<br>
       <h1>임직원 관리</h1>
       <hr>
       <br>
       <br>
       <div class="row">
        <div class="col-12">
            <div class="card">
              <div class="card-header">
                <a href="${root}/admin/ps/userenroll">사용자 추가 +</a>

                <div class="card-tools">
                  <div class="input-group" style="width: 250px;">
                    <input type="text" name="table_search" class="form-control float-right" placeholder="사번/이름">

                    <div class="input-group-append">
                      <button type="submit" class="btn btn-default">
                        <i class="fas fa-search"></i>
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap">
                  <thead>
                    <tr>
                      	<th>사번</th>
       					<th>이름</th>
       					<th>전화번호</th>
       					<th>조직</th>
       					<th>직위</th>
       					<th>직무</th>
       					<th>상태</th>
       					<th>수정</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1111</td>
                      <td>박재한</td>
                      <td>010-4666-9408</td>
                      <td>인사팀</td>
                      <td>사원</td>
                      <td>인사관리</td>
                      <td>활성화</td>
                      <td>수정버튼</td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
       		
       					

       </div>

      </div>
    </main>

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>

	<!-- Custom scripts -->
	<script type="text/javascript">
		
	</script>
</body>
</html>