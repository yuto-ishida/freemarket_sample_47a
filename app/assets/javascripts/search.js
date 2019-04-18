$(window).on('load',function(){

// フォームクリア
  $(document).on("click",".search__form-clear",function(){
    $('#item_search')[0].reset();
    $(".search__search_bar--category-child").css("display","none");
    $(".search__search_bar--category-grandchild").css("display","none");
    $(".search__search_bar--detailed_search-input-item_size-box").css("display","none");
  });

// チェックボックス全体ONOFF
  $(document).on("click",'input[name="q[condition_id]"]',function(){
    if($("#search__check-box-all-condition").prop('checked')) {
      $('input[name="q[condition_id_eq_any]"]').prop("checked",true);
    }else {
      $('input[name="q[condition_id_eq_any]"]').prop("checked",false);
    }
  });

  $(document).on("click",'input[name="q[shipping_burden_id]"]',function(){
    if($("#search__check-box-all-shipping_burden").prop('checked')) {
      $('input[name="q[shipping_burden_id_in_any]"]').prop("checked",true);
     }else {
      $('input[name="q[shipping_burden_id_in_any]"]').prop("checked",false);
     }
  });

  $(document).on("click",'input[name="q[status_id]"]',function(){
    if($("#search__check-box-all-status").prop('checked')) {
      $('input[name="q[status_id_in_any]"]').prop("checked",true);
    }else {
      $('input[name="q[status_id_in_any]"]').prop("checked",false);
    }
  });


  // 価格の上下検索
  $(document).on("change",".search__search_bar--detailed_search-input-price",function(){
    var value = $('#search__price-input option:selected').text();
    var value_num = value.split(" ~ ")
    if (value_num.length == 2){
      $("#search__price-input-low").val(value_num[0])
      $("#search__price-input-high").val(value_num[1])
    }else{
      $("#search__price-input-low").val("")
      $("#search__price-input-high").val("")
    }
  });

// カテゴリの選択
  var parent_value = ""
  $(document).on("change","#search__category-parent",function(){
    $(".search__search_bar--category-child").css("display","none");
    $(".search__search_bar--category-grandchild").css("display","none");
      parent_value = $('#search__category-parent option:selected').val();
    $(".search__search_bar--category-"+parent_value).css("display","unset")
    $('input[name="q[categories_id_in_any][]"]').prop("checked",false);
    $(".search__search_bar--detailed_search-input-box-child").val("");
  });
  $(document).on("change",".search__search_bar--detailed_search-input-box-child",function(){
    $(".search__search_bar--category-grandchild").css("display","none");
    var this_id = $(this).attr("id");
    var category_id = '#search__category-child-' + parent_value
    var child_num = $(category_id).val();
    $(".search__search_bar--category-" + child_num).css("display","unset");
    $('input[name="q[categories_id_in_any][]"]').prop("checked",false);
  });

// アイテムサイズの選択
  $(document).on("change","#search__item_size",function(){
    var item_size_parent_id = $(this).val();
    $(".search__search_bar--detailed_search-input-item_size-box").css("display","none");
    $(".search__item_sizes_"+item_size_parent_id).css("display","unset");
    $('input[name="q[item_sizes_id_in_any][]"]').prop("checked",false);
  });

  // ブランド名のインクリメンタルサーチ
  function buildHTML(keyword){
    console.log
    var html = `
                <div class= "search__search_bar--detailed_search-input-suggest-text">${keyword.name}</div>
                `
    return html;
  };
  $('.search__brand-input').on('keyup', function(e) {
    e.preventDefault();
    var keyword = $(this).val();
    $(".search__search_bar--detailed_search-input-suggest").empty();
    var formdata = new FormData(this);
    $.ajax({
      type: 'GET',
      url: "/search_keywords",
      data: {keyword: keyword},
      dataType: 'json'
    })
    .done(function(keywords){
      keywords.forEach(function(keywords){
      var html = buildHTML(keywords);
      $(".search__search_bar--detailed_search-input-suggest").append(html);
      });
    })
    .fail(function(error){
      alert('error')
    });
  });
  $(document).on("click",".search__search_bar--detailed_search-input-suggest-text",function(){
    var keyword = $(this).text();
     $(".search__brand-input").val(keyword);
  });
  $(".search__brand-input").focusin(function(e) {
    $(".search__search_bar--detailed_search-input-suggest").css("display","unset")
  });
  $(".search__brand-input").focusout(function(e) {
    setTimeout(function(){
       $(".search__search_bar--detailed_search-input-suggest").css("display","none")
    },200);
  });


// 検索
  function buildSendItemHTML(item){

    var html = `
      <div class="search__result--box">
        <div class="search__image">
          <img class="test_image" src="${item.url}">
        </div>
        <div class="search__body">
          <div class="search__name">
            ${item.name}
            <div class="search__name_linear"></div>
          </div>
          <div class="search__price_and_like">
            <div class="search__prices">
              <div class="search__price">
              ¥ ${(item.price).toLocaleString()}
              </div>
              <div class="search__tax">
                (税込)
              </div>
            </div>
            <div class="search__like">
              <div class="far fa-heart search__good_icon"></div>
              <div class="search__like_num">
                12
              </div>
            </div>
          </div>
        </div>
      </div>
    `
    return html;
  }

  $('#item_search').on('submit', function(e){
    e.preventDefault();

    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(items){
      $(".search__result--title").text("検索結果 1-" + items.length + "件");
      $('.search__result--boxs').empty();
      items.forEach(function(item) {
        var html = buildSendItemHTML(item);
        $('.search__result--boxs').append(html);
      });
    })
    .fail(function(){
      alert('error');
    })
    .always(() => {
      $(".search__submit").removeAttr("disabled");
    });
  })


// ソート
  $(document).on("change","#search__sort",function(e){
    e.preventDefault();
    var for_sort_target = $("#item_search");
    var for_sort_formData = new FormData(for_sort_target.get(0));
    for (value of for_sort_formData.entries()) {
    console.log(value);}
    $.ajax({
      url: "/searches",
      type: "POST",
      data: for_sort_formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(items){
      $(".search__result--title").text("検索結果 1-" + items.length + "件");
      $('.search__result--boxs').empty();
      items.forEach(function(item) {
        var html = buildSendItemHTML(item);
        $('.search__result--boxs').append(html);
      });
    })
    .fail(function(){
      alert('error');
    })
    .always(() => {
    });
  });
});
