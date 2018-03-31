Rails.application.routes.draw do
  # omniauth callback
  get '/auth/:provider/callback', to: 'sessions#create'

  resources :sessions, only: :create
  
  resources :twitter_accounts do
    resources :tweets, shallow: true, only: :index
  end

  resources :tweets do
    resources :replies, only: [:new, :create]
  end

  root "tweets#index"
end
