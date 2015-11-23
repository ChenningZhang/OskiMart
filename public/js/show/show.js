$(document).ready(function(){
  $('.show-comments').click(function(){
    if($(this).hasClass('show-comments')) {
      $(this).removeClass('show-comments');
      $(this).addClass('hide-comments');
      $(this).text('Hide Comments');
      $('.comments-container').fadeIn(800);
    } else {
        $(this).removeClass('hide-comments');
        $(this).addClass('show-comments');
        $(this).text('Show Comments');
        $('.comments-container').fadeOut(800);

    }
  });

  

})