Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#root'
  resources :gifs, only: [:create]
  get 'gifs/:title', to: 'gifs#search' #custom route
  #:title will replace the query string the use typed
end
