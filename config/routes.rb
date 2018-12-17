Rails.application.routes.draw do
  namespace :v1 do
    resources :categories
    resources :products
    resources :shops
    resources :users
  end
  post 'authenticate', to: 'authentication#authenticate'
end
