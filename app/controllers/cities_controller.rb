class CitiesController < ApplicationController
	#to view the info of a city or cities
	def view
		if params[:city].present? and City.all.has_key?(params[:city].to_sym)
			@cities = []
			@cities  << City.all[params[:city].to_sym]
		else
			@cities = City.all.values()
		end
		render 'view'
	end

	#show the forum for creating anew city
	def new
		render 'new'
	end

	#creating a new city
	def create
		@cityName = params[:city]
    	@w = WeatherService.get(@cityName)
    	if @w
			#@temperature = (9.0/5) * (@w[:temperature] - 273) + 32
			city = City.new(
				name: @cityName,
				landmark: params[:landmark],
				population: params[:population]
			)
			city.save
		end
		@cities = City.all.values()
		render 'view'
	end

	#updating a city
	def update
		if params[:city].present? 
			@city = params[:city]
			@city_pop = params[:population]
			@city_landmark = params[:landmark]
		else
			@city = 'Berkeley'
			@city_pop = 121240
			@city_landmark = 'oski'
		end
		render 'update'
	end

	def update_city
		@cityName = params[:city]
    	@w = WeatherService.get(@cityName)
    	if @w
			#@temperature = (9.0/5) * (@w[:temperature] - 273) + 32
			city.update(
				name: @cityName,
				landmark: params[:landmark],
				population: params[:population]
			)
			city.save
		end
		@cities = City.all.values()
		render 'view'
	end
end