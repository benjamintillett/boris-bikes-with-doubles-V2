shared_examples "a bike container" do 

	let(:station) { described_class.new([:bike]) }
	let(:bike) { double :bike , broken?: false }
	let(:broken_bike) { double :bike, broken?: true }
	let(:station_with_bikes) { described_class.new([bike,broken_bike]) }
	
	it "has no bikes" do 
		expect(described_class.new).not_to have_bikes
	end
	it "has bikes" do 
		expect(described_class.new([:bike])).to have_bikes
	end
	it "can release a bike" do 
		expect(station.release_bike).to eq :bike
	end
	it "has no bikes after releasing the last one" do 
		station.release_bike
		expect(station).not_to have_bikes
	end
	it "docks a bike" do 
		expect(station.dock!(:bike)).to be_nil
	end 
	it "has a bike once we dock one" do 
		station.dock!(:bike)
		expect(station).to have_bikes
	end
	it "has availible bikes (not broken ones)" do 
		expect(station_with_bikes.available_bikes).to eq [bike]
	end
	it "has broken bikes" do 
		expect(station_with_bikes.broken_bikes).to eq [broken_bike]
	end
	it "releases broken bikes" do 
		expect(station_with_bikes.release_broken_bikes).to eq [broken_bike]
	end
	it "has no broken bikes after releasing them" do 
		station_with_bikes.release_broken_bikes
		expect(station_with_bikes.broken_bikes).to eq [] 
	end
end