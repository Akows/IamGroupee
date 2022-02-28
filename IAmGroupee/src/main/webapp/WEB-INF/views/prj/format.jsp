<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>format</title>

	<!-- Theme style -->
	<link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
	<!-- Favicon -->
	<link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">
	
</head>
<body>
	
	<%@ include file="/WEB-INF/views/common/headerSide.jsp" %>
	 
	<main class="main container">
		<section class="content-header">
        		<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>Project name</h1>
							<button class="btn-primary btn-lg">
								button name
							</button>
						</div>
						
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="http://127.0.0.1:8989/iag/main">Home</a></li>
								<li class="breadcrumb-item active">page name</li>
							</ol>
						</div>
					</div> <!--/.row -->
	       		</div> <!--/.container-fluid -->
	    </section>
		
		<section class="content">
			<div class="container-fluid">

				<div class="row">
					<section class="col-lg-7 connectedSortable">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title"> card-title</h3>
							</div>
							<div class="card-body">
							</div> 
						</div>
					</section>  <!-- /. left row -->
				
					<section class="col-lg-5 connectedSortable">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title"> card-title</h3>
							</div>
							<div class="card-body">
							</div> 
						</div>
					</section>
				</div> <!-- /.row -->
				
			</div> <!-- /.container-fluid -->
		</section> <!-- /.content-body -->
	</main>    


	<script>
		
		$(function () {

		})

	</script>

	<%@ include file="/WEB-INF/views/common/footer.jsp" %>

	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>

</body>
</html>