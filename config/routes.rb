Rails.application.routes.draw do
  post "/data", to: "graphql#execute"
end
