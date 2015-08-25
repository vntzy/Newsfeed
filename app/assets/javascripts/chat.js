function getOldMessages() {
  var start = $("#chat").children().length - 1;
  $.ajax({
    type: 'GET',
    url: '/messages/get_old_messages',
    data: {
      "start": start
    },
    error: function() {
       alert("error");
    },
    success: function(data) {
      if (data.length == 0) {
        $("#see-more").hide();
      } else {
        $(data).insertAfter("#see-more")
      }
    }
  });
}