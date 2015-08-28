$(document).ready(function(){

  var months = ['January','February','March','April','May','June','July', 'August', 'September', 'October', 'November', 'December']
  var tomorrow = new Date();
    tomorrow.setTime(tomorrow.getTime() + (1000*3600*24));
  document.getElementById("time").innerHTML = tomorrow.getDate() + " " + months[tomorrow.getMonth()] + " " + tomorrow.getFullYear();

  $(".signin > button").click(function(event) {
    event.preventDefault();
    $.ajax({
      url: '/reveal',
      type: 'get'
    }).done(function(response) {
      if($(".pandapic").toggle().is(":visible")) {
        $(".pandapic").attr('src',response)
      };

      $(".send-the-pic").toggle()
    });
  });

  $(".send-the-pic > button").click(function(event) {
    event.preventDefault();
    console.log('sending the pic!');
    $.ajax({
      url: '/send',
      type: 'get',
      data: {picUrl: $(".pandapic").attr('src')}
    }).done(function(response) {
      alert('Sent! You can tweet the creator of this site the success at @ckennedyay or find code for this project at github.com/yaysunshine')
    });
  });
});