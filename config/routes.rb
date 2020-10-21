Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
    resources :airlines
    resources :users, only: %i[show create update destroy]
    resources :tokens, only: %i[create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
