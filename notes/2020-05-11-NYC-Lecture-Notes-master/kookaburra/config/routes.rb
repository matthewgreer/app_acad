Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'static_pages#root'

  namespace :api, defaults: { format: "json" } do
    resources :laughs, only: [ :index, :create, :show ]
    resources :users
  end

  # Old Rails routes below:
  
  # What are the 4 components to define a route?
    # Verb/method
    # path
    # controller
    # action
  # see routes with `bundle exec rails routes`
  # always restart the server if you make changes to `routes.rb` (or anything else in /config/)
    # use control + 'c' to gracefully terminate, use 'bundle exec rails s` to start server
  # PATCH vs. PUT:
    # patch will update an existing record (preseving the id)
    # put will replace the existing record (creating a new id)
    # -> we will prefer to use PATCH
    
  # get '/laughs', to: 'laughs#index'   # manually creates single route
  # get '/laughs/:id', to: 'laughs#show' # `:id` is a wildcard - dynamic segment of the path, this will be replaces with an actual id
  # post '/laughs', to: 'laughs#create'
  # patch '/laughs/:id', to: 'laughs#update'
  # put '/laughs/:id', to: 'laughs#update'
  # delete '/laughs/:id', to: 'laughs#destroy'
    # routes with `/laughs` refer to a collection of laughs
    # routes with `/laughs/:id` refer to one specific laugh

  # get '/test/:banana_man', to: 'laughs#update' # we made this as a 'get' verb for us to easily test with our browser, but it should be 'patch' or 'put'.

  # resources :laughs, only: [:index, :show, :new, :create, :edit, :update, :destroy] # shortcut to define multiple routes
  # resources :laughs, except: [:new, :edit] # specify which routes to exclude, essentially the same as above
  # resources :laughs # creates all 7 routes for laughs
  # get '/set_cookie', to: 'laughs#set_cookie'
  # get '/get_cookie', to: 'laughs#get_cookie'

	# resource :session, only: [:new, :create, :destroy]
	# above we use SINGULAR 'resource'. this will mean we don't have any wildcards in our routes
	# this makes sense because a session can never have an 'id'

	# resources :users, only: [:new, :create]

end
