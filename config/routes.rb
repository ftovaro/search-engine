Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get "/statistics", to: "home#show"

  namespace :api do
    namespace :v1 do
      post "/search", to: "search#create", as: :create_search
      get "/statistics", to: "statistics#index"
      resources :statistics, only: :index
      resources :articles do
        collection do
          get "/", to: "articles#index", as: :search
        end
      end
    end
  end
end
