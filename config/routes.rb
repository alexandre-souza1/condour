Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :condominia do
    resources :posts, only: %i[new create]
  end

  resources :posts, except: %i[new create] do
    resources :comments, only: %i[new create destroy]
  end

  resources :condominia do
    resources :services
    end

resources :condominia do
    resources :places
    end


  # Defines the root path route ("/")
  # root "posts#index"
end
