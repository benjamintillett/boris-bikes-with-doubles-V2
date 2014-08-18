require 'bike' 

describe Bike do 
	let(:bike) { Bike.new }
	it "is not broken" do 
		expect(bike).not_to be_broken
	end	
	it "is broken once it breaks" do 
		expect(bike.break!).to be_broken
	end
	it "can be fixed" do 
		expect(bike.break!.fix!).not_to be_broken
	end
end
