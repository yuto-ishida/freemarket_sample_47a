class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]
  def index
    @category_women = Category.find(1)
    @items_category_women = @category_women.items.order("created_at DESC").limit(4)

    @category_men = Category.find(2)
    @items_category_men = @category_men.items.order("created_at DESC").limit(4)

    @category_baby = Category.find(3)
    @items_category_baby = @category_baby.items.order("created_at DESC").limit(4)

    @category_cosmetic = Category.find(7)
    @items_category_cosmetic = @category_cosmetic.items.order("created_at DESC").limit(4)

    @brand_chanel = Brand.find(29)
    @items_brand_chanel = @brand_chanel.items.order("created_at DESC").limit(4)

    @brand_louis_vuitton = Brand.find(30)
    @items_brand_louis_vuitton = @brand_louis_vuitton.items.order("created_at DESC").limit(4)

    @brand_supreme = Brand.find(31)
    @items_brand_supreme = @brand_supreme.items.order("created_at DESC").limit(4)

    @brand_nike = Brand.find(32)
    @items_brand_nike = @brand_nike.items.order("created_at DESC").limit(4)
  end

  def new
    @item = Item.new
    @ItemImage = ItemImage.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      ItemImage.where(id: item_image_params ).destroy_all
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:status_id ,{:item_image_ids => []},:category_ids, :item_size_ids, :brand_ids ,:name,:description,:condition_id,:shipping_burden_id, :shipping_style_id ,:prefecture_id,:date_of_shipment_id ,:price).merge(user_id: current_user.id,)
  end
  def item_image_params
    image_ids = params.require(:item).permit(:item_image_ids => [])
    item_image_ids = image_ids[:item_image_ids]
    return item_image_ids
  end
end
