class TweetsController < ApplicationController
	
	before_action :authenticate_user!

	def new
		@tweet = Tweet.new
	end

	def create
		@tweet = Tweet.new(tweet_params)
		@tweet.user = current_user
		if @tweet.save
			flash[:success] = "You have created a tweet"
			redirect_to new_tweet_path
		else
			render 'new'
		end
	end

	def index
		@tweets = Tweet.all
	end

	def tweet_params
		params.require(:tweet).permit(:content)
	end
end
