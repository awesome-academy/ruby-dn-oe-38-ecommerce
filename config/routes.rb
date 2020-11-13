Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "/search" => "pages#search", :as => "search_page"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    namespace :admin do
      get "/home", to: "static_pages#home"
      resources :brands, except: [:destroy, :show]
      resources :products, except: [:destroy, :show]
    end
  end
end
