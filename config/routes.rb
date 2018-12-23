Rails.application.routes.draw do
  namespace :v1 do
    resources :reviews
    resources :categories
    resources :products
    resources :shops
    resources :users
    get 'moderators', to: 'users#fetch_all_moderators'
    get 'normal-users', to: 'users#fetch_all_normal_users'
    put 'accounts/:id', to: 'accounts#update'
    get 'accounts/:id', to: 'accounts#show'
    get 'product-reviews/:id', to: 'products#fetch_product_reviews'
  end
  post 'authenticate', to: 'authentication#authenticate'
end
