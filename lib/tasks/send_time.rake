namespace :hipchat do
	desc 'send iformation of MinuteDock to HipChat'
	task :send_time do |t|
		require 'open-uri'
		require 'json/pure'

		user = "ayumi.highroof@gmail.com"
		pass = "minute4649"
		url = "https://minutedock.com/api/v1/entries.json?users=18590"
		result = open(url, :http_basic_authentication => [user, pass]).read
	
		json = JSON.parser.new(result)
		hash = json.parse()
		total = 0
		hash.each { |data|
			total += data["duration"]
		}
		#test
		hour = total / 60 / 60
		client = HipChat::Client.new("6ece3454ac2e42e41faa3f384d5957")
		client['test'].send('Ayumi Udaka', " Total working time for this week is #{hour} h")
	end
end
