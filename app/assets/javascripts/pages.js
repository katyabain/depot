// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
  $('#faq h3').each(function() {
    var tis;
    answerAll = $('#faq').children('div').hide().css('height','auto');
    $(this).click(function() {
      answerAll.hide();
      $('#faq').children('h3').removeClass('active');
      $(this).next('div').toggle();
      $(this).addClass('active');
    });
  });
});
