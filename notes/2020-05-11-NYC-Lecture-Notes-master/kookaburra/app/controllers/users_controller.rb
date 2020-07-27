class UsersController < ApplicationController
	def new
		@user = User.new # dummy object so we don't run into errors pre-filling inputs
		render :new
	end

	def create
		@user = User.new(user_params)
		@user.location_id = Location.first.id
		if @user.save # regular `save`, not `save!` so we can control what happens if there are errors
			# log the user in, setting cookie to user's session token
			session[:session_token] = @user.reset_session_token! # reset_session_token! returns the session_token
			redirect_to laughs_url
		else
			# let the user try again, but tell them what they got wrong
			flash.now[:errors] = @user.errors.full_messages
			render :new
		end
	end

	private
	def user_params
		params.require(:user).permit(:username, :password)
	end
end
