require "mailtrain/client"
require 'mailtrain/response'
require 'mailtrain/version'

module Mailtrain

  class << self

    def new(host_url, api_key = nil)
      Mailtrain::Client.new(host_url, api_key)
    end

  end

end