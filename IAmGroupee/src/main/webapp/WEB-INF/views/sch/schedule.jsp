<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Schedule Page</title>
  
  <c:set var="root" value="${pageContext.request.contextPath}"/>

  <!-- FullCalendar -->
  <link rel='stylesheet' href='${root}/resources/css/sch/fullcalendar.min.css' />
  <link rel='stylesheet' href='${root}/resources/css/sch/bootstrap.min.css' />
  <link rel='stylesheet' href='${root}/resources/css/sch/select2.min.css' />
  <link rel='stylesheet' href='${root}/resources/css/sch/bootstrap-datetimepicker.min.css' />
  
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  
  <link rel='stylesheet' href='${root}/resources/css/sch/main.css' />

</head>

<body>
	<div class="container">
	
	        <!-- 일자 클릭시 메뉴오픈 -->
	        <div id="contextMenu" class="dropdown clearfix">
	            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
	                style="display:block;position:static;margin-bottom:5px;">
	                <li>
	                	<a tabindex="-1" href="#">
	                		<input class="filter common input-edit-type-1" type="hidden" name="edit-type" id="sch-common" value="1" data-color="#ff8787" data-colorName="commonRed"/>
                    		<label for="type-common" style="color: #ff8787">기본 캘린더</label>
                    	</a>
                    </li>
	                <li>
	                	<a tabindex="-1" href="#">
	                		<input class="filter personal input-edit-type-2" type="hidden" name="edit-type" id="sch-dept" value="2" data-color="#4dabf7" data-colorName="personalBlue"/>
                    		<label for="type-personal" style="color: #4dabf7">부서 캘린더</label>
                    	</a>
                    </li>
                    <li>
	                	<a tabindex="-1" href="#">
	                		<input class="filter share input-edit-type-3" type="hidden" name="edit-type" id="sch-all" value="3" data-color="#64b578" data-colorName="shareGreen" />
                    		<label for="type-share" style="color: #64b578">전사 캘린더</label>
                    	</a>
                    </li>
	                <li class="divider"></li>
	                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
	            </ul>
	        </div>
	
	        <div id="wrapper">
	            <div id="loading"></div>
	            <div id="calendar"></div>
	        </div>
	
	
	        <!-- 일정 추가 MODAL -->
	        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
	            <div class="modal-dialog" role="document">
	                <div class="modal-content">
	                    <div class="modal-header">
	                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
	                                aria-hidden="true">&times;</span></button>
	                        <h4 class="modal-title">일정 등록</h4>
	                    </div>
	                    <div class="modal-body">
	                    
							<form id="sch-data">
							
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="schAllDay">하루종일</label>
		                                <input class='allDayNewEvent' id="schAllDay" type="checkbox">
		                            </div>
		                        </div>
		
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="schTitle">일정명</label>
		                                <input class="inputModal" type="text" name="schTitle" id="schTitle"
		                                    required="required" />
		                            </div>
		                        </div>
		                        
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="schStart">시작</label>
		                                <input class="inputModal" type="text" name="schStart" id="schStart" />
		                            </div>
		                        </div>
		                        
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="schEnd">끝</label>
		                                <input class="inputModal" type="text" name="schEnd" id="schEnd" />
		                            </div>
		                        </div>
		                        
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="schType">구분</label>
		                                <select class="inputModal" type="text" name="schType" id="schType">
		                                    <option value="sch-common">기본 캘린더</option>
		                                    <option value="sch-dept">부서 캘린더</option>
		                                    <option value="sch-all">전사 캘린더</option>
		                                </select>
		                            </div>
		                        </div>
		                        
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="SchColor">색상</label>
		                                <select class="inputModal" name="SchColor" id="SchColor">
		                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
		                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
		                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
		                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
		                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
		                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
		                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
		                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
		                                    <option value="#495057" style="color:#495057;">검정색</option>
		                                </select>
		                            </div>
		                        </div>
		                        
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="schContent">설명</label>
		                                <textarea rows="4" cols="50" class="inputModal" name="schContent"
		                                    id="schContent"></textarea>
		                            </div>
		                        </div>
		                        
	                        </form>
	                        
	                    </div>
	                    <div class="modal-footer modalBtnContainer-addEvent">
	                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
	                    </div>
	                    
	                    <div class="modal-footer modalBtnContainer-modifyEvent">
	                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
	                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
	                    </div>
	                    
	                </div><!-- /.modal-content -->
	            </div><!-- /.modal-dialog -->
	        </div><!-- /.modal -->
	</div>
	<!-- /.container -->
	
	<!-- Custom scripts -->
	<script src="${root}/resources/js/script.js"></script>
	<!-- FullCalendar js -->
	<script src='${root}/resources/js/sch/jquery.min.js'></script>
	<script src='${root}/resources/js/sch/bootstrap.min.js'></script>
	<script src='${root}/resources/js/sch/moment.min.js'></script>
	<script src='${root}/resources/js/sch/fullcalendar.min.js'></script>
	<script src='${root}/resources/js/sch/ko.js'></script>
	<script src='${root}/resources/js/sch/select2.min.js'></script>
	<script src='${root}/resources/js/sch/bootstrap-datetimepicker.min.js'></script>
	
	<script src='${root}/resources/js/sch/main.js'></script>
	<script src='${root}/resources/js/sch/addEvent.js'></script>
	<script src='${root}/resources/js/sch/editEvent.js'></script>
	<script src='${root}/resources/js/sch/etcSetting.js'></script>

</body>

</html>