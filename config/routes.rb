Rails.application.routes.draw do
  namespace :v1 do
    resources :categories
    resources :products
  end
end
