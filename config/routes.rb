Rails.application.routes.draw do
  get 'user_profiles/show'
  get 'user_profiles/edit'
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
