class FollowsController < ApplicationController
	def create
		@user = User.find(params[:follows][:user])
		current_user.follow(@user)
		redirect_to tweets_path
	end
end
