Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "products#index"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/search" => "pages#search", as: "search_page"
    resources :brands, except: [:destroy, :show]
    resources :products, only: [:index, :show]
    namespace :admin do
      get "/home", to: "static_pages#home"
      resources :brands, except: [:destroy, :show]
      resources :products, except: [:destroy, :show]
    end
  end
end
