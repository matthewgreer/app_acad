class Api::SessionsController < ApplicationController
    before_action :require_logged_in!, only: [:destroy]

    def new
        render json: "api/sessions/new"
    end

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user
            login!(@user)
            redirect_to api_user_url(@user)
        else
            render json: "api/sessions/new"
        end
    end

    def destroy
        if current_user
            logout!
            render json: {}
        else
            render :json => {:error => "not-found"}.to_json, :status => 404
        end
    end




end
