Rails.application.routes.draw do
  root "events#index"
  resources :events, only: [ :create, :destroy, :update ]

  get "up" => "rails/health#show", as: :rails_health_check
end
