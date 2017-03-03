class DonationWorker
  include Sidekiq::Worker

  def perform(*args)
    uri = URI(ENV['FRONTEND_API_URL'])
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.instance_of? URI::HTTPS
    req = Net::HTTP::Post.new(uri.path, 'Content-Type' => 'application/json')
    req.body = args.first.to_json
    binding.pry
    res = http.request(req)
    puts "response #{res.body}"
  rescue => e
      puts "failed #{e}"
  end

  def test_params
  	params = {
	  "box_id": 1,
	  "box_name": "Tasku Keskus",
	  "lat": 59.381034,
	  "long": 28.175182,
	  "name": "Airon",
	  "amount": 200,
	  "timestamp": 22324352234
	}
  end
end	


