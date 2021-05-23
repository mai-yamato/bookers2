Rails.application.routes.draw do
  devise_for :users, :books
  root to: 'homes#top'
  resources :books, only: [:update, :create, :index, :show, :destroy, :edit, :new]
  resources :users, only: [:show, :edit, :update, :index, :new]

  get "about" => "homes#about"



  delete 'books/:id' => 'books#destroy'


end
