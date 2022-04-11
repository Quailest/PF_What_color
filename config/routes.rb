Rails.application.routes.draw do

  #ユーザーログイン用
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #管理者ログイン用
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  root 'homes#top'

  namespace :public do
    resources :photos, only: [:new, :create, :index,:show, :edit, :update,:destroy,]
    resources :users, only: [:new, :show, :edit, :update]
  end
end
