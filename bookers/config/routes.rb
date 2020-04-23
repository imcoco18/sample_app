Rails.application.routes.draw do
  devise_for :users

    root 'books#topindex'
    get 'home/about' => 'books#aboutindex'
  resources :books
  resources :users, only: [:show, :edit, :update, :index, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
