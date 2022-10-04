Rails.application.routes.draw do
  devise_for :users

  root to: "homes#top"

  resources :homes
  get "home/about" => "homes#about"

  resources :books,only:[:new, :index, :show, :create, :destroy, :update, :edit]

  resources :users,only:[:show, :edit, :index, :update, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
