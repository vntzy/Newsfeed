function blockUser(id) {
  $.ajax({
    type: 'POST',
    url: '/users/block/' + id,
    error: function() {
       alert("error");
    },
    success: function(data) {
      $("#block-btn").hide();
      $("#unblock-btn").show();
    }
  });
}

function unblockUser(id) {
  $.ajax({
    type: 'POST',
    url: '/users/unblock/' + id,
    error: function() {
       alert("error");
    },
    success: function(data) {
      $("#unblock-btn").hide();
      $("#block-btn").show();
    }
  });
}