class Tweet < ActiveRecord::Base
	validates :username, :presence => true
	validates :content, :presence => true
	validates :longitude, :presence => true
	validates :latitude, :presence => true 
end
