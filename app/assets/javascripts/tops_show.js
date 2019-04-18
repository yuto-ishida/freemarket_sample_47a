$(function(){
  $(".tops_show__main--details").on("mouseover",function(){
    var url = $(this).attr("src")
    $(".tops_show__main--left").attr("src",url)
  })
});
