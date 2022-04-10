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

  root to: 'homes#top'

  namespace :public do
    resources :photos, only: [:new, :create, :index,:show, :edit, :destroy,]
  end
end
