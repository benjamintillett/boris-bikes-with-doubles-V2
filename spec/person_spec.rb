require 'person'

describe Person do 
	let(:person) 			{ Person.new }
	let(:person_with_bike) 	{ Person.new(:bike) }
	let(:station) 			{ double :station }
	
	it " does not have a bike" do 
		expect(Person.new).not_to have_bike
	end
	it "has a bike" do 
		person = Person.new(:bike)
		expect(person).to have_bike
	end
	it "can break a bike" do 
		bike = double :bike
		person = Person.new(bike)
		expect(bike).to receive(:break!)
		person.fall_down
	end
	it "rents a bike from a station" do  
		expect(station).to receive(:release_bike)
		person.rent_bike_from(station)
	end
	it "has a bike after renting one" do 
		station = double :station, release_bike: :bike
		person.rent_bike_from(station)
		expect(person).to have_bike
	end
	it 'returns bike to a station' do 
		expect(station).to receive(:dock).with(:bike)
		person_with_bike.return_bike_to(station)
	end
	it "has no bike after returning one" do 
		allow(station).to receive(:dock).with(:bike).and_return(nil)
		person_with_bike.return_bike_to station
		expect(person_with_bike).not_to have_bike 
	end
end