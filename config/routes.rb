Rails.application.routes.draw do



  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  #管理者ログイン用
  devise_for :admin, skip: [:registrations, :passwords],controllers: {
    sessions: "admin/sessions"
  }

  root 'public/homes#top'

  namespace :public do
    get "search" => "searches#search"
    get 'relationships/followings'
    get 'relationships/followers'
    resources :photos, only: [:new, :create, :index,:show, :edit, :update,:destroy,] do
      resource :favorites, only: [:create,:destroy]
      resources :comments, only: [:create,:destroy]
    end
    resources :users, only: [:new, :index, :show, :edit, :update] do
      member do
        get :favorites
      end
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
  end

  namespace :admin do
    root to: 'homes#top'
    resources :photos, only: [:index,:show, :edit, :update,:destroy,] do
      resources :comments, only: [:destroy]
    end
    resources :users, only: [:index,:show,:edit,:update]
  end

  devise_scope :user do
    get '/customers/sign_out' => 'devise/sessions#destroy'
  end

  devise_scope :admin do
    get '/admin/sign_out' => 'devise/sessions#destroy'
  end

end
