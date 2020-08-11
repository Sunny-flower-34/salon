Rails.application.routes.draw do
  root to: "users#index"
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  # get 'home/top'
  # root to: "home#top"
  resources :users
  resources :rooms do
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
