Rails.application.routes.draw do
  resources :restaurants
  devise_for :users
  post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root "restaurants#index"
end