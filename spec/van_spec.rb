require 'van'

describe Van do 
	it_behaves_like "a bike container"
	let(:station) { double :station }
	let(:empty_van) { Van.new } 
	
	it "can collect broken bikes from station" do 
		station = double :station, has_bikes?: false 
		empty_van.collect_broken_bikes_from(station)
	end

	it "has broken bikes after collecting them" do
		broken_bike1 = double :bike, broken?: true
		broken_bike2 = double :bike, broken?: true
		station = double :station, release_broken_bikes: [broken_bike1, broken_bike2], has_bikes?: true 
		empty_van.collect_broken_bikes_from(station)
		# expect(empty_van.broken_bikes).to eq [broken_bike1, broken_bike2]
	end
end
