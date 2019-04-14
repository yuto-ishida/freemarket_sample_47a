require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:user) { create(:user) }
  let(:condition) { create(:condition) }
  let(:shipping_burden) { create(:shipping_burden)}
  let(:shipping_style) { create(:shipping_style)}
  let(:date_of_shipment) { create(:date_of_shipment)}
  let(:status) { create(:status)}
  let(:category_ids) { create(:category_ids)}
  let(:item_image_ids) { create(:item_image_ids)}
  let(:item_size_ids) { create(:item_size_ids)}
  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end


  describe 'GET #show' do
    it "renders the :show template" do
      get :show, params:{id: 1}
      expect(response).to render_template :show
    end
  end
end

