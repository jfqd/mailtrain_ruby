require 'faraday'
require 'json'
require 'mailtrain/response'

module Mailtrain
  class Client

    def initialize(host_url, access_token = nil)
      @url = host_url
      @access_token = access_token || ENV['MAILTRAIN_ACCESS_TOKEN']
      @response = nil
    end

    # Add subscription
    def subscribe(list_id, email, first_name = nil, last_name = nil, timezone = nil, force_subscribe = false, require_confirmation = true, args=nil)
      response = connection.post "/api/subscribe/#{list_id}?access_token=#{@access_token}" do |req|
        params = {
          email:                email,
          first_name:           first_name,
          last_name:            last_name,
          timezone:             timezone,
          force_subscribe:      force_subscribe,
          require_confirmation: require_confirmation
        }.select { |_, value| !value.nil? }
        # add additional parameters
        if !args.nil? && args.class == Hash
          args.each do |key, value|
            if !key.nil? && key.class == Symbol && !value.nil?
              params[key] = value
            end
          end
        end
        req.body = params
      end

      @response = Response.new response.body
      success?
    end

    def unsubscribe(list_id, email)
      response = connection.post "/api/unsubscribe/#{list_id}?access_token=#{@access_token}", {email: email}

      @response = Response.new response.body
      success?
    end

    # Get list of blacklisted emails
    def blacklist(start=0, limit=10000, search='')
      response = connection.get "/api/blacklist/get?access_token=#{@access_token}&start=#{start}&limit=#{limit}&search=#{search}"

      @response = Response.new response.body
      data
    end

    # Add email to blacklist
    def block(email)
      response = connection.post "/api/blacklist/add?access_token=#{@access_token}", {email: email}

      @response = Response.new response.body
      success?
    end

     # delete email to blacklist
    def unblock(email)
      response = connection.post "/api/blacklist/delete?access_token=#{@access_token}", {email: email}

      @response = Response.new response.body
      success?
    end

    def success?
      @response.respond_to?(:success?) ? @response.success? : false
    end

    def error
      @response.error_message
    end

    def data
      @response.data
    end

    protected

    def connection
      @connection ||= Faraday.new(:url => @url) do |faraday|
        faraday.request  :url_encoded
        faraday.adapter  Faraday.default_adapter
        # faraday.response :logger
      end
    end

  end
end