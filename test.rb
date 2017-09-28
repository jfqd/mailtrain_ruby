require "mailtrain"

@client = Mailtrain.new("YOUR_HOST_URL", "your_access_token")
list_id = "Hk8T-rvYW"

puts @client.subscribe(list_id, "bess@3cps.ca")
puts @client.success?
puts @client.data
puts @client.data[:id]
puts @client.blacklist
