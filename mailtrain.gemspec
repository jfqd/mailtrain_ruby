$:.push File.expand_path("../lib", __FILE__)
require 'mailtrain'

Gem::Specification.new do |s|
  s.name          = 'mailtrain'
  s.version       = Mailtrain::Version
  s.date          = '2019-03-21'
  s.summary       = "Ruby MailTrain API"
  s.description   = "A simple ruby MailTrain API"
  s.authors       = ["benko"]
  s.email         = 'benko.b@shopperplus.com'
  s.files         = ["lib/mailtrain.rb", "lib/mailtrain/client.rb", "lib/mailtrain/response.rb", "lib/mailtrain/version.rb"]
  s.require_paths = ["lib"]
  s.add_dependency("faraday")
end