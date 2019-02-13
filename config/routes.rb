Rails.application.routes.draw do

  get 'home/index'
  get 'home/secret'
  devise_for :users

  root 'events#index'
  resources :events do resources :attendances end
  resources :users, only: [:new, :show, :edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
