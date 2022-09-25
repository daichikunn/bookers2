Rails.application.routes.draw do
  get 'new/index'
  get 'new/show'
  root to: "homes#top"
  get 'homes/top'
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
