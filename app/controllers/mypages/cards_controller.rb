class Mypages::CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only:  [:index,:new]
  def index
  end

  def new
  end
  private
  def set_category
    @category = Category.all
  end
end
