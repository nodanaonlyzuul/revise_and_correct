Rails.application.routes.draw do
  # omniauth callback
  get '/auth/twitter/callback', to: 'sessions#create'
  get '/auth/twitter', to: "sessions#new"

  resource :login, only: :new
  resources :sessions, only: [:create, :destroy]

  resources :twitter_accounts do
    resources :tweets, shallow: true, only: :index
  end

  resources :tweets do
    resources :replies, only: [:new, :create]
  end

  root "tweets#index"
end
