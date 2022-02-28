$(function() { 
  
  //Custom 타입 등록(자동완성), Regist Custom Type(autocomplete)
  var colProgram = function(config) {
    jsGrid.Field.call(this, config);
  };
  colProgram.prototype = new jsGrid.Field({
    sorter: function(t1, t2) {
      return t1.localeCompare(t2);
    },
    itemTemplate: function(value) {
      
      return '<span class="label label-success">'+value+'</span>';
    },
    insertTemplate: function(value) {
      return this._insertAuto = $("<input>").autocomplete({source : programs});
    },
    editTemplate: function(value) {
      return this._editAuto = $("<input>").autocomplete({source : programs}).val(value);
    },
    insertValue: function() {
      return this._insertAuto.val();
    },
    editValue: function() {
      return this._editAuto.val();
    }
  });

  jsGrid.fields.Program = colProgram;
  
  $("#jsGrid").jsGrid({
    width: "100%",
    filtering: false,
    inserting: true,
    editing: true,
    sorting: true,
    paging: true,
    pageSize: 20,
    pagerFormat: "Pages: {prev} {pages} {next} {last} &nbsp;&nbsp; Showing {pageIndex} of {pageCount} &nbsp;&nbsp; Total Count: {itemCount}",
    headerRowRenderer: function () { //2중 헤더 만듬, regist multi-header
      var $result = $("<tr>").height(0)
        .append($("<th>").width(150))
        .append($("<th>").width("30%"))
        .append($("<th>").width(80))  
        .append($("<th>").width(100))
        .append($("<th>").width("30%"))
        .append($("<th>").width("30%"))
        .append($("<th>").width("10%"));
      $result = $result.add($("<tr>")
        .append($("<th class='jsgrid-cell js-header'>").attr("rowspan", 2).text("User Name"))
        .append($("<th class='jsgrid-cell js-header'>").attr("rowspan", 2).text("Use Program"))
        .append($("<th class='jsgrid-cell js-header'>").attr("colspan", 2).text("Info"))
        .append($("<th class='jsgrid-cell js-header'>").attr("rowspan", 2).text("Err Count"))
        .append($("<th class='jsgrid-cell js-header'>").attr("rowspan", 2).text("Control1"))
        .append($("<th class='jsgrid-cell js-header'>").attr("rowspan", 2).text("Control2")));
      $result = $result.add($("<tr>")
        .append($("<th class='jsgrid-cell js-header'>").text("use?"))
        .append($("<th class='jsgrid-cell js-header'>").text("age")));

      return $result;
    },
    fields: [
      { name: "Name", type: "text" ,width: 150},
      { name: "ProgramName", type: "Program", title: "Program Name", width: "30%", align: "left" },
      { name: "Check", type: "checkbox", title: "USE?", width:80},
      { name: "Age" , type: "number", title:"Age", width:100},
      { name: "Count", width: "30%", align: "center" , itemTemplate: function (_, item) {
                            var btn = $("<button type='button'>").text("Alert").click(function (e) {
                                $("#jsGrid").jsGrid("cancelEdit");
                                alert("Clicked!");
                                e.stopPropagation();
                            });
                            return $("<div>").append(item.Count).append("&nbsp;&nbsp;&nbsp;").append(btn); 
        //위와같이 코드를 마음껏 붙여 넣을 수 있다, You can paste the code as above.
                        }
      },
      { type: "control" ,width: "30%", editButton: false, modeSwitchButton: false , title: "Preview" 
                    , headerTemplate: function () { return $("<div>").text(this.title); } //Header에 Text넣기, Put Text in Header
                    , itemTemplate: function (value, item) {
                            if(item.Count != null)
                            {
                                if(item.Count > 0)
                                  {
                                    const btnCustom = $("<button type='button'>").text("Custom")
                                    .on("click", function (e) {
                                        $("#jsGrid").jsGrid("cancelEdit");
                                        alert("Custom!");
                                        e.stopPropagation();
                                    });
                                    var $result = $([]);
                                    $result = $result.add(btnCustom).add(this._createDeleteButton(item)); 
                                    //기본 버튼도 불러올 수 있다,Default buttons can also be called up
                                    return $result;
                                  }
                            }
                        }
      },
      { type: "control",width: "10%" } //기본, 이 행을 삭제하거나 머릿말에 + 버튼을 삭제하면 Add Row가 보여짐,If you delete this row or delete the + button in the header, you will see Add Row.

    ],
    data: db.users
  });
  //Insert Row 숨김(2중 헤더를 사용하면 Insert Row 보여지게 되므로 소스처리함)
  //, Hide Inert Row(If you use the double header, the Insert Row will be displayed.
  $('.jsgrid-insert-row').css({ display: 'none' });
});

function AddClick() {
  if ($('.jsgrid-insert-row').css('display') == "none") {
    //Add 버튼 보이기, Show Add Button
    $('.jsgrid-insert-row').css({ display: 'table-row' });
    $('#btnAdd').text('Close');
    return false;
  }
  
  if ($('.jsgrid-insert-row').css('display') == "table-row") {
    //Add 버튼 숨기기, Hide Add Button 
    $('.jsgrid-insert-row').css({ display: 'none' });
    $('#btnAdd').text('Add User');
    return false;
  }
}
//자동 완성에 쓰일 데이터 목록, List of data for autocompletion
var programs = ["Chrome", "IE", "FireFox", "Opera", "Whale", "Edge", "ETC"];

//실제 그리드에 채워질 데이터들, Data to be filled in the actual grid
var db = {};
db.users = [
  {
    "Name": "김가나",
    "ProgramName": "Chrome",
    "Check": true,
    "Age": 20,
    "Count" : 0
  },
  {
    "Name": "이다라",
    "ProgramName": "FireFox",
    "Check": false,
    "Age": 26,
    "Count" : 2
  },
  {
    "Name": "박마바",
    "ProgramName": "Opera",
    "Check": true,
    "Age": 30,
    "Count" : 5
  },
  {
    "Name": "최사아",
    "ProgramName": "Edge",
    "Check": false,
    "Age": 5,
    "Count" : 1
  }];  