$("#jsGrid1").jsGrid({
  locale:"ko",
  width: "100%",
  inserting: true,
  editing: true,
  sorting: true,
  paging: true,
  autoload: true,
  deleteConfirm: "선택한 자산을 정말 삭제하시겠습니까?",
				
  fields: [
    { name: "roomName", type: "text", width: 150 },
    { name: "activateYn", type: "checkbox",title: "활성화", width: 50 },
    { name: "createDate", type: "date", width: 150 },
    { name: "modDate", type: "date", width: 150 },
    { type: "control" , width:"15%"}
  ],

  controller: {
      loadData: function(filter) {
        var d = $.Deferred();
        $.ajax({
            url: "/admin/resv",
            type: "GET",
            data: {
              name : "${rList.roomName}",
              activateYn : "${rList.activateYn}",
              createDate : "${rList.createDate}",
              modDate : "${rList.modDate}}"
            },
            dataType: "json"
        }).done(function(response) {
            //조회 데이터 셋팅
            d.resolve(response.rList);
        });
        return d.promise();
    },

    insertItem: function(item) {
      return $.ajax({
          type: "POST",
          url: "/items",
          data: item
      });
    },
    
    updateItem: function(item) {
        return $.ajax({
            type: "PUT",
            url: "/items",
            data: item
        });
    },
    
    deleteItem: function(item) {
        return $.ajax({
            type: "DELETE",
            url: "/items",
            data: item
        });
    }
  }

});
