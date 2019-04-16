class Mypages::CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only:  [:index,:new]
  def index
  end

  def new
  end

  def create
      Payjp.api_key = "#{ENV['PAYJP_PRIVATE_KEY']}"
      hensu = Payjp::Customer.create(
        description: 'test'
      )
      CreditCard.create(customer_id: hensu[:id],user_id: current_user.id,name: current_user.name)
      tano = current_user.credit_cards.last.customer_id
      token_name = params[:token_name]
      customer = Payjp::Customer.retrieve(tano)
      customer.cards.create(
        card: token_name
      )
      redirect_to  root_path
  end

  private
  def pay_params
    params.permit(:id)
  end

  private
  def set_category
    @category = Category.all
  end
end
