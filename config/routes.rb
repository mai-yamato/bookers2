Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:new, :create, :index, :show, :destroy]

  get "top" => "homes#top"

  get "books" => "books#index"


end
