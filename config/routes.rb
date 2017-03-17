Rails.application.routes.draw do

  resources :settings
    resources :categories
    get 'pages/index'
    get 'pages/about'
    get 'pages/contact'
    root 'pages#index'

    resources :products
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
