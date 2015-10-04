require 'rails_helper'

RSpec.describe World, type: :model do

	let (:world1) { FactoryGirl.create(:world) } 

	it 'before save downcase' do
		expect(world1).not_to eq('Administração')
	end 

  it 'is valid with a title and description' do
		expect(world1).to be_valid
	end

	# Tests can't to be valid

	it 'is invalid without title' do
		world1.title = nil
		world1.valid?
		expect(world1.errors[:title]).to include("can't be blank")
	end 

	it 'is invalid without description' do
		world1.description = nil
		world1.valid?
		expect(world1.errors[:description]).to include("can't be blank")
	end

	it 'is invalid if description less than 10 characters' do
		world1.description = "n" * 9
		world1.valid?
		expect(world1.errors[:description]).to include("is too short (minimum is 10 characters)")
	end

	it 'is invalid with a duplicate title' do
		world2 = World.new(:title => world1.title )
		world2.valid?
		expect(world2.errors[:title]).to include('has already been taken')
	end
end
