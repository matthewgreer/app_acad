class ApplicationController < ActionController::Base
    # skip_before_action :verify_authenticity_token # add this get around csrf error (will learn more on this later)
		helper_method :current_user, :logged_in? # give views access to these methods

		def current_user # all other controllers have access to this
			# query the db for a user that has a session_token that matches the client cookie session
			@current_user ||= User.find_by(session_token: session[:session_token])
		end

		def login!(user)
			session[:session_token] = user.reset_session_token!
		end

		def logout!
			current_user.reset_session_token!
			session[:session_token] = nil # `session` is method that returns a hash-like object
			@current_user = nil
		end

		def logged_in?
			!!current_user # do we have a logged in user?
			# `!!` will coerce current_user into a boolean
			# if current_user is nil, this will return false
			# if current_user is a User obj, this will return true
		end

		def ensure_logged_in
			# if user is not logged in, redirect to log in form
			redirect_to new_session_url unless logged_in?
		end
end
