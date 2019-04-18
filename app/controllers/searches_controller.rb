class SearchesController < ApplicationController
  before_action :set_category, only:  [:index]

  def index
    if params[:keyword].empty?
      @items = []
    else
      @items = Item.where('name LIKE(?)', "%#{params[:keyword]}%").limit(20)
    end
  end
  private

  def set_category
    @category = Category.all
  end
end
