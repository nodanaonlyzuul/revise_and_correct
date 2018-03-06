Rails.application.routes.draw do
  resources :twitter_accounts
  root "tweets#index"
end
