Rails.application.routes.draw do
  resources :twitter_accounts
  root "twitter_accounts#index"
end
