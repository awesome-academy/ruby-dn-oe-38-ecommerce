Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "/search" => "pages#search", :as => "search_page"
    resources :brands, except: [:destroy, :show]
    namespace :admin do
      get "/home", to: "static_pages#home"
    end
    resources :products, only: [:index]
  end
end
