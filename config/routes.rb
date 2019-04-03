Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "buys#index"
  resources :tops, only: :new
  resources :brands, only: :index
  resources :categories, only: :index
  get 'mypages/logout' => 'mypages#logout'
  resources :mypages, only: [:new, :create, :edit, :update, :show ,:destroy]

  namespace :mypages do
    resources :identifications, only: [:new, :create]
  end

end
