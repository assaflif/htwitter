class HashtagsController < ApplicationController

	def show
		@hashtag = Hashtag.where(tag: params[:id]).first
		@tweets = Tweet.all
	
		if @hashtag
			@filtered_tweets = @tweets.select do |tweet|
				tweet.get_hashtags.include?(@hashtag.tag)
			end
		else
			@filtered_tweets = Array.new
			flash.now[:notice] = "There are no tweets with #{params[:id]}"
		end
	end
end
