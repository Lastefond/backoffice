class Donator < ApplicationRecord
	has_many :donations
	belongs_to :box

	
	def sum_donations
		self.donations.sum(:amount)
	end
end
