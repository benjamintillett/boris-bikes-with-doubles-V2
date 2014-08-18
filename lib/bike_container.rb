module BikeContainer
	IS_BROKEN = ->(bike) { bike.broken? }

	def initialize(bikes=[])
		@bikes = bikes
	end
	def has_bikes?
		@bikes.any?
	end
	def release_bike 
		@bikes.pop
	end
	def dock!(bike)
		@bikes << bike
		nil
	end
	def available_bikes
		@bikes.reject(&IS_BROKEN)
	end
	def broken_bikes
		@bikes.select(&IS_BROKEN)
	end
	def release_broken_bikes
		broken = broken_bikes
		@bikes = @bikes.reject(&IS_BROKEN)
		broken
	end
	
	def collect_broken_bikes_from(station)	
		station.release_broken_bikes.each { |bike| self.dock!(bike) } if station.has_bikes?
	end

end