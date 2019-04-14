require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
  describe 'GET #index' do
    it "renders the :index template" do
      get :index,params:{keyword: "トップス"}
      expect(response).to render_template :index
    end
  end

  describe 'GET #index' do
    it "renders the :index template" do
      get :index,params:{keyword: ""}
      expect(response).to render_template :index
    end
  end
end
