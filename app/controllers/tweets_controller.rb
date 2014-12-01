class TweetsController < ApplicationController
	APP_ID = ENV['APP_ID']
	APP_SECRET = ENV['APP_SECRET']
	REDIRECT_URI = 'http://localhost:3000'
	# REDIRECT_URI = 'http://wine-finder.herokuapp.com'

	def index

		response = HTTParty.get('https://api.twitter.com/1.1/search/tweets.json?q=%23wine+%23vino')

	end


end
