Rails.application.routes.draw do
  namespace :v1 do
    resources :categories
    resources :products
    resources :shops
    resources :users
    post 'auth/signup', to: 'users#create'
  end
end
