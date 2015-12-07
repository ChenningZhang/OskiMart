$(document).ready(function(){

  function getParameterByName(name) {
      name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
      var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
          results = regex.exec(location.search);
      return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
  }
  $(".favorite-button,.unfavorite-button").on("click", function(){

    var ID = $(this).parent().parent().parent().attr("data-id");
    var self = $(this);
    console.log(ID);
    $.ajax({
      method: "PUT",
      url: "/favorite",
      data:{"post_id": ID},
      dataType: "json"

    }).done(function(data){
      console.log(data);
      if (data['favorited']){
        self.text("Unfavorite");
      } else {
        if (getParameterByName('favorites')){
          location.reload();
        } else {
          self.text("Favorite");
        }
        
      }
    });
  })
})