class ApplicationController < ActionController::Base

    helper_method :current_user

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def login_user!(user)
      session[:session_token] = user.reset_session_token!
    end

    def logged_in?
      !!current_user
    end

    def owns_cat?(test_cat)
      cats_owned = current_user.cats

      if cats_owned.none? do |cat|
          cat.params[:cat][:id] == test_cat.params[:cat][:id]
        end
        redirect_to cats_url
      end
    end

end
