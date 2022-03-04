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
	  
	<main class="main">
	<div class="container">

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
								<table class="table table-striped projects">
									<thead>
										<tr>
											<th style="width: 30%">
												Project Name
											</th>
											<th style="width: 20%">
												Dept
											</th>
											<th>
												Project Progress
											</th>
											<th style="width: 10%" class="text-center">
												Status
											</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>
												<a>
													IAMGROUPE
												</a>
												<br/>
												<small>
													Created 2020.03.03
												</small>
											</td>
											<td>
												<ul class="list-inline">
													<li class="list-inline-item">@@부</li>
													<li class="list-inline-item">##부</li>
												</ul>
											</td>
											<td class="project_progress">
												<div class="progress progress-sm">
													<div class="progress-bar bg-green" role="progressbar" aria-valuenow="57" aria-valuemin="0" aria-valuemax="100" style="width: 57%">
													</div>
												</div>
												<small>
													57% Complete
												</small>
											</td>
											<td class="project-state">
												<span class="badge badge-success">Success</span>
											</td>
										</tr>
										<tr>
											<td>
												<a>
													IAMGROUPE
												</a>
												<br/>
												<small>
													Created 2020.03.03
												</small>
											</td>
											<td>
												<ul class="list-inline">
													<li class="list-inline-item">@@부</li>
													<li class="list-inline-item">##부</li>
												</ul>
											</td>
											<td class="project_progress">
												<div class="progress progress-sm">
													<div class="progress-bar bg-green" role="progressbar" aria-valuenow="57" aria-valuemin="0" aria-valuemax="100" style="width: 57%">
													</div>
												</div>
												<small>
													57% Complete
												</small>
											</td>
											<td class="project-state">
												<span class="badge badge-success">Success</span>
											</td>
										</tr>
										
									</tbody>
								</table>
							</div>
						</div>
					</section>

					<section class="col-lg-4 connectedSortable">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title"> card-title</h3>
							</div>
							<div class="card-body">
								asd
							</div> 
						</div>
					</section>

				</div>
			</div>
		</section>

	</div>	
    </main>

	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>

	
</body>
</html>