class Mypages::CardsController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def new
  end
end
