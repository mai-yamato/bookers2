Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:update, :create, :index, :show, :destroy, :edit]
  resources :users, only: [:show, :edit, :update, :index]

  get "about" => "homes#about"



  delete 'books/:id' => 'books#destroy'


end
