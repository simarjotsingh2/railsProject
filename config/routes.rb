Rails.application.routes.draw do
  get "pages/about"
  get "posts/index"
  get "posts/show"
  get "users/index"
  get "users/show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  resources :users, only: [ :index, :show ]
  resources :posts, only: [ :index, :show ]
  get "about", to: "pages#about"
  root "posts#index"
end
