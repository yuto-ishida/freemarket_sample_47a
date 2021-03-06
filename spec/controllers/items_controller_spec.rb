require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    before do
      login_user user
    end
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before do
      login_user user
    end
    it "renders the :edit template" do
      get :edit,params:{id: 1}
      expect(response).to render_template :edit
    end
  end

  describe 'GET #show' do
    it "renders the :show template" do
      get :show, params:{id: 1}
      expect(response).to render_template :show
    end
  end


  describe 'DELETE #destroy' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end

