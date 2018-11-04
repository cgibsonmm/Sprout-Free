Rails.application.routes.draw do
  get 'forums/index'
  namespace :admin do
      resources :users
      resources :forum_posts
      resources :forum_threads
      resources :forum_topics
      resources :images

      root to: "users#index"
    end

  resources :forums, only: [:index]
  resources :forum_categories

  devise_for :users

  resources :images, only: [:create]

  resources :forum_topics, shallow: true do
    collection do
      patch :sort
    end
    resources :forum_threads do
      resources :forum_posts, module: :forum_threads
    end
  end

  root "home#index"
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
