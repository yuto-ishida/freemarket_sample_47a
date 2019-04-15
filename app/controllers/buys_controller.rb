class BuysController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def pay
    Payjp.api_key = "#{ENV['PAYJP_PRIVATE_KEY']}"
    tano = current_user.credit_cards.last.customer_id
    Payjp::Charge.create(
    amount: 1200000,
    currency: 'jpy',
    customer: tano
  )
    redirect_to  buys_path
  end
end
