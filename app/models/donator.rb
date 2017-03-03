class Donator < ApplicationRecord
	has_many :donations
	belongs_to :box

	
	def sum_donations
		self.donations.sum(:amount)
	end

	def web_params
	  {
	    "box_id": box.id,
	    "box_name": box.location,
	    "lat": box.lat,
	    "long": box.long,
	    "name": name,
	    "amount": (sum_donations*100).to_i,
	    "timestamp": Time.now.to_i
	  }
	end

	def send_to_web
		DonationWorker.perform_async(web_params)
	end

end
