Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  post "/data", to: "graphql#execute"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Devise related routes
  # devise_for :users

  # Defines the root path route ("/")
  # root "articles#index"
end
