Rails.application.routes.draw do
  get 'activities/index'
  get 'user_profiles/show'
  get 'user_profiles/edit'
  get 'forums/index'
  get 'forums/most_comments'

  get 'forums/latest'

  resources :users, only: [:index]

  resources :news_stories do
    member do
      get 'preview'
      patch :publish
    end
  end

  namespace :admin do
      resources :users
      resources :forum_posts
      resources :forum_threads
      resources :forum_topics
      resources :images
      resources :notifications

      root to: "users#index"
    end

  resources :forums, only: [:index]

  resources :site_notifications
  resource :confirm_reminder, only: [:create]

  resources :forum_categories do
    collection do
      patch :sort
    end
    resources :forum_topics, shallow: true do
      collection do
        patch :sort
      end
      resources :forum_threads do
        resource :follow, module: :forum_threads
        resources :forum_posts, module: :forum_threads do
          resource :likes, module: :forum_posts
        end
      end
    end
  end

  resources :notifications do
    collection do
      post :mark_as_read
    end
  end

  resources :user_profiles, only: [:show, :edit, :update]

  resources :images

  resources :forum_threads, only: [:index]

  devise_for :users

  resources :ticklers, only: [:new, :create]

  root "home#index"
  get 'home/index'


  # Error Routes
  match "/404", to: "errors#not_found", via: :all
  match "/422", to: "errors#unacceptable", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
end
