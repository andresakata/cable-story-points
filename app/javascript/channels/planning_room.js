import consumer from "./consumer"

require('jquery');

consumer.subscriptions.create(
  {
    channel: "PlanningRoomChannel",
    room: room
  },
  {
    received(data) {
      let user = data.user;
      let points = data.points
      let ready = points ? 'yes' : 'no'
      let row = $('tr#' + user);

      if (row.length) updateAttrs(row, ready, points);
      else addRow(user, ready, points);

      showPointsIfAllReady()
    }
  }
);

function updateAttrs(row, ready, points) {
  row.attr('data-ready', ready);
  row.attr('data-points', points);
  row.find('.points').html(ready)
}

function addRow(user, ready, points) {
  $('tbody').append(
    "<tr id='" + user + "' data-ready='" + ready + "' data-points='" + points + "'>" +
    "<td>" + user + "</td>" +
    "<td class='points'>" + ready + "</td>" +
    "</tr>"
  );
}

function showPointsIfAllReady() {
  if ($('tbody tr[data-ready="no"]').length > 0) return;

  $('tbody tr').each(function(index, element) {
    element = $(element);
    element.attr('data-ready', 'no');
    element.find('.points').html(element.attr('data-points'));
  });
}