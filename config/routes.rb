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
  root to: 'public/homes#top'
  get 'public/homes/about' => 'public/homes#about', as:'about'

  namespace :public do
    resources :items, only: [:index, :show]
    # resources :registrations, only: [:create, :new]
    # resources :sessions, only: [:new, :create, :destroy]
    resource :customer, only: [:show, :edit, :update, :check, :withdrawl]
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    resources :orders, only: [:new, :confirm, :complete, :create, :index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end
  # 管理者側のルーティング設定
  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :homes, only: [:top]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    # resources :sessions, only: [:new, :create, :destroy]
  end


end
