class SessionsController < ApplicationController
    def new
        render :new
    end

    before_action do
      redirect_to cats_url if current_user.logged_in?
    end

    def create
        user = User.find_by_credential(
            params[:user][:user_name],
            params[:user][:password]
        )

        if user 
            login_user!(user)
            redirect_to cats_url
        else
            flash.now[:errors] = user.errors.full_messages
            render :new
        end
    end

    def destroy
        current_user.reset_session_token!
        session[:session_token] = nil
        redirect_to new_session_url
    end


end