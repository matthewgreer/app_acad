class Api::UsersController < ApplicationController

    def create
        @user = User.new(user_params)
        if @user.save
          login!(@user)
          redirect_to api_user_url(@user)
        else
          redirect_to new_api_session
        end
    end

    def show
        @user = User.find(params[:id])
        render json: @user 
    end



    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

end
