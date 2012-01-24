// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
  $('#faq h3').each(function() {
    var tis = $(this),
    state = false,
    answerNext = tis.next('div').hide().css('height','auto').slideUp();
    answerAll = $('#faq').children('div').hide().css('height','auto').slideUp();
    tis.click(function() {
      state = !state;
      answerAll.slideUp(state);
      $('#faqs').children('h3').removeClass('active');
      answerNext.slideToggle(state);
      tis.addClass('active',state);
    });
  });
});
