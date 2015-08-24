function submitMessage(text) {
  if (text.trim().length == 0) {
    return;
  }
  $("#new-message").val('');
  $.ajax({
      type: 'POST',
      url: '/messages',
      data: {
         text: text
      },
      error: function() {
         alert("error");
      },
      success: function(data) {
        $("#chat").replaceWith($(data).filter("#chat"));
      }
  });
}