Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: {format: :json} do
    root to: "home#index"

    devise_scope :user do
      post "sign_up", to: "registrations#create"
      post "sign_in", to: "sessions#create"
    end

    resources :types, only: [:index, :tags]
    get '/types/:id/tags', to: 'types#tags'

    resources :tags
    get '/tags/:id/articles', to: 'tags#articles'

    resources :articles
  end
end
