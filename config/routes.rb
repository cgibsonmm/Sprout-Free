Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :forum_posts
      resources :forum_threads
      resources :forum_subjects
      resources :images

      root to: "users#index"
    end


  devise_for :users

  resources :ticklers, only: [:new, :create]

  resources :images, only: [:create]
  resources :forum_subjects, shallow: true do
    collection do
      patch :sort
    end
    resources :forum_threads do
      resources :forum_posts, module: :forum_threads
    end
  end

  root 'ticklers#new'
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
