$(document).ready(function () {

  var $troubles = $('.recent-trouble');

  $('#timeliness-filter').on('change', function () {
    var currentTimeliness = this.value;
    if (currentTimeliness === "all") {
      $troubles.each(function (index, trouble){
        $trouble = $(trouble);
        $trouble.show();
      });
    } else {
      $troubles.each(function (index, trouble) {
        $trouble = $(trouble);
        if ($trouble.data('timeliness') === currentTimeliness) {
          $trouble.show();
        } else {
          $trouble.hide();
        }
      });
    }
  });
});