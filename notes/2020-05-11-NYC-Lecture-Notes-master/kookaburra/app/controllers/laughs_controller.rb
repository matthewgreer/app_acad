class LaughsController < ApplicationController
  # controller should build the response for a request
  # each request creates a new LaughsController instance: 
    # first request:  self.object_id -> 70234348655680
    # second request: self.object_id -> 70234336102060
  # each request only has access to the specified action
      # ex: a request to the `show` action would not have access to `@laughs` from the `index` action
  # .find, .all are methods available to ActiveRecord models (Laugh model)
  # instances variables within each action will be used when start using Views

  # user must be logged in in order to reach any of these actions
  # ensure_logged_in comes from applicaiton_controller
  before_action :ensure_logged_in, only: [:create, :new, :edit, :update, :destroy] 

  def index
    # debugger
    @laughs = Laugh.all.includes(:author) 
    # uses Laugh model to fetch info from database
    # we are using .includes(:assoc) to prevent N + 1 query

    # render json: @laughs # rendering json, 'json:' is setting the rendering format

    # render :tester
    render :index
    # render can be used to render a template
  end

  def show
    # debugger
    # find laugh by its id
    @laugh = Laugh.find(params[:id]) # params is hash like obj, key into at key of id to get value
    # render json: @laugh 
    render :show
  end

  def new
    # this is an action that just renders a form for users to fill in information to be sent to create action
    @laugh = Laugh.new # creating an empty model instance as a dummy
    render :new
  end

  def create 
    # add a new laugh to db, don't use .create so we can control what happens
    # debugger
    # @laugh = Laugh.new(body: params[:body]) # assign body with key/value pair, use below option instead
    # @laugh = Laugh.new(params[:laugh]) # this would result in ActiveModel::ForbiddenAttributesError
    @laugh = current_user.laughs.new(laugh_params) # use strong params to allow the attributes we want users to be able to supply
    
    # @laugh.author_id = User.first.id # this is temporary fix until we learn how to get id of logged in user
    # @laugh.author_id = current_user.id # this would set author_id, but we use the `laughs` association when creating the laugh instead

    if @laugh.save
      # render json: @laugh # show action already does this, so let's use it
      redirect_to laugh_url(@laugh.id) # use prefix for show with `_url` (<prefix>_url is method built into Rails), pass in id of laugh we want to show
      # redirect_to 'https://en.wikipedia.org/wiki/Kookaburra' # we can freely be redirected to anywhere not just within our server
      # redirect instantiates a new request cycle
      # http request is stateless - meaning no previous request information is persisted.
    else # when @laugh.save returns false
      # render json: @laugh.errors.full_messages, status: 422 # gives all error messages from when we tried to save @laugh to the db. with a specific error code
      flash.now[:errors] = @laugh.errors.full_messages
        # use flash.now with a render (flash with a redirect)
        # flash.now persists only through the end of the current req/res cycle
      render :new, status: 422
    end
  end
  
  def edit
    @laugh = Laugh.find(params[:id])
    render :edit
  end

  def update
    # debugger
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


  def set_cookie
    maybe_cookie = params[:my_cookie]

    if maybe_cookie
      flash[:my_cookie] = maybe_cookie 
      # using a methods called `cookies`, `session`, `flash`, returns hashlike obj that allows us to set cookies 
      # `cookies` - plain text, max expiration (generally don't use this one)
      # `session` - encrypted, expired at the end of the browser session, storing user session token (how user stays logged in)
      # `flash` - encrypted, expires at the end of the current or next res cycle (flash vs. flash.now), mostly used for storing errors or notifications (temporary message to show user)
      render plain: "I am setting your cookie: #{maybe_cookie}"
    else 
      render plain: "You must provide a cookie"
    end
  end

  def get_cookie
    my_cookie = flash[:my_cookie]
    if my_cookie
      render plain: "Here's your cookie: #{my_cookie}"
    else
      render plain: "You haven't set a cookie called :my_cookie yet"
    end
  end



  def laugh_params # strong params, only allow users to set what we allow
    params.require(:laugh).permit(:body, :author_id) # { laugh: { body: some_info, author_id: } }
      # params will require top level key of :laugh, it will allow nested key of :body
  end
end

