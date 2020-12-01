Rails.application.routes.draw do
  resources :users
  root to: redirect(Rails.configuration.default[:root_path])
end
