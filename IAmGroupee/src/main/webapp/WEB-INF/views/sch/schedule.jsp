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
  <link rel="shortcut icon" href="${root}/resources/img/sch/favicon.ico">
  
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
	<!-- schedule-form -->
	<form action="get" id="schedule-form">
        <!-- 일자 클릭시 메뉴오픈 -->
        <div id="contextMenu" class="dropdown clearfix">
	            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
	                style="display:block;position:static;margin-bottom:5px;">
	                <li>&nbsp;
                    <input class="filter common input-edit-type-1" type="hidden" name="type-common" id="type-common" value="1" data-color="#ff8787" data-colorName="commonRed"/>
                    <label for="type-common" style="color: #ff8787">&nbsp;기본 캘린더</label>
                  </li>
                  <li>&nbsp;
                    <input class="filter personal input-edit-type-2" type="hidden" name="type-dept" id="type-dept" value="2" data-color="#4dabf7" data-colorName="personalBlue"/>
                    <label for="type-dept" style="color: #4dabf7">&nbsp;부서 캘린더</label>
                  </li>
                  <li>&nbsp;
                    <input class="filter share input-edit-type-3" type="hidden" name="type-all" id="type-all" value="3" data-color="#64b578" data-colorName="shareGreen" />
                    <label for="type-all" style="color: #64b578">&nbsp;전사 캘린더</label>
                  </li>
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
                    	<div class="modal-title">
	                        <h3>일정 등록</h3>
	          				<span class="underline"></span>
          				</div>
          				
          				<p></p>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
                    </div>
                    <div class="modal-body">
						<!-- 일정명 -->
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="schTitle">일정명</label>
                                <input class="inputModal" type="text" name="schTitle" id="schTitle"
                                    required="required" placeholder="제목을 입력해주세요." />
                            </div>
                        </div>
                        
                        <!-- 시작/종료일 -->
                        <div class="row">
                        	<div class="col-xs-12">
	                          <label class="modal-label" for="date-picker1">시작/종료일</label>
				              <input type="text" id="date-picker1" class="inputModal form-control" aria-label="Search" aria-describedby="basic-addon2" name="schStart" />
				              <input type="text" id="date-picker2" class="inputModal form-control" aria-label="Search" aria-describedby="basic-addon2" name="schEnd" />
				              <span class="icon-date"><i class="ri-calendar-2-fill"></i></span>
			            	</div>
                        </div>
                        
                        <!-- 시작/종료 시간 -->
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">시작/종료 시간</label>
                                <div class="edit-allDay-area">
				                <div class="tab-btns-w100 mb-2">
				                  <ul class="tab-btns-ul">
				                    <li><input id="allDay-timeUse" name="sch-allDay" type="radio" value="1" /> <label for="allDay-timeUse">사용</label></li>
				                    <li><input id="allDay-timeUnuse" name="sch-allDay" type="radio" value="2" /> <label for="allDay-timeUnuse">미사용</label></li>
				                    <li><input id="allDay-allDay" name="sch-allDay" type="radio" value="3" /> <label for="allDay-allDay">하루종일</label></li>
				                  </ul>
				                </div>
				                <div class="input-group w-100">
				                  <select class="form-select" name="sch-h-start">
				                    <option value="00">00시</option>
				                    <option value="01">01시</option>
				                    <option value="02">02시</option>
				                    <option value="03">03시</option>
				                    <option value="04">04시</option>
				                    <option value="05">05시</option>
				                    <option value="06">06시</option>
				                    <option value="07">07시</option>
				                    <option value="08">08시</option>
				                    <option value="09">09시</option>
				                    <option value="10">10시</option>
				                    <option value="11">11시</option>
				                    <option value="12">12시</option>
				                    <option value="13">13시</option>
				                    <option value="14">14시</option>
				                    <option value="15">15시</option>
				                    <option value="16">16시</option>
				                    <option value="17">17시</option>
				                    <option value="18">18시</option>
				                    <option value="19">19시</option>
				                    <option value="20">20시</option>
				                    <option value="21">21시</option>
				                    <option value="22">22시</option>
				                    <option value="23">23시</option>
				                  </select>
				                  <select class="form-select" name="sch-h-end">
				                    <option value="00">00시</option>
				                    <option value="01">01시</option>
				                    <option value="02">02시</option>
				                    <option value="03">03시</option>
				                    <option value="04">04시</option>
				                    <option value="05">05시</option>
				                    <option value="06">06시</option>
				                    <option value="07">07시</option>
				                    <option value="08">08시</option>
				                    <option value="09">09시</option>
				                    <option value="10">10시</option>
				                    <option value="11">11시</option>
				                    <option value="12">12시</option>
				                    <option value="13">13시</option>
				                    <option value="14">14시</option>
				                    <option value="15">15시</option>
				                    <option value="16">16시</option>
				                    <option value="17">17시</option>
				                    <option value="18">18시</option>
				                    <option value="19">19시</option>
				                    <option value="20">20시</option>
				                    <option value="21">21시</option>
				                    <option value="22">22시</option>
				                    <option value="23">23시</option>
				                  </select>
				                </div>
				              </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="schWith">참석자</label>
                                <select class="inputModal" type="text" name="schWith" id="schWith">
                                    <option value="카테고리1">김사원</option>
                                    <option value="카테고리2">이대리</option>
                                    <option value="카테고리3">박과장</option>
                                    <option value="카테고리4">최부장</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="schColor">색상</label>
                                <select class="inputModal" name="schColor" id="schColor">
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
                                    id="schContent" placeholder="내용을 입력해주세요."></textarea>
                            </div>
                        </div>            
                    </div>
                    <!-- 일정 등록일 시 표출 버튼 -->
			        <div class="modal-footer modalBtnContainer-addEvent">
			          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			          <button type="button" class="btn btn-primary" id="registEvent">저장</button>
			        </div>
			        <!--  일정 클릭 시 상세보기 버튼 -->
			        <div class="modal-footer modalBtnContainer-detailEvent">
			          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			          <button type="button" class="btn btn-primary" id="detailEvent">수정</button>
			        </div>
			        <!-- 일정 수정일 시 표출 버튼 -->
			        <div class="modal-footer modalBtnContainer-modifyEvent">
			          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			          <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
			          <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
			        </div>	        
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
        <!-- /.filter panel -->
        </form> <!-- /schedule-form -->
    </div>
    <!-- /.container -->

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