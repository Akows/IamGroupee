<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>prj_detail</title>

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
							<h1>${p.prjName}</h1>
						</div>
						
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="http://127.0.0.1:8989/iag/main">Home</a></li>
								<li class="breadcrumb-item active">Project Report</li>
							</ol>
						</div>
					</div> <!--/.row -->
	       		</div> <!--/.container-fluid -->
	    </section>
		
		<section class="content">
			<div class="container-fluid">
				<div class="row">

					<section class="col-lg-9 connectedSortable">
					
						<!-- Box Comment -->
						<div class="card card-widget">
							<div class="card-header">
								<div class="user-block">
								<img class="img-circle" src="${root}/resources/img/avatar/avatar-illustrated-01.png" alt="User Image">
								<span class="username"><a href="#">이지은</a></span>
								<span class="description">Shared publicly - 7:30 PM Today</span>
								</div>
							</div> <!-- /.card-header -->

							<div class="card-body">
								<img class="img-fluid pad" src="${root}/resources/dist/img/photo2.png" alt="Photo">
								<p>&nbsp</p>
								<p>I took this photo this morning. What do you guys think?</p>
								<p>&nbsp</p>
								<button type="button" class="btn btn-default btn-sm"><i class="fas fa-share"></i> Share</button>
								<button type="button" class="btn btn-default btn-sm"><i class="far fa-thumbs-up"></i> Like</button>
								<span class="float-right text-muted">127 likes - 1 comments</span>
							</div>

							<!-- /.card-body -->
							<div class="card-footer card-comments">
								<div class="card-comment">
									<!-- User image -->
									<img class="img-circle img-sm" src="${root}/resources/dist/img/user3-128x128.jpg" alt="User Image">
									<!-- /.comment-text -->
									<div class="comment-text">
										<span class="username">
										Maria Gonzales
										<span class="text-muted float-right">8:03 PM Today</span>
										</span><!-- /.username -->
										Good
									</div>
								</div>
							</div>

							<!-- /.card-footer -->
							<div class="card-footer">
								<form action="#" method="post">
								<img class="img-fluid img-circle img-sm" src="${root}/resources/img/avatar/avatar-illustrated-01.png" alt="Alt Text">
								<!-- .img-push is used to add margin to elements next to floating images -->
								<div class="img-push">
									<input type="text" class="form-control form-control-sm" placeholder="Press enter to post comment">
								</div>
								</form>
							</div>

						</div>
					</section>  <!-- /. left row -->
				
					<section class="col-lg-3 connectedSortable">
						
						<!-- prj info -->
						<div class="card card-widget widget-user-2">
							<div class="widget-user-header bg-gradient-primary">
							  <h4>IAMGROUPE</h4>
							  <h7>%%부, $$부</h7>
							</div>

							<div class="card-body">
								<strong><i class="fas fa-calendar-alt mr-1"></i> 프로젝트 기간</strong>
								<p class="text-muted">${viewPrj.period}</p>
								<hr>
								<strong><i class="fas fa-users mr-1"></i> 참여 부서</strong>
								<p class="text-muted">${viewPrj.departmentName}</p>
								<hr>
								<strong><i class="fas fa-user-cog"></i></i> 프로젝트 매니져</strong>
								<p class="text-muted">${viewPrj.name}</p>
							</div>

							<div class="card-footer p-0">
							  <ul class="nav flex-column">
								<li class="nav-item">
								  <a href="#" class="nav-link">
									공지사항 <span class="float-right badge bg-primary">3</span>
								  </a>
								</li>
								<li class="nav-item">
								  <a href="#" class="nav-link">
									업무 리포트 <span class="float-right badge bg-primary">31</span>
								  </a>
								</li>
								<li class="nav-item">
								  <a href="#" class="nav-link">
									이벤트 <span class="float-right badge bg-primary">12</span>
								  </a>
								</li>
							  </ul>
							</div>
						</div>

						<!-- TO DO -->
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">To Do List</h3>
							</div>
							<div class="card-body">
								<ul class="todo-list" data-widget="todo-list">
									<li>
										<!-- checkbox -->
										<div  class="icheck-primary d-inline ml-2">
											<input type="checkbox" value="" name="todo1" id="todoCheck1">
											<label for="todoCheck1"></label>
										</div>
										<!-- todo text -->
										<span class="text">IAMGROUPE</span>
										<!-- Emphasis label -->
										<small class="badge badge-danger"><i class="far fa-clock"></i> 3 days</small>
									</li>
									<li>
										<!-- checkbox -->
										<div  class="icheck-primary d-inline ml-2">
											<input type="checkbox" value="" name="todo1" id="todoCheck1">
											<label for="todoCheck1"></label>
										</div>
										<!-- todo text -->
										<span class="text">IAMGROUPE</span>
										<!-- Emphasis label -->
										<small class="badge badge-danger"><i class="far fa-clock"></i> 3 days</small>
									</li>
									<li>
										<!-- checkbox -->
										<div  class="icheck-primary d-inline ml-2">
											<input type="checkbox" value="" name="todo1" id="todoCheck1">
											<label for="todoCheck1"></label>
										</div>
										<!-- todo text -->
										<span class="text">IAMGROUPE</span>
										<!-- Emphasis label -->
										<small class="badge badge-danger"><i class="far fa-clock"></i> 3 days</small>
									</li>
								</ul>
							</div>
						</div> <!-- /.card -->


					</section>

				</div> <!-- /.row -->
			</div> <!-- /.container-fluid -->
		</section> <!-- /.content-body -->
	</div>
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