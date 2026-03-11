Rails.application.routes.draw do
  get "users/show"
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  resources :restaurants do
    resource :favorite, only: [:create, :destroy]
  end
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get 'favorites', to: 'favorites#index', as: 'favorite_list'
  get 'account', to: 'users#show', as: 'user_profile'
  root "restaurants#index"
end