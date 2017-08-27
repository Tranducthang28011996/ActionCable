$( document ).ready(function() {
  var room_id = document.querySelector('#messages').dataset.room;
  App.room = App.cable.subscriptions.create({channel: 'RoomChannel', room: room_id},{
    received: function(data) {
      // var block_comment = "body #room-" + data['id'];
      var message = "<p>" + "<b>" + data['name'] + "</b>" + ":" + data['message'] + "</p>";
      $('#messages').append(message);
    },
  });
});
