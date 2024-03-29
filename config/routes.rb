Rails.application.routes.draw do
  get 'rules/index'
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
    resources :services, only: %i[new create index]
  end

  resources :services, except: %i[new create index]

  resources :condominia do
    resources :rules, only: %i[new create destroy index]
  end

  resources :condominia do
    resources :places, only: %i[new create index]
  end

  resources :condominia do
    resources :residents
  end

  resources :places, except: %i[new create index] do
    resources :rentals, only: %i[new create index]
  end

  resources :condominia do
    get "my_rentals", to: "rentals#my_rentals"
  end

  resources :condominia do
    get "apartments", to: "places#apartments"
    get "apartments/new", to: "places#apartments_new" # Adicionando um membro para 'new'
    post "apartments", to: "places#apartments_create" # Utilizando a mesma rota 'apartments' para criar
  end

  resources :rentals, except: %i[new create index]

  # Defines the root path route ("/")
  # root "posts#index"
end
