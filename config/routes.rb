Rails.application.routes.draw do
  devise_for :users
  # get 'home/top'
  # root to: "home#top"
  root to: "home#index"
  resources :users
  resources :posts
  resources :tags, only: %i[index show]
end
