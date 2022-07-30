Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # 会員側のルーティング設定
  namespace :public do
    resources :homes
    resources :items
    resources :registrations
    resources :sessions
    resources :customers
    resources :cart_items
    resources :orders
    resources :adresses
  end
  # 管理者側のルーティング設定
  namespace :admin do
    resources :items
    resources :genres
    resources :customers
    resources :homes
    resources :orders
    resources :order_details
    resources :sessions
  end


end
