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
      }
  });
}

function likeMessage(messageId) {
  $.ajax({
    type: 'POST',
    url: '/messages/like/' + messageId,
    error: function() {
       alert("error");
    },
    success: function(data) {
      updateLikes(messageId, 1);
      $("#" + messageId + " .like-btn").hide();
      $("#" + messageId + " .unlike-btn").show();
    }
  });
}

function unlikeMessage(messageId) {
  $.ajax({
    type: 'POST',
    url: '/messages/unlike/' + messageId,
    error: function() {
       alert("error");
    },
    success: function(data) {
      updateLikes(messageId, -1);
      $("#" + messageId + " .unlike-btn").hide();
      $("#" + messageId + " .like-btn").show();
    }
  });
}

function updateLikes(messageId, number) {
  var currentLikes = parseInt($("#" + messageId + " .number-of-likes").text());
  currentLikes += number;
  $("#" + messageId + " .number-of-likes").text(currentLikes)
}