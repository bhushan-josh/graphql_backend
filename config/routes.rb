Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  resources :comments
  resources :posts do
    resources :comments, only: [:index], controller: 'post_comments'
  end
  resources :users do
    resources :posts, only: [:index], controller: 'user_posts'
    resources :comments, only: [:index], controller: 'user_comments'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "posts#index"

  if Rails.env.production?
    get '/run_migrations', to: 'application#run_migrations'
    get '/run_seeds', to: 'application#run_seeds'
  end
end
