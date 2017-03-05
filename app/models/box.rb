class Box < ApplicationRecord
	has_many :donators
	has_many :donations, through: :donators


	def sum_donations
		self.donations.sum(:amount)
	end

	def online?
		return false if last_online.nil?
		Time.now-last_online<120
	end

end
