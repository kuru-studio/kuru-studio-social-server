Rails.application.routes.draw do
  root to: redirect(Rails.configuration.default[:root_path])
end
