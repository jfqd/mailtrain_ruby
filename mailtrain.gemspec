Gem::Specification.new do |s|
  s.name        = 'mailtrain'
  s.version     = '0.0.1'
  s.date        = '2017-09-28'
  s.summary     = "Sendy!"
  s.description = "A simple MailTrain API"
  s.authors     = ["benko"]
  s.email       = 'benko.b@shopperplus.com'
  s.files       = ["lib/mailtrain.rb", "lib/mailtrain/client.rb", "lib/mailtrain/response.rb", "lib/mailtrain/version.rb"]
  s.require_paths = ["lib"]
  s.add_dependency("faraday", "~> 0.9")
end