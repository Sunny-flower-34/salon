Rails.application.routes.draw do
  devise_for :users
  # get 'home/top'
  # root to: "home#top"
  root to: "home#index"
  resources :users
  resources :rooms, only: %i[index show new create] do
    resources :messages, only: [:index, :create]
    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json' }
    end
  end


  resources :posts do
    resources :comments, only: [:create]  #commentsコントローラへのルーティング
  end
  resources :tags, only: %i[index show]
  
end
