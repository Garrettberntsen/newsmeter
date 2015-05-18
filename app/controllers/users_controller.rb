class UsersController < ApplicationController

	before_action :authenticate_user, only: [:show]

	def show
		@user = User.find(session[:user_id]) if session[:user_id]
	end

end
