Rails.application.routes.draw do
  resources :test_blogs
  root to: redirect(Rails.configuration.default[:root_path])
end
