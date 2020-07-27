class UsersController < ApplicationController
  before_action :require_no_current_user!, only: [:new, :create]
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    # creating an empty user instance allows us to preserve
    # form input if a user submits invalid information
    # 
  end

  def create
    @user = User.new(user_params)
    # creates new instance of User class using user_params
    if @user.save
      login!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
    # requires top level key of :user in our params
    # extracts :username and :password keys nested under :user
  end
end
