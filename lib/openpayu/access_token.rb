# -*- encoding : utf-8 -*-
require 'ostruct'

module OpenPayU

  # Create AccessToken

  class AccessToken

    # Creates a AccessToken
    #
    # @param [Hash] data A Hash object containing full {Models::Token} object
    # @return [Documents::Response] Response class object order
    #   with TokenCreateResponse
    # @note Not yet implemented in API
    def self.retrieve
      resp = NewConnection.get_token
      OpenPayU::Models::AccessToken.new(resp.body)
    end

  end
end
