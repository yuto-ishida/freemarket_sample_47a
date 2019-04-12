class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new,:create]
  before_action :set_category, only: [:index, :show]
  def index
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

  def show

  end

  private
  def item_params
    params.require(:item).permit(:status_id ,{:item_image_ids => []},:category_ids, :item_size_ids, :brand_ids ,:name,:description,:condition_id,:shipping_burden_id, :shipping_style_id ,:prefecture_id,:date_of_shipment_id ,:price).merge(user_id: current_user.id)
  end

  def item_image_params
    image_ids = params.require(:item).permit(:item_image_ids => [])
    item_image_ids = image_ids[:item_image_ids]
    return item_image_ids
  end

  def set_category
    @category = Category.all
  end

end
