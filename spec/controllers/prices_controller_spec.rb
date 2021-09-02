require 'rails_helper'

RSpec.describe PricesController, type: :controller do

  describe 'GET #index' do
    it 'successfully shows the page' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST#create' do
    it 'succeeds' do
      post :create, params: { "id"=> 1 }
      expect(response).to redirect_to "/prices/1"
    end
  end

end