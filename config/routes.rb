Rails.application.routes.draw do

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }
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
