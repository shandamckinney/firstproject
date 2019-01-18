$(document).on('turbolinks:load', function() {

App.product = App.cable.subscriptions.create("ProductChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function()
  $(".alert.alert-info").show();
  $('.product-reviews').prepend(data.comment);
  $("#average-rating").attr('data-score', data.average_rating);
  refreshRating();
},
    // Called when there's incoming data on the websocket for this channel
  }
}
});
