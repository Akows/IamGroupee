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
	  
	<main class="container">
		<section class="content-header">
	      <div class="container-fluid">
	        <div class="row mb-2">
	          <div class="col-sm-6">
	            <h1>부서별 프로젝트</h1>
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
	    
	    <section class="connectedSortable">
            	<div class="card">
                	<div class="card-header">
                    	<h3 class="card-title">Project List</h3>	
                	</div>
                	
              		<div class="card card-primary card-outline card-outline-tabs">
	              <div class="card-header p-0 border-bottom-0">
	                <ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist">
	                  <li class="nav-item">
	                    <a class="nav-link active" id="custom-tabs-four-home-tab" data-toggle="pill" href="#custom-tabs-four-home" role="tab" aria-controls="custom-tabs-four-home" aria-selected="true">&&부</a>
	                  </li>
	                  <li class="nav-item">
	                    <a class="nav-link" id="custom-tabs-four-profile-tab" data-toggle="pill" href="#custom-tabs-four-profile" role="tab" aria-controls="custom-tabs-four-profile" aria-selected="false">##부</a>
	                  </li>
	                  <li class="nav-item">
	                    <a class="nav-link" id="custom-tabs-four-messages-tab" data-toggle="pill" href="#custom-tabs-four-messages" role="tab" aria-controls="custom-tabs-four-messages" aria-selected="false">@@부</a>
	                  </li>
	                  <li class="nav-item">
	                    <a class="nav-link" id="custom-tabs-four-settings-tab" data-toggle="pill" href="#custom-tabs-four-settings" role="tab" aria-controls="custom-tabs-four-settings" aria-selected="false">$$부</a>
	                  </li>
	                </ul>
	              </div>
	              <div class="card-body">
	                <div class="tab-content" id="custom-tabs-four-tabContent">
	                  <div class="tab-pane fade show active" id="custom-tabs-four-home" role="tabpanel" aria-labelledby="custom-tabs-four-home-tab">
	                    <div class="card-body">
                		<div class="info-box mb-3 bg-lighst">
                			<div class="info-box-content">IAMGROUPE</div>
                		</div>
              		</div> 
              		<div class="card-body">
                		<div class="info-box mb-3 bg-lighst">
                			<div class="info-box-content">IAMGROUPE</div>
                		</div>
              		</div>
              		<div class="card-body">
                		<div class="info-box mb-3 bg-lighst">
                			<div class="info-box-content">IAMGROUPE</div>
                		</div>
              		</div>
              		<div class="card-body">
                		<div class="info-box mb-3 bg-lighst">
                			<div class="info-box-content">IAMGROUPE</div>
                		</div>
              		</div>
              		<div class="card-body">
                		<div class="info-box mb-3 bg-lighst">
                			<div class="info-box-content">IAMGROUPE</div>
                		</div>
              		</div>
	                  </div>

	                </div>
	              </div>
	            </div>
				</div> <!-- /.card -->
			</section>
    </main>
	  
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
	
</body>
</html>