Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:new, :create, :index, :show, :destroy]
  resources :users

  get "about" => "top#about" ,as:"about"


end
