Rails.application.routes.draw do
  devise_for :users
  # get 'home/top'
  # root to: "home#top"
  root to: "home#index"
  resources :users
  resources :posts do
    resources :comments, only: [:create]  #commentsコントローラへのルーティング
  end
  resources :tags, only: %i[index show]
end
