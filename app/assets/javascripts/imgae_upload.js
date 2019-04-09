$(function() {

  function buildSendImageHTML(image){
    var html = `
                <img class="item_new__image--views-img" src=${image.image} alt="Is">
                `
    return html;
  };

  function buildSendTagHTML(image){
    var html = `
              <input name='item[item_image_ids][]' type='hidden' value='${image.id}'>
                `
    return html;
  };


  $('.image_form').on('submit', function(e) {
    e.preventDefault();

    var formdata = new FormData(this);
     var url = $(this).attr('action')
    $.ajax({
      type: 'POST',
      url: url,
      data: formdata,
      dataType: 'json',
      contentType: false,
      processData: false,
      disabled: false
    })
    .done(function(image){
      var html = buildSendImageHTML(image);
      $(".item_new__image--views").append(html);
      var html_tag = buildSendTagHTML(image);
      $(".item_new__send").append(html_tag);
      $(".form__submit").removeAttr("disabled");
    })
    .fail(function(error){
      alert('error')
    });
  });

})
