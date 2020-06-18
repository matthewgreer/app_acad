
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

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

  resources :laughs, only: [:index, :show, :create, :update, :destroy] # shortcut to define multiple routes
  # resources :laughs, except: [:new, :edit] # specify which routes to exclude, essentially the same as above
  # resources :laughs # creates all 7 routes for laughs
end

class LaughsController < ApplicationController
  # controller should build the response for a request
  # each request creates a new LaughsController instance: 
    # first request:  self.object_id -> 70234348655680
    # second request: self.object_id -> 70234336102060
  # each request only has access to the specified action
      # ex: a request to the `show` action would not have access to `@laughs` from the `index` action
  # .find, .all are methods available to ActiveRecord models (Laugh model)
  # instances variables within each action will be used when start using Views
  
  def index
    # debugger
    @laughs = Laugh.all # uses Laugh model to fetch info from database
    render json: @laughs 
  end

  def show
    # debugger
    # find laugh by its id
    @laugh = Laugh.find(params[:id]) # params is hash like obj, key into at key of id to get value
    render json: @laugh 
  end

  def create 
    # add a new laugh to db, don't use .create so we can control what happens
    # debugger
    # @laugh = Laugh.new(body: params[:body]) # assign body with key/value pair, use below option instead
    # @laugh = Laugh.new(params[:laugh]) # this would result in ActiveModel::ForbiddenAttributesError
    @laugh = Laugh.new(laugh_params) # use strong params to allow the attributes we want users to be able to supply
    
    @laugh.author_id = User.first.id # this is temporary fix until we learn how to get id of logged in user
    if @laugh.save
      # render json: @laugh # show action already does this, so let's use it
      redirect_to laugh_url(@laugh.id) # use prefix for show with `_url` (<prefix>_url is method built into Rails), pass in id of laugh we want to show
    else
      render json: @laugh.errors.full_messages, status: 422 # gives all error messages from when we tried to save @laugh to the db. with a specific error code
    end
  end

  def update
    @laugh = Laugh.find(params[:id])
    if @laugh.update(laugh_params) # .update - is this recursion?, no - this is the .update method for the @laugh (instance of the Laugh model)
      # debugger
      redirect_to laugh_url(@laugh) # Rails knows to extract the id from @laugh to populate the wildcard
    else
      render json: @laugh.errors.full_messages, status: 422
    end
  end

  def destroy
    @laugh = Laugh.find(params[:id])
    @laugh.destroy # active record .destroy method
    redirect_to laughs_url # `laughs` is prefix for index action
  end

  def laugh_params # strong params, only allow users to set what we allow
    params.require(:laugh).permit(:body)
      # params will require top level key of :laugh, it will allow nested key of :body
  end
end