<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<%@page import="com.kh.iag.leave.entity.LvUsedListDto"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script type="text/javascript" src="//code.jquery.com/jquery-3.1.1.min.js"></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="${root}/resources/plugins/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="${root}/resources/plugins/daterangepicker/daterangepicker.css">
  <link rel="stylesheet" href="${root}/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <link rel="stylesheet" href="${root}/resources/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css">
  <link rel="stylesheet" href="${root}/resources/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <link rel="stylesheet" href="${root}/resources/plugins/select2/css/select2.min.css">
  <link rel="stylesheet" href="${root}/resources/plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
  <link rel="stylesheet" href="${root}/resources/plugins/bs-stepper/css/bs-stepper.min.css">
  <link rel="stylesheet" href="${root}/resources/plugins/dropzone/min/dropzone.min.css">
  <link rel="stylesheet" href="${root}/resources/dist/css/adminlte.min.css">
</head>

<body>
	<div class="card card-primary card-outline card-tabs" style="margin-top: 18% !important;width: 70%; margin: auto;">
		<div class="card-body" style="height: 100%;">
			<div id="letter"
				style="margin-bottom: 15px; height: 10%; margin-top: -5px;">
				<h4 style="color: rgb(94, 94, 94); font-weight: 600;">일정 등록</h4>
			</div>
			<form id="enrollSch">
				<div style="width: 100%;">
					<table>
						<tr>
							<td style="width: 30%;">일정명</td>
							<td style="width: 70% s;"><input type="text" name="schTitle" id="schTitle" required="required" /></td>
						</tr>

						<tr>
							<td>등록 일자</td>
							<td>
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> 
												<i class="far fa-calendar-alt"></i>
											</span>
										</div>
										<input type="text" class="form-control float-right" name="schEnroll" id="reservation">
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>구분</td>
							<td><select type="text" name="schType" id="schType">
									<option value="sch-common">개인 캘린더</option>
									<option value="sch-dept">부서 캘린더</option>
									<option value="sch-all">전사 캘린더</option>
							</select></td>
						</tr>

						<tr>
							<td>세부 사항</td>
							<td><textarea rows="4" cols="30" name="schContent"
									id="schContent"></textarea></td>
						</tr>
					</table>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="save-event" onclick="enrollSch();">저장</button>
				</div>
		</form>
	</div>
	</div>
</body>
	<script type="text/javascript">
    	$(function () {
      	  	$('#reservation').daterangepicker();
    	    $('#reservationdate').datetimepicker({
    	        format: 'L'
    	    });
    	    moment.locale('ko');
    	    $('#reservation').daterangepicker(
    	      {
    	        timePicker: false,
    	        timePicker24Hour: true,
    	        timePickerSeconds: true,
    	        singleDatePicker: false,
    	        locale :{ 
    	          format: 'YYYY-MM-DD',
    	          separator: '~',
    	          applyLabel: "적용",
    	          cancelLabel: "닫기"
    	        },
    	      });
    	  });

    	    function enrollSch(){
    	        var schTitle = $("#schTitle").val();
    	        var schEnroll = $("#reservation").val();
    	        var schType = $("#schType").val();
    	        var schContent = $("#schContent").val();

    	        $.ajax({
    	            cache : false,
    	            url : "${root}/sch/mySch",
    	            type : 'POST', 
                    data: {schTitle, schEnroll, schType, schContent},
                    dataType: 'text',
    	            success : function(data) {
        	            window.location.reload();
        	            window.parent.location.reload();
    	            },
    	            error : function(xhr, status) {
    	                alert(xhr + " : " + status);
    	            }
    	        });
    	    }
     </script>
<script src="${root}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${root}/resources/plugins/chart.js/Chart.min.js"></script>
<script src="${root}/resources/plugins/sparklines/sparkline.js"></script>
<script src="${root}/resources/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="${root}/resources/plugins/jquery-knob/jquery.knob.min.js"></script>
<script src="${root}/resources/plugins/moment/moment.min.js"></script>
<script src="${root}/resources/plugins/daterangepicker/daterangepicker.js"></script>
<script src="${root}/resources/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<script src="${root}/resources/plugins/summernote/summernote-bs4.min.js"></script>
<script src="${root}/resources/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<script src="${root}/resources/dist/js/adminlte.js"></script>
<script src="${root}/resources/dist/js/demo.js"></script>
<script src="${root}/resources/dist/js/pages/dashboard.js"></script>
</html>
