Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"

  namespace :api do
    namespace :v1 do
      post "/search", to: "search#create", as: :create_search
      resources :articles do
        collection do
          get "/", to: "articles#index", as: :search
          # get "/filter", to: "filter#index", as: :filter
        end
      end
    end
  end
end
