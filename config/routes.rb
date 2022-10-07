Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :heroes, only: [:index, :show]
  resources :powers, only: [:index, :show, :update]
  post "/hero_powers", to: "hero_powers#create"
  get "/hero_power", to: "hero_powers#index"

end
