module Wikiranger
  class Wikipedia
    attr_reader :options

    DEFAULT_API_BASE_URI = "https://en.wikipedia.org"

    class Error < StandardError; end
    class UnexpectedResponseError < Wikiranger::Wikipedia::Error; end

    def initialize(options = {})
      @options = options
    end

    def user_contributions(user)
      uri      = "#{api_base_uri}/w/api.php?action=query&format=json&list=usercontribs&uclimit=max&ucuser=#{URI.escape(user)}&ucdir=older"
      response = request(uri)
      if response.code.to_i != 200
        unexpected_response!("Unexpected response code: #{response.code} when retrieving user contributions for #{user}")
      end
      parsed_body   = JSON.parse(response.body)
      contributions = []
      parsed_body["query"]["usercontribs"].each do |contribution|
        contributions.push(Wikiranger::Wikipedia::UserContribution.new(contribution))
      end
      contributions
    end

    private

    def request(uri)
      uri  = URI.parse(uri)
      http = http_object(uri)
      http.get(uri.request_uri)
    end

    def http_object(uri)
      http = Net::HTTP.new(uri.host, uri.port).tap do |h|
        h.use_ssl = (uri.scheme == "https")
      end
    end

    def api_base_uri
      options[:api_base_uri] || DEFAULT_API_BASE_URI
    end

    def unexpected_response!(message)
      fail Wikiranger::Wikipedia::UnexpectedResponseError, message
    end
  end
end