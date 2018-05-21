Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "url_originals#index"
  get "/:id", to: "url_originals#show"
  resources :url_originals, only: [:create]
end
