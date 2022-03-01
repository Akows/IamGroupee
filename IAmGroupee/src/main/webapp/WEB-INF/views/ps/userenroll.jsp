<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IAMGROUPE-사용자 등록</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

    <!-- ! Main -->
    <main class="main users chart-page" id="skip-target">
     <div class="container">
     	<br>
       <h1>사용자 등록</h1>
       <hr>
       <br>
		<div class="row">
			<div class="col-lg-3"></div>
			<div class="col-lg-6">
			 <div class="card card-primary">
              <!-- /.card-header -->
              <!-- form start -->
              <form>

                <div class="card-body">
                  <div class="col-sm-6">
                  	<div class="form-group">
                  		<label for="email">Email</label>
                    		<input type="email" class="form-control" id="email" name="email" placeholder="Email">
                  	</div>
                  </div>
                  <div class="col-sm-6">
                  	<div class="form-group">
                  		<label for="pwd">Password</label>
                    		<input type="password" class="form-control" id="pwd" name="pwd" placeholder="Password">
                  	</div>
                  </div>
                  <div class="col-6">
                    <label for="exampleInputFile">Profile</label>
                    <div class="input-group">
                      <div class="custom-file">
                        <input type="file" class="custom-file-input" id="exampleInputFile">
                        <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                      </div>
                      <div class="input-group-append">
                        <span class="input-group-text">Upload</span>
                      </div>
                    </div>
                    </div>
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Submit</button>
                </div>
              </form>
            </div>
            <!-- /.card -->
			</div>
			<div class="col-lg-3"></div>
		</div>
      </div>
    </main>

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>

	<!-- Custom scripts -->
</body>
</html>