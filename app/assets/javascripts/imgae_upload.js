$(window).on('load',function(){
  if(document.URL.match("new")) {

  function builduploadimageHTML(image_box_no){
    var html = `
                <input id="image_up" type="file" name="item[item_images_attributes][${image_box_no}][image]" class= "input_image_${image_box_no+1} ">
                `
    return html;
  };


  var image_no = 0;
  $('form').on('change', 'input[type="file"]', function(e) {
   image_no += 1;
    var file = e.target.files[0],
        reader = new FileReader(),
        $preview = $(".item_new__image--input");
        t = this;

    if(file.type.indexOf("image") < 0){
      return false;
    }
    reader.onload = (function(file) {
      return function(e) {
        $preview.append($('<img>').attr({
                  src: e.target.result,
                  width: "150px",
                  class: "preview",
                  title: file.name,
                  id: "preview_"+image_no,
                  value: image_no
        }));
      };
    })(file);
    reader.readAsDataURL(file);

    var html_tag = builduploadimageHTML(image_no);
    $(".item_new__image--description").append(html_tag);
    $('.input_image_'+ image_no).css('display','none')

  });

    $(document).on("click",'.preview',function(){
      var image_box_no = $(this).attr("value");
      $('.input_image_'+ image_box_no).remove();
      $(this).remove();
    });
  };
});


