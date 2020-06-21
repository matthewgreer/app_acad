class UsersController < ApplicationController

  def create
    @user = User.create(user_parameters)
    if @user.save
      redirect_to gardens_url
    else
      render :new
    end
  end

  private

  def user_parameters #strong params
    self.params.require(:user).permit(:username)
  end

end