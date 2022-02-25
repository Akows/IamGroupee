<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>prj_dept</title>

	<!-- Theme style -->
	<link rel="stylesheet" href="${root}/resources/dist/css/adminlte.css">
	<!-- Favicon -->
	<link rel="shortcut icon" href="${root}/resources/img/svg/looo.png" type="image/x-icon">
	<!-- adminLTE CDN -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.1/dist/css/adminlte.min.css">

</head>
<body>
	
	<%@ include file="/WEB-INF/views/common/headerSide.jsp" %>
	  
	<main class="main container">
		<section class="content-header">
	      <div class="container-fluid">
	        <div class="row mb-2">
	          <div class="col-sm-6">
					<form action="" method="post">
						<button class="btn-primary btn-lg" type="submit" name="dept" value="@">
							@@부
						</button>
						<button class="btn-primary btn-lg" type="submit" name="dept" value="#">
							##부
						</button>
						<button class="btn-primary btn-lg" type="submit" name="dept" value="$">
							$$부
						</button>
						<button class="btn-primary btn-lg" type="submit" name="dept" value="%">
							%%부
						</button>
					</form>
	          </div>
	          <div class="col-sm-6">
	            <ol class="breadcrumb float-sm-right">
	              <li class="breadcrumb-item"><a href="http://127.0.0.1:8989/iag/main">Home</a></li>
	              <li class="breadcrumb-item active">Dept_Project</li>
	            </ol>
	          </div>
	        </div>
	      </div><!-- /.container-fluid -->
	    </section>
	    
	    <section class="content">
			<div class="container-fluid">

				<div class="row">
					<section class="col-lg-8 connectedSortable">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title"> Project List</h3>
							</div>

							<div class="card-body row">
								<div class="col-lg-6">
									<a href="http://127.0.0.1:8989/iag/prj/prjDetail">
										<div class="info-box bg-lightblue">
											<span class="info-box-icon"><i class="far fa-calendar-alt"></i></span>
								
											<div class="info-box-content">
												<span class="info-box-text">IAMGROUPE</span>
												<span class="info-box-number">%%부</span>
								
												<div class="progress">
												<div class="progress-bar" style="width: 70%"></div>
												</div>
												<span class="progress-description">
												70% Increase in 30 Days
												</span>
											</div><!-- /.info-box-content -->
										</div>
									</a>
								</div>
								<div class="col-lg-6">
									<div class="info-box bg-lightblue">
										<span class="info-box-icon"><i class="far fa-calendar-alt"></i></span>
							
										<div class="info-box-content">
											<span class="info-box-text">IAMGROUPE</span>
											<span class="info-box-number">%%부</span>
							
											<div class="progress">
											<div class="progress-bar" style="width: 70%"></div>
											</div>
											<span class="progress-description">
											70% Increase in 30 Days
											</span>
										</div><!-- /.info-box-content -->
									</div>
								</div> 

							</div>	
								
						</div>
					</section>

					<section class="col-lg-4 connectedSortable">
						<div class="card">
							<div class="card-header">
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

							<div class="card-body p-0">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>프로젝트명</th>
											<th>Progress</th>
											<th style="width: 40px">Label</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Update software</td>
											<td>
												<div class="progress progress-xs">
												<div class="progress-bar progress-bar-danger" style="width: 55%"></div>
												</div>
											</td>
											<td><span class="badge bg-danger">55%</span></td>
										</tr>
										<tr>
											<td>Clean database</td>
											<td>
												<div class="progress progress-xs">
												<div class="progress-bar bg-warning" style="width: 70%"></div>
												</div>
											</td>
											<td><span class="badge bg-warning">70%</span></td>
										</tr>
										<tr>
											<td>Cron job running</td>
											<td>
												<div class="progress progress-xs progress-striped active">
												<div class="progress-bar bg-primary" style="width: 30%"></div>
												</div>
											</td>
											<td><span class="badge bg-primary">30%</span></td>
										</tr>
										<tr>
											<td>Fix and squish bugs</td>
											<td>
												<div class="progress progress-xs progress-striped active">
												<div class="progress-bar bg-success" style="width: 90%"></div>
												</div>
											</td>
										<td><span class="badge bg-success">90%</span></td>
										</tr>
									</tbody>
								</table>
							</div><!-- /.card-body -->
						</div>
					</section>  <!-- /. left row -->
				</div>

			</div>	
		</section>
    </main>
	  
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>

	
</body>
</html>