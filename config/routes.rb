Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "toppages#index"
  get "signup", to: "users#new"
  resources :users, only: [:new,:create,:edit,:update]

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  resources :logs, only: [:new,:create,:edit,:update,:destroy]
  resources :goals, only: [:new,:create,:edit,:update]

  get "compare", to: "compares#index"
  post "compare", to: "compares#index"

end
