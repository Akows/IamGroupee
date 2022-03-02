var eventModal = $("#eventModal");

var modalTitle = $(".modal-title"); // 일정 창 타이틀 (디비 연동 안 함)

var editTitle = $("input[name=schTitle]"); // 일정 명
var editStart = $("input[name=schStart]"); // 시작 날짜
var editEnd = $("input[name=schEnd]"); // 종료 날짜
var editAllDay = $("input[name=sch-allDay]"); // 종일 구분
var editHStart = $("select[name=sch-h-start]"); // 시작 시간
var editHEnd = $("select[name=sch-h-end]"); // 종료 시간
var editType = $("input[name=schWith]"); // 참석자 구분
var editDesc = $("textarea[name=schContent]"); // 일정 내용

var addBtnContainer = $(".modalBtnContainer-addEvent"); // 일정 등록일 시 표출 버튼
var modifyBtnContainer = $(".modalBtnContainer-modifyEvent"); // 일정 수정일 시 표출 버튼
var detailBtnContainer = $(".modalBtnContainer-detailEvent"); // 클릭 시 수정할 수 있게 변환

// ########## datepicker.js ##########
$("#date-picker1").datepicker({
	dateFormat: "yy-mm-dd",
	autoclose: true
});

$("#date-picker2").datepicker({
	dateFormat: "yy-mm-dd",
	autoclose: true
});

/*일정 등록 버튼*/
$(".schedule-btn").unbind("click");
$(".schedule-btn").on("click", function(e) {

	e.preventDefault();

	/*날짜, 시간 데이터 초기 설정*/
	var today = moment();
	var event_num = 0; // 일정 등록 num

	var startDate = moment(today).format("YYYY-MM-DD");
	var endDate = moment(today).format("YYYY-MM-DD");

	var startDateHour = moment(today).format("HH");
	var endDateHour = moment(today).add(1, "hours").format("HH");

	newEvent(startDate, endDate, startDateHour, endDateHour, event_num);
});

var newEvent = function(start, end, startDateHour, endDateHour, event_num) {

	eventModal.modal("show");

	$("#contextMenu").hide(); // 달력 일자 클릭 시 나오는 메뉴 숨김

	var array = new Array();
	var submitarray;

	/*비활성화 해제*/
	editTitle.attr("readonly", false);
	editDesc.attr("readonly", false);
	editStart.datepicker('option', 'disabled', false);
	editEnd.datepicker('option', 'disabled', false);
	editHStart.attr("disabled", false);
	editHEnd.attr("disabled", false);

	editType.prop("checked", false);
	editAllDay.prop("checked", false);
	
	$("#edit-target").empty();

	/*--일정 타입 구분 - 기본 값 : 공통 --*/
	$("input[id='type-common']").prop("checked", true);

	/*-- 종일 구분 - 기본 값 : 사용 --*/
	$("input[id='allDay-timeUse']").prop("checked", true);

	$("select[name=sch-h-start] option").attr("disabled", false);
	$("select[name=sch-h-end] option").attr("disabled", false);

	$("#selectTarget").attr("disabled", false);
	
	modalTitle.html('<h3>일정 등록</h3> <span class="underline"></span>');
	$('.modal-header p').html('새로운 일정을 등록합니다.');

	editTitle.val("");
	editStart.val(start);
	editEnd.val(end);
	editDesc.val("");

	// 시간 select 현재 시간 비교 후 선택 - 기본 설정
	editHStart.val(startDateHour).attr("selected", "selected");
	editHEnd.val(endDateHour).attr("selected", "selected");

	// 모달 창 유형에 따른 하단 버튼 표출
	addBtnContainer.show();
	modifyBtnContainer.hide();
	detailBtnContainer.hide();

	/*시간 사용에 따른 select 창 값 변경*/
	$("input[name='edit-allDay']").change(function() {
		var value = this.value;
		if (value == "1") {
			// 시간 사용

			editHStart.attr("disabled", false);
			editHEnd.attr("disabled", false);

			editHStart.val(startDateHour).attr("selected", "selected");
			editHEnd.val(endDateHour).attr("selected", "selected");
		} else if (value == "2") {
			// 미사용

			editHStart.attr("disabled", true);
			editHEnd.attr("disabled", true);

			editHStart.val("00").attr("selected", "selected");
			editHEnd.val("00").attr("selected", "selected");
		} else if (value == "3") {
			// 하루종일

			editHStart.attr("disabled", true);
			editHEnd.attr("disabled", true);

			editHStart.val("00").attr("selected", "selected");
			editHEnd.val("23").attr("selected", "selected");
		}
	});

	// 대상자 추가
	$("#selectTarget").on("click", function() {
		targetModal.modal("show");

		$("#uploadTarget").unbind();
		$("#uploadTarget").on("click", function() {

			$("#edit-target span").remove();

			array = [];

			var targetBtn = $("#edit-target-area button");

			$.each(targetBtn, function(i, item) {
				var obj = {
					value: item.value,
					name: item.name,
				};
				
				array.push(obj);
				// 대상자 추가 모달 외에는 추가 삭제 불가하게 disabled 속성 줌
				$("#edit-target").append(`<span class="badge badge-m bg-light gray-60 me-1 targetbutton" value="` + item.value + `" name="` + item.name + `" disabled>` + item.name + "</span>");
			});

			/*-- 대상자 null 방지 --*/
			if ($("#department").val() == "") {
				alert("대상자를 올바르게 지정해주세요.");
				return;
			}

			targetModal.modal("hide");
		});

		$("#schedule-sub-modal .btn-close").on("click", function() {
			targetModal.modal("hide");
		});
	});

	// 대상자 추가 모달창에서 이름 클릭 시 버튼 삭제와 동시에 array에 있는 해당 요소도 삭제
	$(document).on("click", "#edit-target-area > .targetbutton", function() {
		var removeTarget = array.indexOf($(this).val());
		array.splice(removeTarget, removeTarget + 1);
		$(this).remove();
	});

	//새로운 일정 저장버튼 클릭
	$("#registEvent").unbind();
	$("#registEvent").on("click", function() {

		submitarray = {
			targetdata: JSON.stringify(array),
		};

		var editAllDay = $("input[name=sch-allDay]:checked").val();

		var eventData = {
			title: editTitle.val(),
			start: editStart.val(),
			end: editEnd.val(),
			description: editDesc.val(),
			event_type: $("input[name=schWith]:checked").val(),
			all_day: editAllDay,
			target_user: submitarray,
			backgroundColor: $("input[name=schColor]:checked").attr('data-color'),
		};

		if (eventData.start > eventData.end) {
			alert("끝나는 날짜가 앞설 수 없습니다.");
			return false;
		}

		if (eventData.title === "") {
			alert("일정명은 필수입니다.");

			return false;
		}

		if (eventData.start == eventData.end) {
			if (editHStart.val() > editHEnd.val()) {
				alert("끝나는 시간이 앞설 순 없습니다.");
				return false;
			}
		}

		if (array.length < 1) {
			alert("대상자를 입력해주세요.");
			return false;
		}

		if (editAllDay == "3") { // 하루

			eventData.start = moment(eventData.start).format("YYYY-MM-DD 00:00");
			eventData.end = moment(eventData.end).format("YYYY-MM-DD 23:59");

		} else if (editAllDay == "2") { // 미사용

			eventData.start = moment(eventData.start).format("YYYY-MM-DD 00:00");
			eventData.end = moment(eventData.end).format("YYYY-MM-DD 00:00");

		} else if (editAllDay == "1") { // 사용

			var start_hours = $("select[name=edit-h-start] option:selected").val();
			var end_hours = $("select[name=edit-h-end] option:selected").val();

			var start_dateTime = eventData.start + " " + start_hours + ":00";
			var end_dateTime = eventData.end + " " + end_hours + ":00";

			eventData.start = moment(start_dateTime).format("YYYY-MM-DD HH:mm");
			eventData.end = moment(end_dateTime).format("YYYY-MM-DD HH:mm");
		}


		$("#schedule_calendar").fullCalendar("renderEvent", eventData, true);

		$("#selectTarget").unbind();

		//새로운 일정 저장
		$.ajax({
			type: "POST",
			url: "/papyrus/calender/ajax_insert_schedule",
			data: {
				eventData: eventData,
			},
			success: function(response) {
				$("#schedule_calendar").fullCalendar("removeEvents");
				$("#schedule_calendar").fullCalendar("refetchEvents");
				location.reload();
				alert("등록되었습니다.");
			},
		});
	});
};