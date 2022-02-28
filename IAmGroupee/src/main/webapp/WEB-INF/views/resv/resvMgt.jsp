<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>resv_management</title>

	<!-- Theme style -->
	<link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
	<!-- Favicon -->
	<link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">
	<!-- jsGrid -->
	<link rel="stylesheet" href="${root}/resources/plugins/jsgrid/jsgrid.min.css">
	<link rel="stylesheet" href="${root}/resources/plugins/jsgrid/jsgrid-theme.min.css">

</head>
<body>
	
	<%@ include file="/WEB-INF/views/common/headerSide.jsp" %>
	 
	<main class="main container">
		<section class="content-header">
        		<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>예약 자산 관리</h1>
						</div>
						
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="http://127.0.0.1:8989/iag/main">Home</a></li>
								<li class="breadcrumb-item active">Asset Management</li>
							</ol>
						</div>
					</div> <!--/.row -->
	       		</div> <!--/.container-fluid -->
	    </section>
		
		<section class="content">
			<div class="container-fluid">
				
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">
							<button class="btn-primary btn" id="btnAdd" type="button" onclick="AddClick()">Add User</button>
						</h3>	
						<div class="card-tools">
							<form action="simple-results.html">
								<div class="input-group">
									<input type="search" class="form-control form-control-lg" placeholder="Type your keywords here">
									<div class="input-group-append">
										<button type="submit" class="btn btn-lg btn-default">
											<i class="fa fa-search"></i>
										</button>
									</div>
								</div>
							</form>	
						</div>
					</div>

					<div class="card-body">
						<div id="jsGrid"></div>
					</div> 
				</div>
				
			</div> <!-- /.container-fluid -->
		</section> <!-- /.content-body -->
	</main>    

	<%@ include file="/WEB-INF/views/common/footer.jsp" %>

	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>

	<!-- jsGrid -->
	<script src="${root}/resources/plugins/jsgrid/demos/db.js"></script>
	<script src="${root}/resources/plugins/jsgrid/jsgrid.min.js"></script>
	<script src="${root}/resources/js/resv/addEvents.js"></script>

</body>
</html>