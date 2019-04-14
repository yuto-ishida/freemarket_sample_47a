require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
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

