$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  // =========vote form submission================
$('button').click(function(){
    event.preventDefault()
    $(this).css('color', '#00C8C8')
    var clicked_here = $(this)
    var $form = $(this).parent()
    var url = $form.attr("action")
    var method = $form.attr("method")
    var data = $(this).attr("value")
// ok im not moving any data
    var request = $.ajax({
      url: url,
      method: method,
      data: data,
    });

    request.done(function(response) {
      clicked_here.parent().children('p').text(response)
    })
  });



// =================================================
  $('form').submit(function(event) {
    event.preventDefault();

    var form = $(this)
    var url = form.attr("action")
    var method = form.attr("method")
    var data = form.serialize()

    var request = $.ajax({url: url, method: method, data: data});

    request.done(function(comment) {

      $('.question-comments').append(`<li> ${comment.description} <span class="question_stats">– ${comment.username} ${comment.created_at} at ${comment.created_at})</span></li>`);
      $(form).find('.comment_textbox').val('');
    });
  });
});
