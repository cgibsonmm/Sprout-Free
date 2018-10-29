Rails.application.routes.draw do
  resources :test_photos

  resources :forum_post_photos do
    get "photo_url", on: :member
  end
  namespace :admin do
      resources :users
      resources :forum_posts
      resources :forum_threads

      root to: "users#index"
    end


  devise_for :users

  resources :images, only: [:create]


  resources :forum_subjects, shallow: true do
    resources :forum_threads do
      resources :forum_posts, module: :forum_threads
    end
  end

  root "home#index"
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
