Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: {format: :json} do
    root to: "home#index"

    devise_scope :user do
      post "sign_up", to: "registrations#create"
      post "sign_in", to: "sessions#create"
    end

    get :data, to: "data#index"
    resources :types
    resources :tags
    resources :articles
  end
end
