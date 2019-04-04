Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "tops#index"
  resources :tops, only: :new
  resources :brands, only: :index
  resources :categories, only: :index
  namespace :mypages do
    resources :identifications, only: [:new, :create]
    resources :logins, only: :index
    resources :logouts, only: :index
  end
  resources :mypages, only: [:new, :create, :edit, :update, :show ,:destroy]
  resources :signup, only: [:index]
  namespace :signup do
    resources :registrations, only: [:new, :create]
    resources :sms_confirmations, only: :index
    namespace :sms_confirmations do
      resources :sms, only: :index
    end
    resources :addresses, only: [:new, :create]
    resources :credit_cards, only: [:new, :create]
  end

end
