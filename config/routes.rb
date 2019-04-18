Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :omniauth_callbacks =>  "users/omniauth_callbacks"
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "items#index"
  resources :items, only: [:new, :create, :edit, :update, :destroy, :show] do
    collection do
      get ':id/buy' => 'items#buy'
    end
    collection do
      post ':id/pay' => 'items#pay'
    end
  end
  resources :brands, only: :index
  resources :categories, only: [:index ,:show]
  namespace :mypages do
    resources :identifications, only: [:new, :create]
    resources :logins, only: :index
    resources :logouts, only: :index
    resources :cards, only: [:index,:new,:create]

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
  resources :mypages, only: [:new, :create, :edit, :update, :show ,:destroy,:card]
  resources :buys, only: :index
  resources :item_images, only: [:create, :destroy]
  resources :searches, only: [:index ,:create]
  resources :search_keywords, only: :index
end
