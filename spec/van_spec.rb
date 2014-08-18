require 'van'

describe Van do 
	it_behaves_like "a bike container"
	let(:station) { double :station }
	let(:empty_van) { Van.new } 
end
