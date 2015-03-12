$(document).ready(function(){

  $('#signin').on("click", function(event) {
    event.preventDefault();

    var request = $.ajax({
      url: "/color",
      type: "POST",
      dataType: "json"
    });

    request.done(function(cellData){
      updateCell(cellData);
    });

  });

  var updateCell = function(options) {
    var cell = $("li:nth-child(" + options.cell + ")");
    cell.css("background", options.color);
  };





});