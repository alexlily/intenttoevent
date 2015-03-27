class WelcomeController < ApplicationController
	def index
		@all_users = User.all
		#result = Yelp.client.search('San Francisco', {term: 'food'})
		#parsed = JSON.parse(result)
		#render json: Yelp.client.search('San Francisco', {term: 'food'})
	end
	def search
		@lat = User.find_average_lat
		@lon = User.find_average_lon
		params = {term: 'food', limit: 3}
		coordinates = {latitude: @lat, longitude:@lon}
		
		@response = Yelp.client.search_by_coordinates(coordinates, params)

	end
	def setlocation
		current_user.latitude = params[:latitude]
		current_user.longitude = params[:longitude]
		current_user.save!
		render nothing: true
	end
end
