$(window).on('load',function(){
  if(document.URL.match("edit")) {
    //指定する文字列がURLに含まれる場合に実行する内容

    function builduploadimageHTML(image_box_no){
      var html = `
                  <input id="image_up" type="file" name="item[item_images_attributes][${image_box_no}][image]" class= "input_image_${image_box_no+1} item_image_new">
                  `
      return html;
    };
    function buildimagedestroyHTML(image_box_no,image_no){
      var html = `
                 <input value="${image_box_no}" type="hidden" name="item[item_images_attributes][${image_no}][_destroy]" id="item_item_images_attributes_0__destroy">
                  `
      return html;
    };

    var image_no = 0;
    $('form').on('change', 'input[type="file"],.item_image_new', function(e) {
     image_no += 10;
      var file = e.target.files[0],
          reader = new FileReader(),
          $preview = $(".item_new__image--views");
          t = this;
      if(file.type.indexOf("image") < 0){
        return false;
      }
      reader.onload = (function(file) {
        return function(e) {
          $preview.append($('<img>').attr({
                    src: e.target.result,
                    height: "100px",
                    width: "100px",
                    class: "preview",
                    title: file.name,
                    id: "preview_"+image_no,
                    value: image_no
                }));
        };
      })(file);
      reader.readAsDataURL(file);
      $(this).addClass("item_new__image--views-box-input")
    });
    var new_image_box_no = 100
    $(document).on("click",'.item_new__image--input',function(){
        var add_html = builduploadimageHTML(new_image_box_no)
        $(".item_new__image--description").prepend(add_html);
        new_image_box_no += 1
    });
    var image_num = 0
    $(document).on("click",'.preview',function(){
       var image_box_no = $(this).attr("value");
      $('.item_new__image--views-box'+image_box_no).empty();
      var image_destroy_html = buildimagedestroyHTML(image_box_no,image_num)
      $('.item_new__image--views-box'+image_box_no).append(image_destroy_html);
      image_num += 1
    });


    var price_value = $('.item_new__price--price-input').attr("value");
      var sales_commission = (price_value * 0.1)
      var sales_commission_value = Math.round(sales_commission)
    $(".item_new__price--price-sales-commission-value").text(sales_commission_value)

      $(".item_new__price--price-sales-commission-value").text(sales_commission_value)
      var price_profit = (price_value * 0.9)
      var price_profit_value = Math.round(price_profit)
      $(".item_new__price--price-profit-value").text(price_profit_value)

    var input_price = $(".item_new__price--price-input").val();
      if (input_price == "" ) {
        $(".item_new__price--price-sales-commission-value").text("ー")
        $(".item_new__price--price-profit-value").text("ー")
      }


    $(document).on("keyup",".item_new__price--price-input",function(){
      var input_price = $(".item_new__price--price-input").val();
      if (input_price <= 9999999 && input_price >= 300){
        var sales_commission = (input_price * 0.1)
        var sales_commission_value = Math.round(sales_commission)
        $(".item_new__price--price-sales-commission-value").text(sales_commission_value.toLocaleString())
        var price_profit = input_price * 0.9
        var price_profit_value = Math.round(price_profit);
        $(".item_new__price--price-profit-value").text(price_profit_value.toLocaleString());
      }else{
        $(".item_new__price--price-sales-commission-value").text("ー")
        $(".item_new__price--price-profit-value").text("ー")
      }
    });



  };
});

