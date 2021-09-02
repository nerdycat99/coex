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
      expect(response).to redirect_to root_path
    end

    it 'creates new price objects for data returned from the api' do
      count_before = Price.all.count
      post :create, params: { "id"=> 1 }
      allow_any_instance_of(CurrencyServices::RetrieveCurrency).to receive(:call)
      expect(Price.all.count).to eq (count_before + 2)
    end
  end

end