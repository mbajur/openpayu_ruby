require 'faraday'

module OpenPayU
  class NewConnection
    def self.get_token
      query = {
        grant_type: 'client_credentials',
        client_id: OpenPayU::Configuration.client_id,
        client_secret: OpenPayU::Configuration.client_secret
      }
      auth_client.post("/pl/standard/user/oauth/authorize?#{query.to_query}")
    end

    private

    def self.auth_client
      @client ||= begin

        Faraday.new(Configuration.get_host) do |conn|
          conn.request(:json)

          conn.response(:json, content_type: /\bjson$/)

          conn.use(Faraday::Response::RaiseError)
          conn.adapter(Faraday.default_adapter)
        end
      end
    end
  end
end
