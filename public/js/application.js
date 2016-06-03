$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  $('#thumbs-up').click(function(){
    $(this).css('color', 'red');
  });

  $('#thumbs-down').click(function(){
    $(this).css('color', 'red');
  });

  $('.comment-form').submit(function(event) {});

  // =========vote form submission================
  $('.voting-button').click(function(){
    event.preventDefault();

    $(this).css('color', '#00C8C8');
    var clicked = $(this);
    var url = clicked.closest('form').attr("action");
    var method = clicked.closest('form').attr("method");
    var data = {value: clicked.val()};

    var request = $.ajax({
      url: url,
      method: method,
      data: data,
    });

    request.done(function(response) {
      clicked.closest('form').find('p').text(response.points);
    });
  });

  $('.comment-form').submit(function(event) {
    event.preventDefault();

    var form = $(this);
    var url = form.attr("action");
    var method = form.attr("method");
    var data = form.serialize();

    var request = $.ajax({url: url, method: method, data: data});

    request.done(function(comment) {
      $('.question-comments').append(`<li> ${comment.description} <span class="question_stats">– ${comment.username} ${comment.created_at} at ${comment.created_at})</span></li>`);
      $(form).find('.comment_textbox').val('');
    });
  });

  $(".fa-star").click(function(){
    var form = $(this);
    var url = form.attr('action');
    var method = form.attr('method');
    var request = $.ajax({url: url, method: method});

    request.done(function(response) {
      $(form).css('color', 'green');
    });
  });

  $(".user-contributions-link").click(function(event) {
    event.preventDefault();
    $(".tabs > li").removeClass("active");
    $(this).parent().addClass("active");
    var url = $(this).attr('href');
    var request = $.ajax({url: url});

    request.done(function(listItems) {
      var jsonList = JSON.parse(listItems);
      var list = $('.contrib-list');
      list.append("<div class='tab-content'></div>");
      tabContent = "";
      for(var i = 0; i < jsonList.length; i++) {
          tabContent += "<li class='user-contributions-li'><p>" + jsonList[i].description + "</p></li>";
      }
      list.html(tabContent);
    });
  });
});


