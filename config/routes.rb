Rails.application.routes.draw do
  post "/data", to: "graphql#execute"
  root to: redirect(Rails.configuration.default[:root_path])
end
