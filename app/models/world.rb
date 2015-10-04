class World < ActiveRecord::Base
	validates_presence_of :title, :description
	validates_uniqueness_of :title
	validates_length_of :description, minimum: 10

	before_save :switch_case

	private

	def switch_case
		self.title.downcase!
	end
end
