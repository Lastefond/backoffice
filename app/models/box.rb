class Box < ApplicationRecord
	has_many :donators
	has_many :donations, through: :donators


	def sum_donations
		self.donations.sum(:amount)
	end
end
