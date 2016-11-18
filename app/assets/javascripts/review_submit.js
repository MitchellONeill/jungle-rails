
var ready = function(e) {
  $('#review-form').change(function(e) {
    e.preventDefault();
    if($('#review-description').val().length > 7 && $('#review_rating').val() !== '-') {
      $('#review-button').prop('disabled', false);
    };
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);
