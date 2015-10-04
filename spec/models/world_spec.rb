require 'rails_helper'

RSpec.describe World, type: :model do

  it 'is valid with a title and description' do
  	world = FactoryGirl.create(:world)
		expect(world).to be_valid
	end


	# Tests can't to be valid

	it 'is invalid without title' 

	it 'is invalid without description' 

	it 'is invalid if description less than 10 char' 

	it 'is invalid with a duplicate title'
end
