class Mypages::LogoutsController < ApplicationController
  before_action :authenticate_user!
    before_action :set_category, only:  :index


  def index

  end
  private
  def set_category
    @category = Category.all
  end
end
