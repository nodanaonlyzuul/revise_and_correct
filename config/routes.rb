Rails.application.routes.draw do
  resources :twitter_accounts do
    resources :tweets, shallow: true, only: :index
  end

  resources :tweets do
    resources :replies, only: [:new, :create]
  end

  root "tweets#index"
end
