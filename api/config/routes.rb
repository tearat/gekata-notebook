Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :types, only: [:index, :tags]
    get '/types/:id/tags', to: 'types#tags'

    resources :tags
    get '/tags/:id/articles', to: 'tags#articles'

    resources :articles
  end
end
