Rails.application.routes.draw do

  resources :orders
  resources :line_items
  resources :carts
  resources :settings
  resources :categories
  get 'pages/index'
  get 'pages/about'
  get 'pages/contact'
  root 'pages#index'

  resources :products do
    get :who_bought, on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
