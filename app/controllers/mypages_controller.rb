class MypagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only:  [:show,:edit]
  def show
  end

  def edit
  end

  private
  def set_category
    @category = Category.all
  end

end
