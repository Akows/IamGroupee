//SELECT 색 변경
$('#schColor').change(function () {
    $(this).css('color', $(this).val());
});

//필터
$('.filter').on('change', function () {
    $('#calendar').fullCalendar('rerenderEvents');
});

$("#type_filter").select2({
    placeholder: "선택..",
    allowClear: true
});

//datetimepicker
$("#schStart, #schEnd").datetimepicker({
    format: 'YYYY-MM-DD HH:mm'
});