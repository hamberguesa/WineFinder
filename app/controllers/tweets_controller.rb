class TweetsController < ApplicationController
	APP_ID = ENV['APP_ID']
	APP_SECRET = ENV['APP_SECRET']
	ACCESS_TOKEN = ENV['ACCESS_TOKEN']
	ACCESS_TOKEN_SECRET = ENV['ACCESS_TOKEN_SECRET']
	REDIRECT_URI = 'http://localhost:3000'
	# REDIRECT_URI = 'http://wine-finder.herokuapp.com'

	def index
		# response = HTTParty.get('https://api.twitter.com/1.1/search/tweets.json?q=%23wine+%23vino')
		baseurl = "https://api.twitter.com"
		path    = "/1.1/search/tweets.json"
		query   = URI.encode_www_form("q" => "%23wine+%23vino")
		address = URI("#{baseurl}#{path}?#{query}")
		request = Net::HTTP::Get.new address.request_uri

		# Print data about a Tweet
		def print_tweet(tweet)
		  # Pretty-print the user object to see what data is available.
		  p JSON.pretty_generate(tweet)
		  # ADD CODE TO PRINT THE TWEET IN "<screen name> - <text>" FORMAT
		  # "#{tweet["user"]["screen_name"]} - #{tweet["text"]}"
		end

		# Set up HTTP.
		http             = Net::HTTP.new address.host, address.port
		http.use_ssl     = true
		http.verify_mode = OpenSSL::SSL::VERIFY_PEER

		# Credentials
		consumer_key = OAuth::Consumer.new(
		    APP_ID, APP_SECRET)
		    
		access_token = OAuth::Token.new(
		    ACCESS_TOKEN, ACCESS_TOKEN_SECRET)

		# Issue the request.
		request.oauth! http, consumer_key, access_token
		http.start
		response = http.request request

		# Parse and print the Tweet if the response code was 200
		tweet = nil
		if response.code == '200' then
		  tweet = JSON.parse(response.body)
		  print_tweet(tweet)
		end
	end


end
