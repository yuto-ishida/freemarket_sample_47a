Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "tops#index"
  resources :tops, only: :new
  resources :brands, only: :index
  resources :categories, only: :index
  get 'mypages/logout' => 'mypages#logout'
  namespace :mypages do
    resources :identifications, only: [:new, :create]
    resources :cards, only: [:index,:new]
  end
  resources :mypages, only: [:new, :create, :edit, :update, :show ,:destroy,:card]

end
