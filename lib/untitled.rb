class Bike
	def initialize 
		@broken = false
	end
	
	def break 
		@broken = true
	end
	
	def fix
		@broken = false
	end
end

bike = Bike.new 
bike.break
bike.fix
bike.break

puts bike.inspect
