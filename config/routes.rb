Rails.application.routes.draw do
  root 'landing_pages#index'
  resources :prices, only: [:index, :create]
end
