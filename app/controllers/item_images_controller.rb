class ItemImagesController < ApplicationController
  before_action :authenticate_user!
  def create
    @itemimage = ItemImage.create(image_params)
      respond_to do |format|
        format.json
      end
  end
  private
  def image_params
    params.require(:item_image).permit(:image)
  end

end
