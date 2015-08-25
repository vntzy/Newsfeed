// $(".chat.dashboard").ready(function (){
//   window.setInterval(function() {
//     $.ajax({
//         type: 'GET',
//         url: '/',
//         error: function() {
//            alert("error");
//         },
//         success: function(data) {
//           $("#chat").replaceWith($(data).filter("#chat"));
//           // $("#chat")[0].scrollTop = $("#chat")[0].scrollHeight
//         }
//     });
//   }, 1000);
// });