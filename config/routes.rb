Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "tops#index"
  resources :tops, only: :new
  resources :brands, only: :index
  resources :categories, only: :index
  resources :mypages, only: [:new, :create, :update, :show ,:destroy]


end
