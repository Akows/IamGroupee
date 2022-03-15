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
							<h1>[&nbsp;${viewPrj.prjName}&nbsp;]</h1>
						</div>
						
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="http://127.0.0.1:8989/iag/main">Home</a></li>
								<li class="breadcrumb-item active">Project Report</li>
							</ol>
						</div>
					</div> <!--/.row -->
				</div> <!--/.container-fluid -->
				<hr>
	    </section>
		
		
		<section class="content">
			<div class="container-fluid">
				<div class="row">

					<section class="col-lg-9 connectedSortable">
						<!-- reports -->
						<c:forEach items="${reportList}" var="r">
						<div class="card card-widget">
								<div class="card-header">
									<div class="row">
										<div class="col-lg-9">
											<h4><i class="fas fa-bullhorn"></i>&nbsp;&nbsp;${r.reportName}</h4>
										</div>

										<div class="user-block col-lg-3">
										<!-- <img class="img-circle" src="${r.profile}" alt="user"> -->
										<span class="username">${r.name}</span>
										<span class="description">${r.createDate}</span>
										</div>
									</div>
								</div> <!-- /.card-header -->
	
								<div class="card-body">
									<br>
										${r.reportContent}
									<br>
								</div>
	
								<!-- /.card-body -->
								<div class="card-footer card-comments">
									<div class="card-comment">
										<!-- User image -->
										<img class="img-circle img-sm" src="" alt="user">
										<!-- /.comment-text -->
										<div class="comment-text">
											<span class="username">
											Maria Gonzales
											<span class="text-muted float-right"></span>
											</span><!-- /.username -->
											댓글
										</div>
									</div>
								</div>
	
								<!-- /.card-footer -->
								<div class="card-footer">
									<!-- <img class="img-fluid img-circle img-sm" src="${loginUser.profile}" alt="Alt Text"> -->
									<!-- .img-push is used to add margin to elements next to floating images -->
									<div class="img-push">
										<div class="row">
											<div class="col-lg-11">
												<input type="text" class="form-control form-control-sm" id="content" placeholder="댓글을 입력해주세요.">
												<input style="display:none;" />
											</div>
											<div class="col-lg-1">
												<button type="button" class="btn btn-outline-primary btn-sm" onclick="comment();">등록</button>
											</div>
										</div>
										<input type="hidden" id="userNo" value="${loginUser.userNo}">
										<input type="hidden" id="reportNo" value="${r.reportNo}">
									</div>
								</div>
							</div>
						</c:forEach>
					</section>  <!-- /. left row -->
				
					<section class="col-lg-3 connectedSortable">
						
						<!-- prj info -->
						<div class="card card-widget widget-user-2">
							<div class="card-header">
								<div class="btn-group btn-block">
									<button class="btn btn-outline-primary" data-toggle="modal" data-target="#noti">공지</button>
									<button class="btn btn-outline-primary" data-toggle="modal" data-target="#sch">일정</button>
									<button class="btn btn-outline-primary" data-toggle="modal" data-target="#todo">할일</button>
									<button class="btn btn-outline-primary" data-toggle="modal" data-target="#work">업무</button>
								</div>
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

	<!-- 글 등록 모달 -->
	<!-- 일반글 -->
	<div class="modal fade" id="noti">
		<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
			  <h4 class="modal-title">공지사항 등록</h4>
			</div>
				<div class="modal-body">
					<div class="card-body">
						<div class="form-group">
							<label>글 제목</label>
							<input type="text" class="form-control" id="reportName" placeholder="글 제목을 입력하세요." required>
							
							<input type="hidden" class="form-control" id="reportType" value="G">
							<input type="hidden" class="form-control" id="userNo" value="${loginUser.userNo}">
							<input type="hidden" class="form-control" id="prjNo" value="${viewPrj.prjNo}">
						</div>

						<textarea id="summernote" required></textarea>
					</div>
				</div> <!-- /.modal-body -->
				<div class="modal-footer justify-content-between">
					<input type="button" value="취소" class="btn btn-default" data-dismiss="modal">
					<button type="button" onclick="upload();" class="btn btn-primary">생성</button>
				</div>
		</div> <!-- /.modal-content -->
		</div> <!-- /.modal-dialog -->
	</div>
	<!-- modal 끝! -->

	<script>
		
		$(function () {
			//summernote
			$("#summernote").summernote({
				dropdownParent: $("#noti"), //모달 내부에서 오픈
				lang: 'ko-KR',
				height: 300,  
				focus: true,
				placeholder : '내용을 입력하세요',
				callbacks: {	//여기 부분이 이미지를 첨부하는 부분
					onImageUpload : function(files) {
						uploadSummernoteImageFile(files[0],this);
					},
					onPaste: function (e) {
						var clipboardData = e.originalEvent.clipboardData;
						if (clipboardData && clipboardData.items && clipboardData.items.length) {
							var item = clipboardData.items[0];
							if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
								e.preventDefault();
							}
						}
					}
				}
			});
			
			//이미지 파일 업로드
			function uploadSummernoteImageFile(file, editor) {
				data = new FormData();
				data.append("file", file);
				$.ajax({
					data : data,
					type : "POST",
					url : "${root}/prj/file/${viewPrj.prjNo}",
					contentType : false,
					processData : false,
					success : function(data) {
						//항상 업로드된 파일의 url이 있어야 한다.
						$(editor).summernote('insertImage', data.url);
					}
				});
			};	

			
		});

		function upload(){
			let param = {
				"reportName" : $('#reportName').val(),
				"reportType" : $('#reportType').val(),
				"reportContent" : $('#summernote').val(),
				"userNo" : $('#userNo').val(),
				"prjNo" : $('#prjNo').val(),
			}

			if(confirm("공지를 등록하시겠습니까?") == true){
				$.ajax({
					type : 'POST',
					url : "${root}/prj/post",
					data : param,
					success : function(data){
						alert("글이 정상적으로 등록되었습니다.");
					},
					error : function(e){
						alert("글 등록에 실패하였습니다.");
					},
					complete : function(){
						window.location.reload();
					}
				});
			}else {
				return false;
			}
		}

		function comment(){
			let param = {
				"reportNo" : $('#reportNo').val(),
				"content" : $('#content').val(),
				"userNo" : $('#userNo').val(),
			}
			$.ajax({
				type : 'POST',
				url : "${root}/prj/comm",
				data : param,
				success : function(){
					window.location.reload();
				},
				error : function(e){
					alert("댓글 등록에 실패하였습니다.");
				}
			});
		}

	</script>

	<%@ include file="/WEB-INF/views/common/footer.jsp" %>

	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>

	<!-- Summernote -->
	<script src="${root}/resources/plugins/summernote/summernote-bs4.min.js"></script>	
	<link rel="stylesheet" href="${root}/resources/plugins/summernote/summernote-bs4.min.css">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.js"></script>
	

</body>
</html>