class City
	attr_accessor :name, :landmark, :population, :weather
	$cities = {}
	
	def initialize(city_params)
		@name = city_params[:name]
		@landmark = city_params[:landmark]
		@population = city_params[:population]
		@weather = WeatherService.get(@name)
	end

	def save
		$cities[@name.to_sym] = self
	end

	def self.all
    $cities
  end

	def update(update_params)
		# Your code here, for Task 4
		# Use update_params (a hash) to update the model
		if update_params[:city].present? 
			city = City.all[update_params[:city].to_sym]
			if city
				if update_params[:land].present? 
					city.update(landmark: update_params[:landmark])
				end
				if update_params[:population].present? 
					city.update(population: update_params[:populaiton])
				end
			end
		end
	end
end