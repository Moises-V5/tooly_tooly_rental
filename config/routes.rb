Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :tools, only: [:new, :create, :index, :edit, :update, :show, :destroy] do
    resources :bookings, only: [:new, :create]
  end
  resources :categories, only: [:show, :index]
  resources :bookings, only: [:index, :destroy]
  get "about_us", to: "pages#about_us", as: :about_us
  get "profile/:id", to: "profiles#show", as: :profile
  get "profile/:id/edit", to: "profiles#edit", as: :edit_profile
  patch "profile/:id", to: "profiles#update"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
