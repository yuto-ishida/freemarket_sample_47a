$(function(){
  $(document).on("keyup",".item_new__price--price-input",function(){
    var input_price = $(".item_new__price--price-input").val();
    if (input_price <= 9999999 && input_price >= 300){
      var sales_commission = (input_price * 0.1)
      var sales_commission_value = Math.round(sales_commission)
      $(".item_new__price--price-sales-commission-value").text(sales_commission_value)
      var price_profit = input_price * 0.9
      var price_profit_value = Math.round(price_profit)
      $(".item_new__price--price-profit-value").text(price_profit_value)
    }else{
      $(".item_new__price--price-sales-commission-value").text("ー")
      $(".item_new__price--price-profit-value").text("ー")
    }
  });
});


