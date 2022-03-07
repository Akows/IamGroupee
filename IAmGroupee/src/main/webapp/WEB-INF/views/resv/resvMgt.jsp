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
	
	<style>
	.hide
	{
		display:none;
	}
	</style>

</head>
<body>
	
	<%@ include file="/WEB-INF/views/common/headerSide.jsp" %>
	 
	<main class="main container">
		<section class="content-header">
        		<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>예약 자산</h1>
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
							<h3 class="card-title">회의실 목록 관리</h3>	
						</h3>	
					</div>

					<div class="card-body">
						<div id="jsGrid1"></div>
					</div>
				</div>
		
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">비품 목록 관리</h3>	
					</div>

					<div class="card-body">
						<div id="jsGrid2"></div>
					</div> 
				</div>

			</div> <!-- /.container-fluid -->
		</section> <!-- /.content-body -->
	</main>    

	<script>
		$(function () {

			$("#jsGrid1").jsGrid({
				width: "100%",
				height: "auto",
				inserting:true,
				editing: true,
				sorting: true,
				paging: true,
				autoload: true,
				deleteConfirm: function(item) {
					return item.roomName + "을 정말 삭제하시겠습니까?"
				},
				fields: [ 
					{	name: "roomNo", type: "hidden",  css: 'hide'},
					{	name: "roomName", title:"회의실이름",type: "text", validate: "required", width: 100 },
					{	name: "detail", title: "세부사항", type: "text", width: 150 },
					{	name: "activateYn",title:"활성화",id:"check", type: "checkbox", width: 70 },
					{	name: "reserved", title: "예약상태", readOnly: true, width: 70 , align:"center"},
					{	name: "createDate", title: "생성일",type: "date", width: 100},
					{	name: "modDate" ,title: "수정일",type: "date", width: 100 },
					{ 	type: "control", width:50}
				], 
				controller:  {
					loadData: function(filter) {
						var d = $.Deferred();
						$.ajax({
						contentType : "application/json; charset=UTF-8",
						type: "GET",
						url: "<%=request.getContextPath()%>/admin/resv/room",
							dataType: "json",
							data: filter
						}).done(function(response) {
						if(response.status == "ok") {
							$("#check").prop("checked", false);
							d.resolve(response.data);	
						}
						});
						return d.promise();
					}
					,insertItem: function(item) {
						return $.ajax({
							contentType : "application/json; charset=UTF-8",
							type: "POST",
							url: "<%=request.getContextPath()%>/admin/resv/room",
							dataType: "json",
							data: JSON.stringify(item)
						}).done(function(response) {
							if(response.status == "ok") {
								alert("등록되었습니다.");
								location.reload();
							}
						});
					}
					,updateItem: function(item) {
		                return $.ajax({
		                	contentType : "application/json; charset=UTF-8",
		                	type: "POST",
		                    url: "<%=request.getContextPath()%>/admin/resv/room/"+item.roomNo,
		                    dataType: "json",
		                    data: JSON.stringify(item)
		                }).done(function(response) {
		                	if(response.status == "ok") {
		                		alert("수정되었습니다.");
		                		location.reload();
		                	}
		                });
		            }
					,deleteItem: function(item) {
						return $.ajax({
							contentType : "application/json; charset=UTF-8",
							type: "PUT",
							url: "<%=request.getContextPath()%>/admin/resv/room/"+item.roomNo,
							dataType: "json",
							data: item
						}).done(function(response) {
							if(response.status == "ok") {
								alert("삭제되었습니다.");
								location.reload();
							}
						});
					}
            
				}	
			});

			$("#jsGrid2").jsGrid({
				width: "100%",
				height: "auto",
				inserting:true,
				editing: true,
				sorting: true,
				paging: true,
				autoload: true,
				deleteConfirm: function(item) {
					return item.assetName + "을 정말 삭제하시겠습니까?"
				},
				fields: [ 
					{	name: "assetNo", type: "hidden",  css: 'hide'},
					{	name: "assetName", title:"자산이름",type: "text", validate: "required", width: 100 },
					{	name: "detail", title: "세부사항", type: "text", width: 150 },
					{	name: "activateYn",title:"활성화",id:"check", type: "checkbox", width: 70 },
					{	name: "reserved", title: "예약상태", readOnly: true, width: 70 , align:"center"},
					{	name: "createDate", title: "생성일",type: "date", width: 100},
					{	name: "modDate" ,title: "수정일",type: "date", width: 100 },
					{ 	type: "control", width:50}
				], 
				controller:  {
					loadData: function(filter) {
						var d = $.Deferred();
						$.ajax({
						contentType : "application/json; charset=UTF-8",
						type: "GET",
						url: "<%=request.getContextPath()%>/admin/resv/asset",
							dataType: "json",
							data: filter
						}).done(function(response) {
						if(response.status == "ok") {
							$("#check").prop("checked", false);
							d.resolve(response.data);	
						}
						});
						return d.promise();
					}
					,insertItem: function(item) {
						return $.ajax({
							contentType : "application/json; charset=UTF-8",
							type: "POST",
							url: "<%=request.getContextPath()%>/admin/resv/asset",
							dataType: "json",
							data: JSON.stringify(item)
						}).done(function(response) {
							if(response.status == "ok") {
								alert("등록되었습니다.");
								location.reload();
							}
						});
					}
					,updateItem: function(item) {
		                return $.ajax({
		                	contentType : "application/json; charset=UTF-8",
		                	type: "POST",
		                    url: "<%=request.getContextPath()%>/admin/resv/asset/"+item.assetNo,
		                    dataType: "json",
		                    data: JSON.stringify(item)
		                }).done(function(response) {
		                	if(response.status == "ok") {
		                		alert("수정되었습니다.");
		                		location.reload();
		                	}
		                });
		            }
					,deleteItem: function(item) {
						return $.ajax({
							contentType : "application/json; charset=UTF-8",
							type: "PUT",
							url: "<%=request.getContextPath()%>/admin/resv/asset/"+item.assetNo,
							dataType: "json",
							data: item
						}).done(function(response) {
							if(response.status == "ok") {
								alert("삭제되었습니다.");
								location.reload();
							}
						});
					}
            
				}
				
					
			});

			$(function () {
				$("#example1").DataTable({
				"responsive": true, "lengthChange": false, "autoWidth": false,
				"buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
				}).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
				
			});

    });
 
	</script>

	<%@ include file="/WEB-INF/views/common/footer.jsp" %>

	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>

	<!-- jsGrid -->
	<link rel="stylesheet" href="${root}/resources/plugins/jsgrid/jsgrid.min.css">
	<link rel="stylesheet" href="${root}/resources/plugins/jsgrid/jsgrid-theme.min.css">
	<script src="${root}/resources/plugins/jsgrid/jsgrid.min.js"></script>
	

	
</body>
</html>