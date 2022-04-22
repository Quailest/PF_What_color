Rails.application.routes.draw do

  namespace :public do
    get 'relationships/followings'
    get 'relationships/followers'
  end
  #ユーザーログイン用
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  #管理者ログイン用
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  root 'public/photos#index'


  namespace :public do
    get "search" => "searches#search"
    resources :photos, only: [:new, :create, :index,:show, :edit, :update,:destroy,] do
      resource :favorites, only: [:create,:destroy]
      resources :comments, only: [:create,:destroy]
    end
    resources :users, only: [:new, :show, :edit, :update] do
      member do
        get :favorites
      end
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
  end
end
