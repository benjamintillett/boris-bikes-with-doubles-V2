require 'bike_container'

class Van 
	include BikeContainer

	def collect_broken_bikes_from(station)
		station.release_broken_bikes.each { |bike| self.dock!(bike) } if station.has_bikes?
	end
end